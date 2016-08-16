install.packages("RCurl")
install.packages("twitterR")
install.packages("ROAuth")
install.packages("base64enc")

library(RCurl)
library(twitteR)
library(ROAuth)
library(base64enc)
library(tm)
library(wordcloud)

apiKey <- "YOURAPI_KEY"
apiSecret <- "YOURSECRET_KEY"
accessToken <- "YOUR ACCESS TOKEN "
accessSecret <- "YOUR ACCESS SECRET";

setup_twitter_oauth(apiKey,apiSecret,access_token=accessToken,access_secret=accessSecret)
hillaryClinton <- searchTwitter("#apacheSpark",n = 500,lang="en",resultType="recent")
hillaryClinton_text = sapply(hillaryClinton, function(x) x$getText())
#usableText=str_replace_all(tweets$text,"[^[:graph:]]", " ") 
hillaryClinton_corpus = Corpus(VectorSource(hillaryClinton_text))
hillary_clean <- tm_map(hillaryClinton_corpus,removePunctuation)
hillary_clean <- tm_map(hillary_clean,content_transformer(tolower))
hillary_clean <- tm_map(hillary_clean, removeWords, stopwords("english"))
hillary_clean <- tm_map(hillary_clean,removeNumbers)
hillary_clean <- tm_map(hillary_clean,stripWhitespace)
hillary_clean <- tm_map(hillary_clean, removeWords, c("bigdata","ibmbigdata"))

tdm <- TermDocumentMatrix(hillary_clean)
m = as.matrix(tdm)
# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing = TRUE) 
# create a data frame with words and their frequencies
dm = data.frame(word = names(word_freqs), freq = word_freqs)
dm <- dm[1:100,]
wordcloud(dm$word, dm$freq, random.order = FALSE, colors = topo.colors(100))


install.packages("igraph")
library(igraph)
myGraph <- graph(c( "A", "B", "A", "D", "B", "A", "B", "B", "B", "C", "C", "A", "D", "C", "D", "D"), directed = TRUE)
plot(myGraph)


