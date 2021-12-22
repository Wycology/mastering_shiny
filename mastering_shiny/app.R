library(shiny)

ui <- fluidPage(
  selectInput("dataset", label = "Dataset", selected = 'BOD',
              choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  dataTableOutput('table'))

server <- function(input, output, session) {
 
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  }) 
  output$table <- renderDataTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
  
}

shinyApp(ui, server)
