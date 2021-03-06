# Clustering For Customer Segmentation

set.seed(1234); (age = ceiling(rnorm(50, 45, 10)))
set.seed(1234);(income = ceiling(rnorm(50, 100000, 10000)))
set.seed(1234);(children = sample(c(1,2,3), size=50, replace=T, prob=c(.4,.3,.2)))
customers = data.frame(age, income, children)
head(customers)

# No of Clusters
library(NbClust)
nc = NbClust(customers, distance="euclidean", 
             min.nc=2, max.nc=15, method="average")
#without scaling
km1 = kmeans(customers, centers=3)
km1$centers

#----
#------------------------------------------------------------------------
#plots
library(cluster)
cluster::clusplot(customers, km1$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)

#https://blog.datascienceheroes.com/short-lesson-on-cluster-analysis/
library(clusplus)
plot_clus_coord(km1, customers)





#case1 : only age
age1 = data.frame(age)
clust1 = kmeans(age1, 3)
clust1$cluster
combined = cbind(age1, clust1$cluster)
plot(age1$age)
plot(age1$age, col=clust1$cluster, pch=c(11,12,14))

#case1 : only income
income1 = data.frame(income)
clust1a = kmeans(income, 4)
clust1a$cluster
(combined = cbind(income1, clust1a$cluster))
combined[order(clust1a$cluster),]
plot(income1$income, col=clust1a$cluster, pch=c(11,12,14,15))




df2 = data.frame(age, income)
clust2 = kmeans(df2, 4)
clust2$cluster
combined2 = cbind(df2, clust2$cluster)
head(combined2)
plot(x=df2$age, y=df2$income, col=clust2$cluster, pch=c(11,12,14,17))
df2
df2[clust2$cluster==3,]



(gender = sample(c(1,2), size=1000, replace=T, prob=c(.6,.4)))
table(gender)
prop.table(table(gender))
