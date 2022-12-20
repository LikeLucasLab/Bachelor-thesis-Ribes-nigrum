##Lucas Munnes

#PCA Plot all samples

lcpm <- cpm(dge_disp$counts, normalized.lib.sizes = TRUE, prior.count = 3, log=T)
PCA<-prcomp(lcpm, scale=TRUE, center=TRUE)
var_explained <- PCA$sdev^2/sum(PCA$sdev^2)
Summary_PCA<-summary(PCA) 
Scores_PCA<-PCA$rotation            
Loadings_PCA<-PCA$x   
plot(Scores_PCA,ylim=c(-0.5,0.5),xlab=paste0("PC1 ",round(var_explained[1]*100,1)," %"),ylab=paste0("PC2 ",round(var_explained[2]*100,1)," %"),col=c('forestgreen','forestgreen','orange','orange','forestgreen','orange','forestgreen','forestgreen','orange','orange','forestgreen','orange'),cex=1.5, pch=c(16,16,16,16,16,16,17,17,17,17,17,17))

legend("right", inset=.03,legend = c("leaves control","roots control","leaves drought","roots drought"),pch=c(16,17,16,17),cex =1,pt.cex=1.5, col=c('forestgreen','forestgreen','orange','orange'))

#PCA Plot leaves

lcpm_leaves <- cpm(dge_disp$counts[,1:6], normalized.lib.sizes = TRUE, prior.count = 3, log=T)
PCA_leaves<-prcomp(lcpm_leaves, scale=TRUE, center=TRUE)
var_explained_leaves <- PCA_leaves$sdev^2/sum(PCA_leaves$sdev^2)
Summary_PCA_leaves<-summary(PCA_leaves) 
Scores_PCA_leaves<-PCA_leaves$rotation             
Loadings_PCA_leaves<-PCA_leaves$x
plot(Scores_PCA_leaves, ylim=c(-0.8,0.8),xlab=paste0("PC1 ",round(var_explained_leaves[1]*100,1)," %"),ylab=paste0("PC2 ",round(var_explained_leaves[2]*100,1)," %"),col=c('forestgreen','forestgreen','orange','orange','forestgreen','orange'),cex=1.5, pch=c(16,16,16,16,16,16))

legend("right", inset=.03,legend = c("control","drought"),pch=c(16,16),cex =1,pt.cex=1.5, col=c('forestgreen','orange'))


#PCA Plot roots

lcpm_roots <- cpm(dge_disp$counts[,7:12], normalized.lib.sizes = TRUE, prior.count = 3, log=T)
PCA_roots<-prcomp(lcpm_roots, scale=TRUE, center=TRUE)
var_explained_roots <- PCA_roots$sdev^2/sum(PCA_roots$sdev^2)
Summary_PCA_roots<-summary(PCA_roots)
Scores_PCA_roots<-PCA_roots$rotation             
Loadings_PCA_roots<-PCA_roots$x   
plot(Scores_PCA_roots, ylim=c(-0.6,0.6),xlab=paste0("PC1 ",round(var_explained_roots[1]*100,1)," %"),ylab=paste0("PC2 ",round(var_explained_roots[2]*100,1)," %"),col=c('forestgreen','forestgreen','orange','orange','forestgreen','orange'),cex=1.5, pch=c(17,17,17,17,17,17))

legend("right", inset=.03,legend = c("control","drought"),pch=c(17,17),cex =1,pt.cex=1.5, col=c('forestgreen','orange'))


