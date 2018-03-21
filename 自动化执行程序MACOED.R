for(i in 1:99) {
  setwd("D:\\workdir\\MACOED")
  shell("D:\\workdir\\MACOED\\MACOED.exe")
  data <- readLines("D:\\workdir\\MACOED\\parameters.txt")
  dat = gsub(paste("test",i,".txt", sep=""), paste("test", i+1, ".txt", sep=""), data)
  write.table(dat, "D:\\workdir\\MACOED\\parameters.txt", row.names=F, col.names=F, quote=F)
  data <- readLines("D:\\workdir\\MACOED\\parameters.txt")
  dat = gsub(paste("result",i,".txt",sep=""), paste("result", i+1, ".txt", sep=""), data)
  write.table(dat, "D:\\workdir\\MACOED\\parameters.txt", row.names=F, col.names=F, quote=F)
}

shell("D:\\workdir\\MACOED\\MACOED.exe")

for(i in 1:100){
  newdata <- read.csv(paste("D:\\workdir\\MACOED\\result", i, ".txt", sep=""),header = F,skip = 0)
  write.table(newdata, "D:\\workdir\\MACOED\\finalresult.txt", append = TRUE, row.names=F, col.names=F, quote=F) 
}