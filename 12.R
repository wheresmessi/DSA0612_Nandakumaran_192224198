# Create data frame
environmental_data <- data.frame(
  Location = c('A', 'B', 'C', 'D', 'E'),
  Temperature = c(15, 20, 18, 12, 17),
  Humidity = c(65, 70, 68, 60, 72),
  CO2_Levels = c(400, 450, 420, 380, 430)
)

library(plotly)

scatter_plot <- plot_ly(environmental_data, 
                        x = ~Temperature, 
                        y = ~Humidity, 
                        z = ~CO2_Levels, 
                        type = 'scatter3d', 
                        mode = 'markers',
                        marker = list(size = 5)) %>%
  layout(scene = list(
    xaxis = list(title = 'Temperature (°C)'),
    yaxis = list(title = 'Humidity (%)'),
    zaxis = list(title = 'CO2 Levels (ppm)')
  ))
scatter_plot