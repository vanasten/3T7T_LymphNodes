#20200403: Jack van Asten.

library(readr)
Pat0_lymphnodes <- read_csv("~/BIOMR_CACHE/Pat0_lymphnodes.csv")
View(Pat0_lymphnodes)

summary(Pat0_lymphnodes)

# 4/3*PI*a*b*c*1/8 (radius; abc are diameters)
Pt0_Volumes <- 1/6*pi*Pat0_lymphnodes[1]*Pat0_lymphnodes[2]*Pat0_lymphnodes[3]

boxplot(Pt0_Volumes,col="light blue")
boxplot(Pat0_lymphnodes,col="light blue")

# for histogram or (bar)plot, make row out of column first
LNsize <- data.frame(t(Pt0_Volumes))
#?tibble::rownames_to_column(LNsize, var="LN_sizes")
x <- (1:length(LNsize))

hist(as.numeric(LNsize),breaks=15,xlab="lymph node size in mm^3",ylab="frequency", main="Scored nodes Pat0",col="light green")

plot(x,LNsize,type="l",col="blue")
#ggplot(LNsize,aes(x = rowname,y=t.LNsize.)) +   stat_identity(geom = "bar")

f <- as.numeric(LNsize)
names(f) <- names(LNsize)
barplot(f,xlab="lymphnode",ylab="size in mm^3",main="Pat0")

