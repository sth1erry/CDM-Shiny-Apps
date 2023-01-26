#install.packages("shinydashboard")
library(shiny)
library(shinydashboard)
library(tidyverse)
library(plotly)
library(ggplot2)
install.packages("shinyWidgets")
library(shinyWidgets)
# Define UI for application
#setwd("C:/Users/sindimwo/Documents/")
PCA_data <- read.csv(file = "PCA_data.csv")
PCA_data <- as.data.frame(PCA_data)

header <- dashboardHeader(title = "Thesis Project")

sidebar <- dashboardSidebar(
   sidebarMenu(
    menuItem("PCA Plots", icon = icon("th"), tabName = "plots",
             badgeLabel = "view", badgeColor = "green")
  )
)

body <- dashboardBody(

  fluidPage(
    prettyRadioButtons("plot", "Color PCA plot by:", c("sex", "lineage", "primary_disease"), fill = TRUE, thick = TRUE, outline = TRUE, bigger = TRUE, width = 100, animation = "tada")),
    plotlyOutput("plot")
)


ui <- dashboardPage(
  header,
  sidebar,
  body
)

# Run the application
shinyApp(ui = ui, server = function(input, output) {
  output$plot <- renderPlotly({
    plot <- switch (input$plot,
                    sex = plot_ly(data = PCA_data, x = ~PC1, y = ~PC2, color= ~sex, width = 1500, height = 700, text = ~paste("Cell line: ", DepMap_ID, '$<br>Primary Disease:', primary_disease)),
                    lineage = plot_ly(data = PCA_data, x = ~PC1, y = ~PC2, color= ~lineage, width = 1500, height = 700, text = ~paste("Cell line: ", DepMap_ID, '$<br>Primary Disease:', primary_disease)),
                    primary_disease = plot_ly(data = PCA_data, x = ~PC1, y = ~PC2, color= ~primary_disease, width = 1500, height = 700, text = ~paste("Cell line: ", DepMap_ID, '$<br>Primary Disease:', primary_disease)))
  })
})