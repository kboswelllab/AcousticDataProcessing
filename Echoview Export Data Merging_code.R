setwd("C:/Users/allwhite/Desktop/Autocorrelation/Manuscript/nasc5x5_2017/")
file.list<-list.files(path = "C:/Users/allwhite/Desktop/Autocorrelation/Manuscript/nasc5x5_2017/")
file.list
allfiles<-vector('list',length=length(file.list))
columns<-vector('list',length=length(file.list))
mergedfiles<-vector('list',length=length(file.list))
for(i in 1:length(file.list)){
  file.i<-read.csv(file.list[i])
  file.i$file_name<-file.list[i]
  file.i$site<-i
  allfiles[[i]]<-file.i
  columns[[i]]<-colnames(file.i)
  print(length(colnames(file.i)))
}

common.columns<-Reduce(intersect,list(columns[[1]],columns[[2]],columns[[3]],columns[[4]],columns[[5]],columns[[6]],columns[[7]],columns[[8]]))
common.columns

for(i in 1:length(file.list)){
  file.i<-allfiles[[i]]
  m.file.i<-file.i[,common.columns]
  print(length(colnames(m.file.i)))
  mergedfiles[[i]]<-m.file.i
}

merged.data<-as.data.frame(do.call(rbind,mergedfiles))
tail(merged.data)
write.csv(merged.data,'C:/Users/allwhite/Desktop/Autocorrelation/Manuscript/5x5nasc_2017.csv')
