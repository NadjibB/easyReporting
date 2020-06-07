library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(tidyverse)

ui <- dashboardPage(skin = 'black',
    dashboardHeader(title = "KPI RH"),
    dashboardSidebar(),
    dashboardBody(
        
        
        fileInput(inputId = "fichier_brut" , label = 'Fichier Brut', multiple = TRUE, buttonLabel = "Upload...",
                  accept = ".csv"),
        tableOutput("donnees")
        
    )
)

server <- function(input, output) { 
    
    output$donnees <- renderTable(input$fichier_brut)
    
    data <- reactive({
        req(input$fichier_brut)
        read_csv2(input$fichier_brut$datapath)
        
        })
    
    output$donnees <- renderTable(head(data(), 3))
    
    
    
    
    }

shinyApp(ui, server)