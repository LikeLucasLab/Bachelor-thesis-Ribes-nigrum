##Lucas Munnes

##Export of calculated data for furter analysis with Excel



#Export logCPM

write.csv(lcpm, file = "exported/logCPM.csv")

#Export Loadings_PCAs

write.csv(Loadings_PCA_leaves, file = "exported/Loadings_PCA_leaves.csv") #Leaves
write.csv(Loadings_PCA_roots, file = "exported/Loadings_PCA_roots.csv") #Roots

#Export DEGs

write.csv(x = UpGenes.leaves, file = "exported/UpGenes_leaves.csv") #DEGs up-regulated in leaves under drought
write.csv(x = DownGenes.leaves, file = "exported/DownGenes_leaves.csv")#DEGs down-regulated in leaves under drought
write.csv(x = UpGenes.roots, file = "exported/UpGenes_roots.csv")#DEGs up-regulated in roots under drought
write.csv(x = DownGenes.roots, file = "exported/DownGenes_roots.csv")#DEGs down-regulated in roots under drought

