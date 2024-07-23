# Create data frame
survey_data <- data.frame(
  Product = c('A', 'B', 'C', 'D', 'E'),
  Price = c(50, 70, 60, 45, 55),
  Rating = c(4.2, 3.8, 4.0, 4.5, 3.9),
  Age_Group = c('25-35', '35-45', '18-25', '45-55', '25-35')
)
library(plotly)
# Convert Age_Group to a numerical scale
survey_data$Age_Group_Num <- as.numeric(factor(survey_data$Age_Group, 
                                               levels = c('18-25', '25-35', '35-45', '45-55')))

# Create 3D scatter plot
scatter_plot <- plot_ly(survey_data, 
                        x = ~Price, 
                        y = ~Age_Group_Num, 
                        z = ~Rating, 
                        type = 'scatter3d', 
                        mode = 'markers',
                        marker = list(size = 5)) %>%
  layout(scene = list(
    xaxis = list(title = 'Price ($)'),
    yaxis = list(title = 'Age Group', 
                 tickvals = c(1, 2, 3, 4), 
                 ticktext = c('18-25', '25-35', '35-45', '45-55')),
    zaxis = list(title = 'Rating (out of 5)')
  ))

# Print the scatter plot
scatter_plot