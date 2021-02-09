library(tidyverse)
library(shiny)
library(shinythemes)
library(bslib)
library(here)


#Read in data
#mushrooms <- read_csv(here("data", "mushrooms.csv"))

ui <- fluidPage(
                navbarPage(
                  #App title
                  title = "Mushroom Foraging: A Beginner's Guide", #or "MY-cology - A Mushroom Finder"
                  theme = bs_theme(version = 4, bootswatch = "minty"),
                           
                           #Intro Tab
                           tabPanel(
                             title = "Getting Started", 
                             icon = icon("search"),
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
                                                             label= "Download list")))),
                                      
                           #Map Tab
                           tabPanel("Find Foraging Grounds", icon = icon("map"),
                              sidebarLayout(
                                sidebarPanel(h3("Select your state", class = "text-success"),
                                                  selectInput(inputId = "pick_state", 
                                                             label = "Select a state", 
                                                             choices = c("idk")), 
                                                  actionButton(inputId = "go", 
                                                             label = "Forage!", 
                                                             status = "primary")
                              ),
                             mainPanel(
                               h1("Map will go here!", class = "text-success")))),
                           
                          #About Tab
                           tabPanel(
                             title = "About", 
                             icon = icon("info-circle"),
                              mainPanel(h1("About This Project"),
                                h3("Mycology interactive app. We'll be visualizing the different varieties of mushrooms found in the US by city or mushroom type. Ideally, this app will serve as a way to explore what types of mushrooms grow, whether they're poisonous or not, and what types of environments they thrive in. We'd like for this to be a place where people can also add to the existing UCI mushroom database."),
                                h2(strong("Methods of the data collected:")),
                                print("Data was collected xyz, over 8000 samples are included in this dataset and 23 varieties of mushrooms."),
                                h2(strong("About us:")),
                                print("We're two masters students at the Bren School of Environmental Science and Management.")
                              ))))

server <- function(input, output) {
  

  
}

shinyApp(ui = ui, server = server)
