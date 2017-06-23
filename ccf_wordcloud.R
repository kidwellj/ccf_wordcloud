# Script to create wordcloud from CCF applications stored in CSV

# PRELIMINARIES, load libraries and data

require(tm)
require(wordcloud)
require(stringr)

# Clean data set

ccf <- Corpus (DirSource("CCF/"))
ccf <- tm_map(ccf, stripWhitespace)
ccf <- tm_map(ccf, tolower)
ccf <- tm_map(ccf, removeNumbers)
ccf <- tm_map(ccf, removePunctuation)

# tweak by adding extra stopwords, "will"

myStopwords <- c(stopwords('english'), "will", "project")

# tweak by removing extra stopwords, in this example "r"
# idx <- which(myStopwords == "r")
# myStopwords <- myStopwords[-idx]

ccf <- tm_map(ccf, removeWords, myStopwords)
# ccf <- tm_map(ccf, stemDocument)
ccf <- tm_map(ccf, PlainTextDocument)

# Create word cloud

# wordcloud(ccf, scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))
# wordcloud(ccf, scale=c(8,.2), min.freq=2, max.words=Inf, random.order=FALSE, rot.per=.15, colors=brewer.pal(8, "Dark2"))
wordcloud(ccf, scale=c(5,.3), max.words=250, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark3"))