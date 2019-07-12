# Coursera - Developing Data Products- Course Project

# server.R file for the shiny app

# This app was developed to help people choose a movie based on rating, revenue, year and metascore, 
# using the dataset "IMDB data from 2006 to 2016" from user PromptCloud on Kaggle

library(shiny)
library(dplyr)
library(readr)

shinyServer(function(input, output) {
        
        # Show the movies that correspond to the filters
        output$table <- renderDataTable({
                rating_seq <-seq(from=input$rtng[1], to=input$rtng[2], by=0.1)
                revenue_seq <- seq(from=input$rev[1], to=input$rev[2], by = .01)
                metascore_seq <- seq(from=input$meta[1], to=input$meta[2], by = 1)
                IMDB_Movie_Data <- read_csv("IMDB-Movie-Data.csv")
                IMDB_Movie_Data$Revenue <- IMDB_Movie_Data$`Revenue (Millions)`
                data <- IMDB_Movie_Data[,c(2,7,9,12,13)]
                data <- filter(data, Year <= input$yr, Rating %in% rating_seq, 
                               Revenue %in% revenue_seq, Metascore %in% metascore_seq)
                data <- arrange(data, Metascore)
                data
                  
        }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})