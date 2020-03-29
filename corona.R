library(KoNLP) #loading the required libraries for wordcloud 
library(wordcloud)
library(stringr)
library(XML)
library(rvest)
library(tm)
library(igraph)
library(wordcloud2)
library(arules)
library(combinat)
library(multilinguer)

.libPaths()
useSejongDic() #or useNIADic() 

comments <- readLines("c:/users/MC/R/corona.txt", encoding = "UTF-8")
head(comments, 10)

comments <- paste0(comments, collapse = "")

nouns <- extractNoun(comments)
nouns1 <- unlist(nouns)
nouns2 <- Filter(function(x) {nchar(x) <= 20 & nchar(x) > 1}, nouns1)

nouns2 <- gsub(" ","", nouns2)
nouns2 <- gsub("<.+?>|\t", "", nouns2)
nouns2 <- gsub("\\d+","" ,nouns2)	
nouns2 <- gsub("\\.","" ,nouns2) 
nouns2 <- gsub("\\(","" ,nouns2) 
nouns2 <- gsub("\\)","" ,nouns2) 

nouns2 <- gsub("코로나","" ,nouns2)
nouns2 <- gsub("선정","" ,nouns2)
nouns2 <- gsub("시간","" ,nouns2)
nouns2 <- gsub("네이버뉴스","" ,nouns2)
nouns2 <- gsub("언론사","" ,nouns2)
nouns2 <- gsub("네이버뉴","" ,nouns2)
nouns2 <- gsub("뉴스","" ,nouns2)
nouns2 <- gsub("연합","" ,nouns2)
nouns2 <- gsub("일보","" ,nouns2)
nouns2 <- gsub("관련","" ,nouns2)
nouns2 <- gsub("이날","" ,nouns2)
nouns2 <- gsub("KBS","" ,nouns2)
nouns2 <- gsub("오늘","" ,nouns2)
nouns2 <- gsub("하루","" ,nouns2)
nouns2 <- gsub("중앙","" ,nouns2)
nouns2 <- gsub("하기","" ,nouns2)
nouns2 <- gsub("SBS","" ,nouns2)


nouns3 <- Filter(function(x) {nchar(x) <= 20 & nchar(x) > 1}, nouns2)

wordcount <- table(nouns3)
head(sort(wordcount, decreasing = TRUE), 50)

windowsFonts(malgun=windowsFont("맑은고딕"))
wordcloud2(data=wordcount, minSize = 5, 
           minRotation = 0, maxRotation = 0, rotateRatio = 1, 
           fontFamily='맑은고딕',size=0.8)
