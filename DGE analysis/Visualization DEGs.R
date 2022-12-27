##Lucas Munnes

##venn-diagrams

if (!require(devtools)) install.packages("devtools")
devtools::install_github("gaospecial/ggVennDiagram")

if (!require(devtools)) install.packages("devtools")
devtools::install_github("yanlinlin82/ggvenn")

library(ggVennDiagram)
library(ggplot2)
library(ggvenn)

Genes.leaves_row <- as.data.frame(rownames(Genes.leaves))
Genes.roots_row <- as.data.frame(rownames(Genes.roots))


x <- list(
  regulated_leaves  = as.character(Genes.leaves_row[,1]), 
  regulated_roots = as.character(Genes.roots_row[,1])
)

ggVennDiagram(x[1:2], lwd = 0.8, lty = 1, label_alpha = 0,category.names = c("DEGs leaves","DEGs roots"))+scale_fill_gradient(low = "#F4FAFE", high = "#4981BF", "DEGs")+ scale_color_manual(values = c("regulated_leaves" = "yellow","regulated_roots" ="steelblue",'C' = 'red', 'D' = 'black'))

UpGenes.leaves_row <- as.data.frame(rownames(UpGenes.leaves))
DownGenes.leaves_row <- as.data.frame(rownames(DownGenes.leaves))
UpGenes.roots_row <- as.data.frame(rownames(UpGenes.roots))
DownGenes.roots_row <- as.data.frame(rownames(DownGenes.roots))

y <- list(
  Upregulated_leaves  = as.character(UpGenes.leaves_row[,1]), 
  Upregulated_roots = as.character(UpGenes.roots_row[,1]),
  Downregulated_leaves = as.character(DownGenes.leaves_row[,1]), 
  Downregulated_roots = as.character(DownGenes.roots_row[,1])
)

names(y) <- c("Up-regulated leaves","Up-regulated roots","Down-regulated leaves", "Down-regulated roots")

ggvenn(y,fill_color = c("#FF0000", "#FF5D5D", "#016FB3", "#34B1FE"),stroke_size = 0.7, set_name_size = 5, text_size=4.5)

##volcanoplot leaves

## cutoffs for both the p-values and the log2 fold changes:
lfc = 0
pval = 0.25

#Dataframe that contains our transformed p-values and the log2 fold changes of the respective genes:
tab = data.frame(logFC = res.leaves$logFC, negLogPval = -log10(res.leaves$FDR))
head(tab)

#Plot
par(cex=1.2, mfrow=c(1,2))
plot(tab, pch = 16, cex = 0.6, 
     xlab = expression(log[2]~fold~change),ylab = expression(-log[10]~FDR),
     xlim = c(-12,12),
     ylim = c(0,2))

sigGenes = (abs(res.leaves$logFC) > lfc & tab$negLogPval > -log10(pval))
points(tab[sigGenes, ], pch = 16, cex = 0.8, col = "red")
abline(h = -log10(pval), col = "green3", lty = 2)
mtext(paste("FDR =", pval), side = 4, at = -log10(pval), cex = 0.8, line = 0.5, las = 1)

##volcanoplot roots

#Dataframe that contains our transformed p-values and the log2 fold changes of the respective genes:
tab = data.frame(logFC = res.roots$logFC, negLogPval = -log10(res.roots$FDR))


#Plot
plot(tab, pch = 16, cex = 0.6, 
     xlab = expression(log[2]~fold~change),ylab = expression(-log[10]~FDR),
     xlim = c(-12,12),
     ylim = c(0,4))
   
sigGenes = (abs(res.roots$logFC) > lfc & tab$negLogPval > -log10(pval))
points(tab[sigGenes, ], pch = 16, cex = 0.8, col = "red")
abline(h = -log10(pval), col = "green3", lty = 2)
mtext(paste("FDR =", pval), side = 4, at = -log10(pval), cex = 0.8, line = 0.5, las = 1)
