library(shiny)
library(shinydashboard)

ui <- dashboardPage(skin = 'black',
    dashboardHeader(title = "KPI RH"),
    dashboardSidebar(),
    dashboardBody(
        
        
        fileInput(inputId = "fichier_brut" , label = 'Fichier Brut', multiple = FALSE, accept = NULL, width = NULL)
        
        
        
    )
)

server <- function(input, output) { }

shinyApp(ui, server)