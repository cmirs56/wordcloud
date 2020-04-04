
# load the necessary libraries for making a wordcloud  --------------------

library(KoNLP)  
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
useSejongDic() # other dictionary option: useNIADic() 


# load the text file and get all nouns from the sentences -----------------

comments <- readLines("c:/users/MC/R/wordcloud/corona.txt", encoding = "UTF-8") #load the txt file
head(comments, 10)

comments <- paste0(comments, collapse = "")

nouns <- extractNoun(comments) # extract nouns from the loaded txt file
nouns1 <- unlist(nouns) # get the nouns as vectors
nouns2 <- Filter(function(x) {nchar(x) <= 20 & nchar(x) > 1}, nouns1) # drop one letter or too long nouns

nouns2 <- gsub(" ","", nouns2) # delete the empty spaces, digits, and 
nouns2 <- gsub("<.+?>|\t", "", nouns2) 
nouns2 <- gsub("\\d+","" ,nouns2)	
nouns2 <- gsub("\\.","" ,nouns2) 
nouns2 <- gsub("\\(","" ,nouns2) 
nouns2 <- gsub("\\)","" ,nouns2) 

nouns2 <- gsub("코로나","" ,nouns2) #drop unnecessary nouns 
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
nouns2 <- gsub("바이러스","" ,nouns2)
nouns2 <- gsub("보내기","" ,nouns2)
nouns2 <- gsub("신종","" ,nouns2)
nouns2 <- gsub("감염증","" ,nouns2)
nouns2 <- gsub("국내","" ,nouns2)

nouns3 <- Filter(function(x) {nchar(x) <= 20 & nchar(x) > 1}, nouns2)


# make the wordcloud  -----------------------------------------------------

wordcount <- table(nouns3) # count the frequencies of every single nouns 
head(sort(wordcount, decreasing = TRUE), 50) 

windowsFonts(malgun=windowsFont("맑은고딕"))
wordcloud2(data=wordcount, minSize = 5, 
           minRotation = 0, maxRotation = 0, rotateRatio = 1, 
           fontFamily='맑은고딕',size=0.8)
