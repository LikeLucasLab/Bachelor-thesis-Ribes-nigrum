##Lucas Munnes

##venn-diagram

if (!require(devtools)) install.packages("devtools")
devtools::install_github("gaospecial/ggVennDiagram")

library(ggVennDiagram)
library(ggplot2)

Genes.leaves_row <- as.data.frame(rownames(Genes.leaves))
Genes.roots_row <- as.data.frame(rownames(Genes.roots))


y <- list(
  regulated_leaves  = as.character(Genes.leaves_row[,1]), 
  regulated_roots = as.character(Genes.roots_row[,1])
)

ggVennDiagram(y[1:2], lwd = 0.8, lty = 1, label_alpha = 0,category.names = c("DEGs leaves","DEGs roots"))+scale_fill_gradient(low = "#F4FAFE", high = "#4981BF", "DEGs")+ scale_color_manual(values = c("regulated_leaves" = "yellow","regulated_roots" ="steelblue",'C' = 'red', 'D' = 'black'))


##volcanoplot leaves

## cutoffs for both the p-values and the log2 fold changes:
lfc = 0
pval = 0.05

#Dataframe that contains our transformed p-values and the log2 fold changes of the respective genes:
tab = data.frame(logFC = res.leaves$logFC, negLogPval = -log10(res.leaves$PValue))
head(tab)

#Plot
par(cex=1.2, mfrow=c(1,2))
plot(tab, pch = 16, cex = 0.6, 
     xlab = expression(log[2]~fold~change),ylab = expression(-log[10]~pvalue),
     xlim = c(-12,12))

sigGenes = (abs(res.leaves$logFC) > lfc & tab$negLogPval > -log10(pval))
points(tab[sigGenes, ], pch = 16, cex = 0.8, col = "red")
abline(h = -log10(pval), col = "green3", lty = 2)
mtext(paste("pval =", pval), side = 4, at = -log10(pval), cex = 0.8, line = 0.5, las = 1)

##volcanoplot roots

#Dataframe that contains our transformed p-values and the log2 fold changes of the respective genes:
tab = data.frame(logFC = res.roots$logFC, negLogPval = -log10(res.roots$PValue))


#Plot
plot(tab, pch = 16, cex = 0.6, 
     xlab = expression(log[2]~fold~change),ylab = expression(-log[10]~pvalue),
     xlim = c(-12,12))
   
sigGenes = (abs(res.roots$logFC) > lfc & tab$negLogPval > -log10(pval))
points(tab[sigGenes, ], pch = 16, cex = 0.8, col = "red")
abline(h = -log10(pval), col = "green3", lty = 2)
mtext(paste("pval =", pval), side = 4, at = -log10(pval), cex = 0.8, line = 0.5, las = 1)
