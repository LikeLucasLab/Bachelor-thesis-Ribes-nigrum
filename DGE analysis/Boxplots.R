##Lucas Munnes

RNA_Seq<-read.table(file="exported/logCPM.csv",header = T,sep=",")

## Visualization lcpm leaves boxplot

annotation = c("Pectin methylesterase","Zinc finger protein 1","Auxin transport protein BIG ","HSFA1")
gene_of_interest = c("RibesNigrum.59934", "RibesNigrum.49861","RibesNigrum.35394","RibesNigrum.11143")
names<-c("Control","Control","Drought",  "Drought","Control","Drought")
par(mfrow=c(2,2))
n <- 4
i <- 1

for(i in 1:n) {


RNA_Seq_short<-t(RNA_Seq[RNA_Seq==gene_of_interest[i], 2:7])
RNA_Seq_short2<-cbind(names,RNA_Seq_short)
colnames(RNA_Seq_short2)<-c("Sample",RNA_Seq[1,1])
boxplot(as.numeric(RNA_Seq_short2[,2])~RNA_Seq_short2[,1],
        yaxt = "n",
        ylab="log2CPM",  
        xlab="Treatment", 
        main= paste(gene_of_interest[i]," - ",annotation[i]),
        cex.main=1.5,
        cex.axis =1.5,
        cex.lab = 1.5,
        col=c('forestgreen','orange'))
axis(side = 2,las = 2,mgp = c(3, 1, 0))

}

## Visualization lcpm roots boxplot

annotation = c("Aquaporin PIP 1;3","Auxin transcriptional repressor AUX28","Cytokinin signal transducer","Agamous-like MADS-box protein MADS1")
gene_of_interest = c("RibesNigrum.18671", "RibesNigrum.13887","RibesNigrum.17964","RibesNigrum.10094")
names<-c("Control","Control","Drought",  "Drought","Control","Drought")
par(mfrow=c(2,2))
n <- 4
i <- 1

for(i in 1:n) {
  

RNA_Seq_short<-t(RNA_Seq[RNA_Seq==gene_of_interest[i], 8:13])
RNA_Seq_short2<-cbind(names,RNA_Seq_short)
colnames(RNA_Seq_short2)<-c("Sample",gene_of_interest[i])
boxplot(as.numeric(RNA_Seq_short2[,2])~RNA_Seq_short2[,1],
        yaxt = "n",
        ylab="log2CPM", 
        xlab="Treatment", 
        main= paste(gene_of_interest[i]," - ",annotation[i]),
        cex.main=1.5,
        cex.axis =1.5,
        cex.lab = 1.5,
        col=c('forestgreen','orange'))
axis(side = 2,las = 2,mgp = c(3, 1, 0))

}

## Visualization comparison boxplot

annotation = c("Transcription factor MYBS3","bHLH Transcription factor")
gene_of_interest = c("RibesNigrum.59772","RibesNigrum.22000")
names<-c("Leaves control","Leaves control","Leaves drought","Leaves drought","Leaves control","Leaves drought", "Roots control", "Roots control", "Roots drought", "Roots drought", "Roots control", "Roots drought")
par(mfrow=c(1,2))
n <- 2
i <- 1

for(i in 1:n) {
  
  
RNA_Seq_short<-t(RNA_Seq[RNA_Seq==gene_of_interest[i], 2:13])
colnames(RNA_Seq_short)<-c(gene_of_interest[i])
RNA_Seq_short2<-cbind(names,RNA_Seq_short)
colnames(RNA_Seq_short2)<-c("Sample",gene_of_interest[i])
boxplot(as.numeric(RNA_Seq_short2[,2])~RNA_Seq_short2[,1],
        yaxt = "n",
        ylab="log2CPM", 
        xlab="Treatment", 
        main= paste(gene_of_interest[i]," - ",annotation[i]),
        cex.main=1.5,
        cex.axis =1.2,
        cex.lab = 1.2,
        col=c('forestgreen','orange','forestgreen','orange'))

axis(side = 2,las = 2,mgp = c(3, 1, 0))
}