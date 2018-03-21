for(i in 1:9) {
  mark_text = paste("1.0HER0.2MAF3LOC_EDM-1_00", i, sep = "")
  mydata <- read.table(paste("D:\\workdir\\1.0HER0.2MAF3LOC_EDM-1\\", mark_text, ".txt", sep = ""), header = TRUE)
  newcol <- data.frame(0, nrow = 2000, ncol = 1)
  newcol <- mydata[, 41]
  mydata <- mydata[, -41]
  mydata_trans <- cbind(newcol, mydata)
  write.table(mydata_trans, append = FALSE, file = paste("D:\\workdir\\data2.0\\test", i, ".txt", sep=""), row.names = F, col.names = F, quote = F)
}

for(i in 10:99) {
  mark_text = paste("1.0HER0.2MAF3LOC_EDM-1_0", i, sep = "")
  mydata <- read.table(paste("D:\\workdir\\1.0HER0.2MAF3LOC_EDM-1\\", mark_text, ".txt", sep = ""), header = TRUE)
  newcol <- data.frame(0, nrow = 2000, ncol = 1)
  newcol <- mydata[,41]
  mydata <- mydata[,-41]
  mydata_trans <- cbind(newcol, mydata)
  write.table(mydata_trans, append = FALSE, file = paste("D:\\workdir\\data2.0\\test", i, ".txt", sep = ""), row.names = F, col.names = F, quote = F)
}

mydata <- read.table("D:\\workdir\\1.0HER0.2MAF3LOC_EDM-1\\1.0HER0.2MAF3LOC_EDM-1_100.txt", header = TRUE)
newcol <- data.frame(0, nrow = 2000, ncol = 1)
newcol <- mydata[,41]
mydata <- mydata[,-41]
mydata_trans <- cbind(newcol, mydata)
write.table(mydata_trans, append = FALSE, file = paste("D:\\workdir\\data2.0\\test", 100, ".txt", sep = ""), row.names = F, col.names = F, quote = F)
