library(tidyverse)
library(shiny)
library(shinythemes)
library(bslib)
library(here)


#Read in data
#mushrooms <- read_csv(here("data", "mushrooms.csv"))



ui <- fluidPage(
                navbarPage("Mushroom Foraging: A Beginer's Guide",
                           theme = bs_theme(version = 4, bootswatch = "minty"),
                           tabPanel("Getting Started",
                                    sidebarLayout(
                                      sidebarPanel(h3("Filtering options",class = "text-success"),
                                                   checkboxGroupInput(inputId = "pick_variety",
                                                                      label = "Choose a variety:",
                                                                      choices = c("Edible",
                                                                                  "Poisonous",
                                                                                  "Other")), 
                                                   selectInput(inputId = "pick_species", 
                                                               label = "Choose a species", 
                                                               choices = c("idk")), 
                                                   actionButton(inputId = "go", 
                                                                label = "Forage!", 
                                                                status = "primary")
                                      ),
                                      mainPanel(h1("OUTPUT!", class = "text-secondary"),
                                                icon("list", "fa-6x"), 
                                                actionButton(inputId = "download_mush", 
                                                             label= "Download list")),
                                    )
                           ),
                           tabPanel("Find Your Foraging Grounds"),
                           tabPanel("About")
                           
                )
                
)

server <- function(input, output) {
  

  
}

shinyApp(ui = ui, server = server)
