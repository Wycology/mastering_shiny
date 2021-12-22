library(shiny)

ui <- fluidPage(
  selectInput("dataset", label = "Dataset", selected = 'BOD',
              choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  dataTableOutput('table'))

server <- function(input, output, session) {
  
  dataset <- reactive({
    get(input$dataset, "package:datasets")
  })
 
  output$summary <- renderPrint({
    summary(dataset())
  }) 
  output$table <- renderDataTable({
    dataset()
  })
  
}

shinyApp(ui, server)
