for(i in 1:99) {
  setwd("D:\\workdir\\BOOST")
  shell("D:\\workdir\\BOOST\\BOOSTx64.exe")
  
  if (file.info("D:\\workdir\\BOOST\\InteractionRecords.txt") > 0) {
    newdata <- read.csv("D:\\workdir\\BOOST\\InteractionRecords.txt", header = F, skip = 0)
    write.table(newdata, "D:\\workdir\\BOOST\\finalresult.txt", append = TRUE, row.names=F, col.names=F, quote=F) 
  }
 
  data <- readLines("D:\\workdir\\BOOST\\filenamelist.txt")
  dat = gsub(paste("test",i,".txt", sep=""), paste("test", i+1, ".txt", sep=""), data)
  write.table(dat, "D:\\workdir\\BOOST\\filenamelist.txt", row.names=F, col.names=F, quote=F)
}

shell("D:\\workdir\\BOOST\\BOOSTx64.exe")

if (file.info("D:\\workdir\\BOOST\\InteractionRecords.txt") > 0) {
  newdata <- read.csv("D:\\workdir\\BOOST\\InteractionRecords.txt", header = F, skip = 0)
  write.table(newdata, "D:\\workdir\\BOOST\\finalresult.txt", append = TRUE, row.names=F, col.names=F, quote=F) 
}
