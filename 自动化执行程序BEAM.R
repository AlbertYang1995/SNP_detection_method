for(i in 1:99) {
  setwd("D:\\workdir\\BEAM")
  shell("D:\\workdir\\BEAM\\BEAMdos.exe")
  data <- readLines("D:\\workdir\\BEAM\\parameters.txt")
  dat = gsub(paste("test",i,".txt", sep=""), paste("test", i+1, ".txt", sep=""), data)
  write.table(dat, "D:\\workdir\\BEAM\\parameters.txt", row.names=F, col.names=F, quote=F)
  data <- readLines("D:\\workdir\\BEAM\\parameters.txt")
  dat = gsub(paste("result",i,".txt",sep=""), paste("result", i+1, ".txt", sep=""), data)
  write.table(dat, "D:\\workdir\\BEAM\\parameters.txt", row.names=F, col.names=F, quote=F)
}

shell("D:\\workdir\\BEAM\\BEAMdos.exe")

for(i in 1:100){
  newdata <- read.csv(paste("D:\\workdir\\BEAM\\result", i, ".txt", sep=""),header = F,skip = 20)
  write.table(newdata, "D:\\workdir\\BEAM\\finalresult.txt", append = TRUE, row.names=F, col.names=F, quote=F) 
}