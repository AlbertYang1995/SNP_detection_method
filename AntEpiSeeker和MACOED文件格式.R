for(i in 1:9) {
  mark_text = paste("0.025HER0.4MAF_EDM-1_00", i, sep = "")
  mydata <- read.table(paste("D:\\workdir\\MACOED\\0.025HER0.4MAF_EDM-1\\", mark_text, ".txt", sep = ""), header = TRUE)
  write.table(mydata, append = FALSE, file = paste("D:\\workdir\\MACOED\\test", i, ".txt", sep=""), row.names = FALSE, quote = FALSE, sep = ",")
}

for(i in 10:99) {
  mark_text = paste("0.025HER0.4MAF_EDM-1_0", i, sep = "")
  mydata <- read.table(paste("D:\\workdir\\MACOED\\0.025HER0.4MAF_EDM-1\\", mark_text, ".txt", sep = ""), header = TRUE)
  write.table(mydata, append = FALSE, file = paste("D:\\workdir\\MACOED\\test", i, ".txt", sep = ""), row.names = FALSE, quote = FALSE, sep = ",")
}

mydata <- read.table("D:\\workdir\\MACOED\\0.025HER0.4MAF_EDM-1\\0.025HER0.4MAF_EDM-1_100.txt", header = TRUE)
write.table(mydata, append = FALSE, file = paste("D:\\workdir\\MACOED\\test", 100, ".txt", sep = ""), row.names = FALSE, quote = FALSE, sep = ",")
