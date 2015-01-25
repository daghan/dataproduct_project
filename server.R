library(RANN)
library(caret)
library(rpart)
library(randomForest)
library(e1071)

#The outcome iris$Speciesis a factor variable with 3 possible outcomes
# Splicing the data to training and testing sets
# split to training and test
iris$Species <- as.factor(iris$Species)
inTrain = createDataPartition(iris$Species, p = 3/4)[[1]]
training = iris[ inTrain,]
testing = iris[-inTrain,] 



shinyServer(
    function(input, output) {
        prediction <- reactive({
            rf <- randomForest(training[,-5], training$Species, ntree = input$iTree)
            
            predTraining <- predict(rf, training[,-5])
            predTesting<- predict(rf, testing[,-5])
            
            
            # Accuracy
            # cmTraining <- confusionMatrix(predTraining, training$Species)  
            cmTesting <- confusionMatrix(predTesting, testing$Species)  
        })
        
        
      output$results <- renderPrint({
          #bs = input$iTree
          return (prediction()$table)
          # return(list(table=cmTesting$table, accuracy=cmTesting$overall[1]))

        })    
      output$accuracy <- renderPrint({
          #bs = input$iTree
          return (prediction()$overall[1])
          # return(list(table=cmTesting$table, accuracy=cmTesting$overall[1]))
          
      })    
    }
)