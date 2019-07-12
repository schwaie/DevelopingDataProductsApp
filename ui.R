# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app

# This app was developed to help people choose a movie based on rating, revenue, year and metascore, 
# using the dataset "IMDB data from 2006 to 2016" from user PromptCloud on Kaggle

library(markdown)

shinyUI(navbarPage("Select a movie",
                   tabPanel("Table",
                            ##sidebar
                            sidebarLayout(
                                    sidebarPanel(
                                            helpText("Provide the year, rating, revenue and metascore of the movie you want to see"),
                                            numericInput('yr', 'Year:', 2006, min = 2006, max = 2016),
                                            sliderInput('rtng', 'Rating', min=1.9, max=9, value=c(1.9,9), step=.1),
                                            sliderInput('rev', 'Revenue (millions)', min=0, max=936.63, value=c(0,937), step=.01),
                                            sliderInput('meta', 'Metascore', min=11, max=100, value=c(11,100), step=1)
                                    ),
                                    
                                    
                                    mainPanel(
                                            dataTableOutput('table')
                                    )
                            )
                   ),
                   tabPanel("Documentation",
                            mainPanel(
                                    includeMarkdown("documentation.md")
                            )
                   )
)
)   