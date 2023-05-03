---
title: "R Notebook"
output: html_notebook
---


```{r}
# Load required packages
install.packages("shiny")
library(shiny)
library(shinydashboard)
library(plotly)
library(DT)
```


```{r}
# Load data
breast_DGE_data <- read.csv("/home/stad2018/shiny/breast_DGE_data.csv")
```


```{r}
# Define UI 
ui <- dashboardPage(
  dashboardHeader(title = "Breast Cancer Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("DGE", tabName = "dge")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dge",
              fluidRow(
                box(width = 12,
                    height = 800,
                    title = "Heatmap of DGE Data",
                    solidHeader = TRUE,
                    collapsible = TRUE,
                    plotlyOutput("dge_heatmap"))
              ))
      
    )
  )
)
```


```{r}

server <- function(input, output) {
  
  
  # output heatmap
  output$dge_heatmap <- renderPlotly({
    dge_heatmap <- plot_ly(z=as.matrix(breast_DGE_data), x=colnames(breast_DGE_data), y=row.names(breast_DGE_data), type="heatmap")

    dge_heatmap <- dge_heatmap %>% layout(title="Heatmap of DGE Data")
    
    dge_heatmap
  })
  
}
```


```{r}
# Run the app
shinyApp(ui = ui, server = server)
```


