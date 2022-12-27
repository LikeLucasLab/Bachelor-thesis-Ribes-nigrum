library(openxlsx)

write.xlsx(x = UpGenes.roots, file = "UpGenes.roots.xlsx")
write.xlsx(x = DownGenes.roots, file = "DownGenes.roots.xlsx")
write.xlsx(x = UpGenes.leaves, file = "UpGenes.leaves.xlsx")
write.xlsx(x = DownGenes.leaves, file = "DownGenes.leaves.xlsx")

UpGenes.roots_row <- as.data.frame(rownames(UpGenes.roots))
DownGenes.roots_row <- as.data.frame(rownames(DownGenes.roots))
UpGenes.leaves_row <- as.data.frame(rownames(UpGenes.leaves))
DownGenes.leaves_row <- as.data.frame(rownames(DownGenes.leaves))

write.xlsx(x = UpGenes.roots_row, file = "UpGenes.roots_row.xlsx")
write.xlsx(x = DownGenes.roots_row, file = "DownGenes.roots_row.xlsx")
write.xlsx(x = UpGenes.leaves_row, file = "UpGenes.leaves_row.xlsx")
write.xlsx(x = DownGenes.leaves_row, file = "DownGenes.leaves_row.xlsx")
