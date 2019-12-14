#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(e1071) 
shinyServer(function(input, output) {
    #Traing the model
    train_control <- trainControl(method="cv", number=10)
    model.knn <- train(Species ~ .,data=iris, trControl=train_control,method="knn", preProcess = c("center", "scale"), tuneLength = 10)
    #predicting values
    model.pred <- reactive({
        df <- data.frame(Sepal.Length = input$Sepal.Length, Sepal.Width = input$Sepal.Width, Petal.Length = input$Petal.Length, Petal.Width = input$Petal.Width)
        predict(model.knn, newdata = df)
    })
    #Plotting text
    output$Species <- renderText({as.character(model.pred())}) 
})