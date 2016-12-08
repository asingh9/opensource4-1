library(readr)
binary <- read_csv("~/binary.csv")
View(binary)
df <- as.data.frame(binary)
head(df)
binary <- NULL
for (i in 1:4) {
  binary <- cbind(binary, rep(as.character(df[,i]), 1))
}
binary <- as.data.frame(binary)
names(binary) <- names(df)[1:4]
summary(binary)
library(arules)
#install.packages("arules")
rules <- apriori(binary, control = list(verbose=F), 
                 parameter = list(minlen=1, supp=0.010, conf=0.8))
quality(rules) <- round(quality(rules), digits = 3)
rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)
subset.matrix <- is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm = T) >= 1
which(redundant)
rules.pruned <- rules.sorted[!redundant]
library(arulesViz)
plot(rules.pruned)
plot(rules.pruned, method="grouped")
plot(rules.pruned, method="graph")

