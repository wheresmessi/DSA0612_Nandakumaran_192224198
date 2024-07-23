# Create data frame
academic_data <- data.frame(
  Student = c('A', 'B', 'C', 'D', 'E'),
  Math_Score = c(85, 72, 90, 78, 88),
  Science_Score = c(78, 85, 80, 75, 82),
  Attendance = c(95, 92, 98, 85, 93)
)
library(plotly)
# Create 3D scatter plot
scatter_plot <- plot_ly(academic_data, 
                        x = ~Math_Score, 
                        y = ~Attendance, 
                        z = ~Science_Score, 
                        type = 'scatter3d', 
                        mode = 'markers',
                        marker = list(size = 5)) %>%
  layout(scene = list(
    xaxis = list(title = 'Math Score'),
    yaxis = list(title = 'Attendance (%)'),
    zaxis = list(title = 'Science Score')
  ))

# Print the scatter plot
scatter_plot
