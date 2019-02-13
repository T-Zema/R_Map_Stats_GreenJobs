library(shiny)
library(DT)

# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Aplikacja"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(
      fileInput("file1", "Choose CSV File"),
      actionButton('plotplot', "Wyplotuj plota")),
    
    # Main panel for displaying outputs ----
    mainPanel(
      textOutput("wtf"),
      plotOutput("plot"),
      tableOutput("tabelka"),
      tableOutput("data")
      
   )
  )
 )


server <- function(input, output) {
  
  output$tabelka <- renderTable({

    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    dtf <- read.csv(inFile$datapath, encoding = "UTF-8")
    dtf
  })

  
  
  #------ plot
  observeEvent(input$plotplot, {
    #df <- read.csv(input$file1$datapath, encoding = "UTF-8")
    dtf <- input[["file1"[["datapath"]]]]
    lista <- 0:28
    x <- c(0,dtf[["zi"]])
    #x <- df$zi
    output$wtf <- reactive(as.character(x))
    y = lista
    Średnia = dtf[[sr[1]]]
    Punkt1 = dtf[[p1[1]]]
    Punkt2 = dtf[[p2[1]]]
    output$data <- renderTable(dtf)
  output$plot <- renderPlot({
  plot(x, y, col=ifelse(x==0, "white", "blue"), xlab="Wartość syntetycznego miernika ekorozowju", ylab="Pozycja w rankingu ", pch=19, xaxt="n", yaxt="n",cex= 2)
  
  # zmienna pomocnicza
  axis_seqx <- seq(0, 1, length.out = 11)
  axis_seqy <- seq(0, 28, length.out = 29)
  
  # zmiana osi
  axis(side=1,at=axis_seqx,lwd=1)
  axis(side=2,at=axis_seqy,lwd=1)
  # linie 
  abline(v = Średnia, col = "gray60", lwd = 2, lty = 2)
  abline(v = Punkt1, col = "gray60", lwd = 2, lty = 2)
  abline(v = Punkt2, col = "gray60", lwd = 2, lty = 2)
  
  # Znaczniki dla linii
  mtext(expression(bar("Z") -"S"[d]), line = 0, at = Punkt1)
  mtext(expression(bar("Z") + "S"[d]), line = 0, at = Punkt2)
  mtext(expression(bar("Z")), line = 0.2, at = Średnia)
  
  # wygładzenie pomocnicze
  #scatter.smooth(x[1:29], y[1:29])
  # regresja liniowa
  
  linear_model = lm(y~x,data=dtf)
  
  #abline(linear_model)
  text(x[2:29],y[2:29], labels=dtf$symbolh, cex= 0.7, pos=2.5)
  
  summary(linear_model)
  summary(linear_model$coefficients)
  
})   
  })
  #----
  
  
  
}

# Create Shiny app ----
shinyApp(ui, server)
