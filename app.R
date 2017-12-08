library(shiny)
ui <- fluidPage(
  pageWithSidebar(
    # Application title
    headerPanel("Shiny App Project - Target Heart Rate Calculator"),
    
    sidebarPanel(
      numericInput('age', 'Enter your age in years', 25) ,
      submitButton('Calculate Target Heart Rate')
    ), 
    mainPanel(
      p('Your heart rate, or pulse, is the number of times your heart beats per minute. Normal heart rate varies from person to person. Knowing yours can be an important heart-health gauge.'),
      p('When you work out, there’s a simple way to know if you are over or under exercising: Your Target Heart Rate. Which is 70-80% of your Maxium Heart Rate'),
      p('To find your Target Heart Rate, enter your Age'),
      
      h4('Calculating Target Heart Rate based on values entered by you:'), 
      p('Age:'), verbatimTextOutput("inputagevalue"),
      h4('Your Target Heart Rate is:'),
      p('70%:'), verbatimTextOutput("THR1"),
      p('80%:'), verbatimTextOutput("THR2")
          )
      )   
 )

server <- function(input, output) {
  
      output$inputagevalue <- renderPrint({input$age})
    output$inputRHRvalue <- renderPrint({input$RHR})
    output$THR1 <- renderText({(220 - input$age)*.7})
    output$THR2 <- renderText({(220 - input$age)*.8})
    
  
    
  } 


shinyApp(ui = ui, server = server)