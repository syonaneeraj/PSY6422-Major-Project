setwd("C:/Users/Syona Neeraj/Desktop") #setting working directory
#load all the necessary libraries
library(here)
library(tidyverse)
library(knitr)

#load the data
Data <- read.csv(here("Data", "Fried food.csv")) #loaded the data
View(Data)
head(Data)

# Wrangling the data by removing rows and columns not needed
Data <- Data[-c(1),]
Data <- Data%>% select(-P)
Data <- Data[-c(1),]
names(Data)

#Renaming columns for convenience
Data2 <- Data%>%
  rename(serving_0 = None..n.15.166.,serving_1 = X.1.serving.week..n.38.482.,serving_2 = X1.2.servings.week..n.33.210.,serving_3 = X3.6.servings.week..n.15.480.,serving_max = â..1.serving.day..n.4628.) 
names(Data2)

#slice the dataframe into subsets
dfrace <- Data2 %>% slice_head(n = 5)
df_diseases <- Data2 %>% slice(39:41)

#creating matrix out of the subsets of data
as.matrix.data.frame(dfrace)

dfrace[,-1]

mytable1 = as.matrix(dfrace[,-1])

#using the barplot function to plot the matrix 
barplot1 <- barplot(mytable1,
        xlab="servings per week",
        ylab= "Fried food consumption",
        legend.text = dfrace$Factors,
        col = c("burlywood1","coral1","brown","darksalmon","gold"),
        args.legend = list(x = "bottomright",inset = c(- 0.05, 1)))
#To save the graph, we use
ggsave("barplot1.png")

#same as above for the diseases subset
as.matrix.data.frame(df_diseases)

df_diseases[,-1]

mytable2 = as.matrix(df_diseases[,-1])
barplot2 <- barplot(mytable2,
        xlab = "servings per week",
        ylab = "Fried food consumption",
        legend.text=df_diseases$Factors,
        col=c("bisque1","darksalmon","coral1"),
        args.legend = list(x = "topright",inset = c(- 0.48, 0)))

ggsave("barplot2.png")

