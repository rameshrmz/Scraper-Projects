library(rvest)

#IMDB Site Link - Top 50 IMDB Rating Hollywood Films 2017
url <- 'http://www.imdb.com/search/title?year=2017&title_type=feature&'

#Read IMDB HTML Content
content <- read_html(url)

#Movie Ranks
rank <- content %>% html_nodes('span.text-primary') %>% html_text() %>% as.numeric()

#Movies Title
title <- content %>% html_nodes('.lister-item-header a') %>% html_text()

#Movies Running Time
runtime <- content %>% html_nodes('span.runtime') %>% html_text()

#Movies Genre
genre <- content %>% html_nodes('span.genre') %>% html_text

#Movies User Rating
rating <- content %>% html_nodes('.ratings-imdb-rating') %>% html_text() %>% as.numeric()


#Final Dataframe

IMDB_df <- data.frame(Rank = rank, Title = title, Runtime = runtime, Genre = genre, Rating = rating)

fix(IMDB_df)
