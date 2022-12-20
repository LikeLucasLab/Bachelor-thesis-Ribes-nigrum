##Lucas Munnes


library(edgeR)


#Data preparation 

counts <- "leaves_featureCounts.txt"
fc_res_leaves <- read.table(counts, header = T, row.names = 1)
colnames(fc_res_leaves) <- sub("X.mnt.data.lucas.Bachelor_thesis.Minimap2.", "", colnames(fc_res_leaves))
colnames(fc_res_leaves) <- sub(".bam", "", colnames(fc_res_leaves))

counts <- "roots_featureCounts.txt"
fc_res_roots <- read.table(counts, header = T, row.names = 1)
colnames(fc_res_roots) <- sub("X.mnt.data.lucas.Bachelor_thesis.Minimap2.", "", colnames(fc_res_roots))
colnames(fc_res_roots) <- sub(".bam", "", colnames(fc_res_roots))

group = c("control_leaves","control_leaves", "drought_leaves", "drought_leaves", "control_leaves", "drought_leaves","control_roots", "control_roots", "drought_roots", "drought_roots","control_roots","drought_roots")

fc_res <- cbind(fc_res_leaves,fc_res_roots[6:11])


#Normalization tximport (Love et al. 2022)

cts = as.matrix(fc_res[6:17])

normMat= as.matrix(fc_res[c(5,5,5,5,5,5,5,5,5,5,5,5)])

normMat <- normMat / exp(rowMeans(log(normMat)))
normCts <- cts / normMat
eff.lib <- calcNormFactors(normCts) * colSums(normCts)
normMat <- sweep(normMat, 2, eff.lib, "*")
normMat <- log(normMat)


#DGEList creating 

dge <- DGEList(cts)
dge<- scaleOffset(dge, normMat)

design <- model.matrix(~0+group)

keep <- filterByExpr(dge, design = design, group = group, large.n= 3,min.prop=0.5)
dge_filtered <- dge[keep,keep.lib.sizes=FALSE]

dge_disp <- estimateDisp(dge_filtered, design, robust=TRUE)

dge_disp$samples$group <- c("control_leaves","control_leaves", "drought_leaves", "drought_leaves", "control_leaves", "drought_leaves","control_roots", "control_roots", "drought_roots", "drought_roots","control_roots","drought_roots")

fit <- glmQLFit(dge_disp, design, robust=TRUE)

my.contrasts <- makeContrasts(roots=groupdrought_roots-groupcontrol_roots, leaves=groupdrought_leaves-groupcontrol_leaves, levels=design)



#differential expressed genes leaves 

qlf.leaves <- glmQLFTest(fit, contrast=my.contrasts[,"leaves"])
qlf.leaves$comparison <- "Ribes nigrum leaves drought vs. control"
res.leaves <- topTags(qlf.leaves, n=Inf)$table

#cutoff p < 0.05 and logFC <0 or >0

Genes.leaves <- res.leaves[ res.leaves$PValue < 0.05,]
UpGenes.leaves <- Genes.leaves[ Genes.leaves$logFC > 0, ]
DownGenes.leaves <- Genes.leaves[ Genes.leaves$logFC < 0,]

#differential expressed genes roots 

qlf.roots <- glmQLFTest(fit, contrast=my.contrasts[,"roots"])
qlf.roots$comparison <- "Ribes nigrum roots drought vs. control"
res.roots <- topTags(qlf.roots, n=Inf)$table

#cutoff p < 0.05 and logFC <0 or >0

Genes.roots <- res.roots[ res.roots$PValue < 0.05,]
UpGenes.roots <- Genes.roots[ Genes.roots$logFC > 0, ]
DownGenes.roots <- Genes.roots[ Genes.roots$logFC < 0,]

