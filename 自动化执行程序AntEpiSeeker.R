for(i in 1:99) {
  setwd("D:\\workdir\\AntEpiSeeker")
  shell("D:\\workdir\\AntEpiSeeker\\AntEpiSeeker.exe")
  data <- readLines("D:\\workdir\\AntEpiSeeker\\parameters.txt")
  dat = gsub(paste("test",i,".txt", sep=""), paste("test", i+1, ".txt", sep=""), data)
  write.table(dat, "D:\\workdir\\AntEpiSeeker\\parameters.txt", row.names=F, col.names=F, quote=F)
  data <- readLines("D:\\workdir\\AntEpiSeeker\\parameters.txt")
  dat = gsub(paste("result",i,".txt",sep=""), paste("result", i+1, ".txt", sep=""), data)
  write.table(dat, "D:\\workdir\\AntEpiSeeker\\parameters.txt", row.names=F, col.names=F, quote=F)
}

shell("D:\\workdir\\AntEpiSeeker\\AntEpiSeeker.exe")

for(i in 1:100){
  newdata <- read.csv(paste("D:\\workdir\\AntEpiSeeker\\result", i, ".txt", sep=""), header = F)
  write.table(newdata, "D:\\workdir\\AntEpiSeeker\\finalresult.txt", append = TRUE, row.names=F, col.names=F, quote=F) 
}