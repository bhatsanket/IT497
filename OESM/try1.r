devtools::install_github("hrbrmstr/omdbapi")
library(dplyr)
library(pbapply)
library(omdbapi)
library(rvest)
library(xml2)
library(plotly)
library(ggplot2)
Film_2011 <- read_html("https://en.wikipedia.org/wiki/2011_in_film")
Film_2011_table <- html_table(html_nodes(Film_2011, "table")[[4]],fill = TRUE)
Film_2012 <- read_html("https://en.wikipedia.org/wiki/2012_in_film")
Film_2012_table <- html_table(html_nodes(Film_2012, "table")[[4]],fill = TRUE)
Film_2013 <- read_html("https://en.wikipedia.org/wiki/2013_in_film")
Film_2013_table <- html_table(html_nodes(Film_2013, "table")[[4]],fill = TRUE)

Film_2014 <- read_html("https://en.wikipedia.org/wiki/2014_in_film")
Film_2014_table <- html_table(html_nodes(Film_2014, "table")[[4]],fill = TRUE)
Film_2015 <- read_html("https://en.wikipedia.org/wiki/2015_in_film")
Film_2015_table <- html_table(html_nodes(Film_2015, "table")[[5]],fill = TRUE)
Film_2016 <- read_html("https://en.wikipedia.org/wiki/2014_in_film")
Film_2016_table <- html_table(html_nodes(Film_2016, "table")[[4]],fill = TRUE)


names(Film_2012_table)<-names(Film_2011_table)<-names(Film_2013_table)
Film_all_table_before_val <- do.call("rbind",list(Film_2011_table,Film_2012_table,Film_2013_table,Film_2014_table,Film_2015_table,Film_2016_table))
NonAnim_all_table <- data.frame()
for (i in 1:nrow(Film_all_table_before_val)) {
  
  gen <- get_genres(find_by_title(Film_all_table_before_val$Title[i],type = "movie"))
  if(!('Animation' %in% gen)){
    df <- find_by_title(Film_all_table_before_val$Title[i],type = "movie")
    NonAnim_all_table <- rbind(df,NonAnim_all_table)
    
  }
}
names(NonAnim_all_table)
mean(NonAnim_all_table$imdbRating)
third<-NonAnim_all_table$imdbRating


summary(NonAnim_all_table)











Film_2014_table
Anim_2011<- read_html("https://en.wikipedia.org/wiki/List_of_animated_feature_films_of_2011")
Anim_2011_table <- html_table(html_nodes(Anim_2011, "table")[[3]],fill = TRUE)
Anim_2012<- read_html("https://en.wikipedia.org/wiki/List_of_animated_feature_films_of_2012")
Anim_2012_table <- html_table(html_nodes(Anim_2012, "table")[[3]],fill = TRUE)
Anim_2013<- read_html("https://en.wikipedia.org/wiki/List_of_animated_feature_films_of_2013")
Anim_2013_table <- html_table(html_nodes(Anim_2013, "table")[[3]],fill = TRUE)

Anim_2014<- read_html("https://en.wikipedia.org/wiki/List_of_animated_feature_films_of_2014")
Anim_2014_table <- html_table(html_nodes(Anim_2014, "table")[[3]],fill = TRUE)
Anim_2015<- read_html("https://en.wikipedia.org/wiki/List_of_animated_feature_films_of_2015")
Anim_2015_table <- html_table(html_nodes(Anim_2015, "table")[[3]],fill = TRUE)
Anim_2016<- read_html("https://en.wikipedia.org/wiki/List_of_animated_feature_films_of_2016")
Anim_2016_table <- html_table(html_nodes(Anim_2016, "table")[[3]],fill = TRUE)
Anim_2012_table[,4]<-Anim_2012_table[,5]
Anim_2011_table[,5]<-Anim_2012_table[,5]<-'N/A'
names(Anim_2011_table) <- names(Anim_2012_table) <- names(Anim_2016_table)<-names(Anim_2015_table)
Anim_all_table_before_val <- do.call("rbind",list(Anim_2011_table,Anim_2012_table,Anim_2013_table,Anim_2014_table,Anim_2015_table,Anim_2016_table))
Anim_all_table <- data.frame()
for (i in 1:nrow(Anim_all_table_before_val)) {
  
  gen <- get_genres(find_by_title(Anim_all_table_before_val$Title[i],type = "movie"))
  if('Animation' %in% gen){
    df <- find_by_title(Anim_all_table_before_val$Title[i],type = "movie")
    Anim_all_table <- rbind(df,Anim_all_table)
    
  }
}
names(Anim_all_table)
mean(Anim_all_table$imdbRating)
ifelse(nrow(Anim_all_table)>nrow(NonAnim_all_table),tbl_count <-nrow(NonAnim_all_table),tbl_count <-nrow(Anim_all_table))

first<-Anim_all_table$Year[1:tbl_count]
second<-Anim_all_table$imdbRating[1:tbl_count]

as.data.frame(Anim_all_table[1:nrow(Anim_all_table),])

ifelse(nrow(Anim_all_table)>nrow(NonAnim_all_table),tbl_count <-nrow(NonAnim_all_table),tbl_count <-nrow(Anim_all_table))
tbl_count
plot_ly(as.data.frame(Anim_all_table[1:tbl_count,]), x = first, y = second, type = 'bar', name = 'Animated Movies') %>%
  add_trace(y = third, name = 'Non-Animated Movies') %>%
  layout(yaxis = list(title = 'imdbRating',autotick = FALSE,
                      ticks = "outside",
                      tick0 = 5,
                      dtick = 0.25,
                      ticklen = 5,
                      tickwidth = 2,
                      tickcolor = toRGB("yellow")), barmode = 'group')

