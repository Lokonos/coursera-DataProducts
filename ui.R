#This App classifies flower species into three different species setosa, 
#versicolor and virginica based on the Iris dataset. 

library(shiny)
library(caret)
library(e1071)
shinyUI(fluidPage(
    titlePanel("Flower Classifier"),
    sidebarLayout(
        sidebarPanel(
            h3("This apps allows you to classify flowers based on the Iris Data set and an K-NN algorithm.")
        ),
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Instructions", 
                                 br(), 
                                 h3("1. In the Inupt tab, use the sliders to select the values for the sepal length and width and the petal length and width."),
                                 h3("2. Check the Output tab to see the result of the classification into one of the three species: setosa, versicolor, and virginica."),
                                 textOutput("out1")), 
                        tabPanel("Input", 
                                 br(), 
                                 sliderInput("Sepal.Length", "Sepal Length:", min = 4.3, max =  7.9, value = 5.8),
                                 sliderInput("Sepal.Width", "Sepal Width:", min = 2.0, max =  4.4, value = 3.0),
                                 sliderInput("Petal.Length", "Petal Length:", min = 1.0, max =  6.0, value = 4.35),
                                 sliderInput("Petal.Width", "Petal Width:", min = 0.1, max =  2.5, value = 1.3)),
                        tabPanel("Output", 
                                 br(),
                                 h3("The Species is:"),
                                 textOutput("Species"))
            )
        )
    )
))