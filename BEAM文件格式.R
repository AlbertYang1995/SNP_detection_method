for(i in 1:9) {
  mark_text = paste("0.2HER0.3MAF_EDM-1_00", i, sep = "")
  mydata <- read.table(paste("D:\\workdir\\0.2HER0.3MAF_EDM-1\\", mark_text, ".txt", sep = ""), header = TRUE)
  names(mydata)[41] <- "ID"
  mydata <- cbind(mydata[41], mydata[,1:40])
  mydata_trans <- t(mydata)
  write.table(mydata_trans, append = FALSE, file = paste("D:\\workdir\\result\\test", i, ".txt", sep=""), row.names = T, col.names = F, quote = F, sep = "\t")
}

for(i in 10:99) {
  mark_text = paste("0.2HER0.3MAF_EDM-1_0", i, sep = "")
  mydata <- read.table(paste("D:\\workdir\\0.2HER0.3MAF_EDM-1\\", mark_text, ".txt", sep = ""), header = TRUE)
  names(mydata)[41] <- "ID"
  mydata <- cbind(mydata[41], mydata[,1:40])
  mydata_trans <- t(mydata)
  write.table(mydata_trans, append = FALSE, file = paste("D:\\workdir\\result\\test", i, ".txt", sep = ""), row.names = T, col.names = F, quote = F, sep = "\t")
}

mydata <- read.table("D:\\workdir\\0.2HER0.3MAF_EDM-1\\0.2HER0.3MAF_EDM-1_100.txt", header = TRUE)
names(mydata)[41] <- "ID"
mydata <- cbind(mydata[41], mydata[,1:40])
mydata_trans <- t(mydata)
write.table(mydata_trans, append = FALSE, file = paste("D:\\workdir\\result\\test", 100, ".txt", sep = ""), row.names = T, col.names = F, quote = F, sep = "\t")
