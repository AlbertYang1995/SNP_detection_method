MutualEntropy2 <- function(dot.one, dot.two) {
  #
  # I(X1;X2|Y) = Ep(x1,x2,y)log(p(y) * p(x1,x2,y) / (p(x1,y) * p(x2,y)))
  #
  sumtotal <- 0
  for(k in 0:1) {
    for(m in 0:2) {
      for(n in 0:2) {
        sum1 <- sum(plaintext2matrix[, dot.one] == m &
                      plaintext2matrix[, dot.two] == n &
                      plaintext2matrix[, ncol(plaintext2matrix)] == k) / samplecount  # p(x1,x2,y)
        sum2 <- sum(plaintext2matrix[, ncol(plaintext2matrix)] == k) / samplecount  # p(y)  
        sum3 <- sum(plaintext2matrix[, dot.one] == m &
                      plaintext2matrix[, ncol(plaintext2matrix)] == k) / samplecount  # p(x1,y)
        sum4 <- sum(plaintext2matrix[, dot.two] == n &
                      plaintext2matrix[, ncol(plaintext2matrix)] == k) / samplecount  # p(x2,y)
        sumtotal <- sumtotal + sum1 * log2(sum2 * sum1 / (sum3 * sum4))
      }
    }
  }
  return(sumtotal)
}


K2Score <- function(dot.one, dot.two, k) {
  if(k == 2) {
    combination <- matrix(c(0, 0, 0, 1, 0, 2, 1, 0, 1, 1, 1, 2, 2, 0, 2, 1, 2, 2),
                          nrow = 9, ncol = 2, byrow = T)
    sum5 <- 0
    for(i in 1:9) {
      sum2 <- 0
      sum4 <- 0
      sum1 <- sum(plaintext2matrix[, dot.one] == combination[i, 1] &
                    plaintext2matrix[, dot.two] == combination[i, 2])
      # cat("sum1 =", sum1, "\n")
      for(b in 1:(sum1 + 1)) {
        sum2 <- sum2 + log2(b)
      }
      for(j in 0:1) {
        sum3 <- sum(plaintext2matrix[, dot.one] == combination[i, 1] &
                      plaintext2matrix[, dot.two] == combination[i, 2] &
                      plaintext2matrix[, ncol(plaintext2matrix)] == j)
        # cat("sum3 =", sum3, "\n")
        for(d in 1:sum3) {
          sum4 <- sum4 + log2(d)
        }
      }
      sum5 <- sum5 + sum2 - sum4
    }
    return(sum5)
  }
}

sink("finaltest.txt")
# textpath <- "D:\\workdir\\finaltest.txt"
# read the dataset
for(r in 1:9) {
  textname <- paste("D:\\workdir\\0.4HER0.2MAF_EDM-1\\0.4HER0.2MAF_EDM-1_00", r, ".txt", sep = "")
  plaintext <- read.table(textname, header = T, sep = "\t")
  plaintext2matrix <- as.matrix(plaintext)
  # plain <- as.matrix(as.numeric(plaintext), nrow = 2000, ncol = 41)
  
  # set the orignal parameters
  k <- 2
  samplecount <- nrow(plaintext2matrix)
  snpnumber <- ncol(plaintext2matrix) - 1
  tempstore <- matrix(NA, nrow = 5000, ncol = 4)
  p <- 1
  
  
  for(i in 1:(snpnumber - 1)) {
    for(j in (i + 1):snpnumber) {
      if(i == j) break
      score <- MutualEntropy2(i, j)
      tempstore[p, 1] <- i
      tempstore[p, 2] <- j
      tempstore[p, 3] <- score0
      tempstore[p, 4] <- 5000
      p <- p + 1
    }
  }
  
  tempstore <- na.omit(tempstore)
  
  
  for(i in 1:nrow(tempstore)) {
    score <- K2Score(tempstore[i, 1], tempstore[i, 2], k)
    tempstore[i, 4] <- score
  }
  

  for(i in 1:nrow(tempstore)) {
    if(tempstore[i, 3] > 0.05 & tempstore[i, 4] < 2000)
      cat("节点", tempstore[i, 1], "和", tempstore[i, 2], "有强关联", "\n", append = T)
  }
}

for(r in 10:99) {
  textname <- paste("D:\\workdir\\0.4HER0.2MAF_EDM-1\\0.4HER0.2MAF_EDM-1_0", r, ".txt", sep = "")
  plaintext <- read.table(textname, header = T, sep = "\t")
  plaintext2matrix <- as.matrix(plaintext)
  # plain <- as.matrix(as.numeric(plaintext), nrow = 2000, ncol = 41)
  
  # set the orignal parameters
  k <- 2
  samplecount <- nrow(plaintext2matrix)
  snpnumber <- ncol(plaintext2matrix) - 1
  tempstore <- matrix(NA, nrow = 5000, ncol = 4)
  p <- 1
  
  
  for(i in 1:(snpnumber - 1)) {
    for(j in (i + 1):snpnumber) {
      if(i == j) break
      score <- MutualEntropy2(i, j)
      tempstore[p, 1] <- i
      tempstore[p, 2] <- j
      tempstore[p, 3] <- score
      tempstore[p, 4] <- 5000
      p <- p + 1
    }
  }
  
  tempstore <- na.omit(tempstore)
  
  
  for(i in 1:nrow(tempstore)) {
    score <- K2Score(tempstore[i, 1], tempstore[i, 2], k)
    tempstore[i, 4] <- score
  }
  

  for(i in 1:nrow(tempstore)) {
    if(tempstore[i, 3] > 0.05 & tempstore[i, 4] < 2000)
      cat("节点", tempstore[i, 1], "和", tempstore[i, 2], "有强关联", "\n", append = T)
  }
}

textname <- paste("D:\\workdir\\0.4HER0.2MAF_EDM-1\\0.4HER0.2MAF_EDM-1_100", r, ".txt", sep = "")
plaintext <- read.table(textname, header = T, sep = "\t")
plaintext2matrix <- as.matrix(plaintext)
# plain <- as.matrix(as.numeric(plaintext), nrow = 2000, ncol = 41)

# set the orignal parameters
k <- 2
samplecount <- nrow(plaintext2matrix)
snpnumber <- ncol(plaintext2matrix) - 1
tempstore <- matrix(NA, nrow = 5000, ncol = 4)
p <- 1


for(i in 1:(snpnumber - 1)) {
  for(j in (i + 1):snpnumber) {
    if(i == j) break
    score <- MutualEntropy2(i, j)
    tempstore[p, 1] <- i
    tempstore[p, 2] <- j
    tempstore[p, 3] <- score
    tempstore[p, 4] <- 5000
    p <- p + 1
  }
}

tempstore <- na.omit(tempstore)


for(i in 1:nrow(tempstore)) {
  score <- K2Score(tempstore[i, 1], tempstore[i, 2], k)
  tempstore[i, 4] <- score
}


for(i in 1:nrow(tempstore)) {
  if(tempstore[i, 3] > 0.05 & tempstore[i, 4] < 2000)
    cat("节点", tempstore[i, 1], "和", tempstore[i, 2], "有强关联", "\n", append = T)
}



