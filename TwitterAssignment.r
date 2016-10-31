#Assignment submission by Sanket bhat.
#The files generated are pushed to Github - https://github.com/bhatsanket/IT497

library(twitteR)
library(httr)
library(ROAuth)
library(plyr)
library(stringr)
library(ggplot2)

my.key <-'GWcnJnRrvqvEXoLaX2pXh89kr'
my.secret <-'7N4G22C4i4PT5uwoODGmxItRrj4rfq0nZL3FUN5hEX5TMVYIvF'
access.token <- '152351721-mlVf2Zp9qWVJzdpvgIi0jn14LFSxEhBVBnLMkEBm'
access.token.secret <- 'ypZKgRgHAzCErCg0zDv8l7Vt1SDh5AU4WXBpVMjtUBNFZ'

setup_twitter_oauth(my.key, my.secret, access.token, access.token.secret)
# Search for Tweets
tweets <- searchTwitter('#anonymous 0hour1', n=100, lang='en')
# shows - How many tweet were pulled?
length(tweets)
# Show first 5 tweets 
head(tweets, 5)
# Strip out Retweets
tweets <- (strip_retweets(tweets, strip_manual=TRUE, strip_mt=TRUE))
# See how many original tweets we found
length(tweets)
# Loop over tweets and extract text
tweets.text <- laply(tweets, function(t) t$getText())
# Show text from first 5 tweets
toFile <- head(tweets.text,5)
toFile

#The file created is pushed to Github - https://github.com/bhatsanket/IT497
write.csv(toFile, file = 'TwitterData.csv', row.names = FALSE, na="")
#plain file
writeLines(toFile,'TwitterOut.txt')
