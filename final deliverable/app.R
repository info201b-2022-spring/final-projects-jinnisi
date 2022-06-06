library(shiny)
library(plotly)
library(dplyr)

source("app_ui.R")
source("server.R")

shinyApp(ui = ui, server = server)
