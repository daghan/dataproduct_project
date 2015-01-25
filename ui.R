library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("I love the forest"),
    sidebarPanel(
        sliderInput('iTree', 'Number of trees in the forest',value = 5, min = 1, max = 10, step = 1,)
    ),
    mainPanel(
        h2('Efficiency of the Fandom Forests'),
        p('In this web page, we aim to demonstrate the accuracy and the efficiency of Random Forest based classification
           using the Iris data set.'),
        p('The slider on the left panel controls the \"number of trees\" in the forest.'),
        strong('Notice that adding more trees to the random forest doesn\'t necessarily increase
          the accuracy.'),
        p('According to machine learning best practices, the Iris data set is split into training (75%)
           and validation (25%) components.'),
        p('The random forest is built on the training data set and subsequently tested on the
           validation set.'),
        p('The results below show the accuracy of the random forest classifier when applied to
           the validation set.'),
        h4('Confusion  Matrix for cross validation values'),
        verbatimTextOutput("results"),
        verbatimTextOutput("accuracy")
    )
))
