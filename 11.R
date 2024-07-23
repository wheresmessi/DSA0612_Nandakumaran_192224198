# Load necessary libraries
library(ggplot2)

# Create data frame
weather_data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05')),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  WindSpeed = c(15, 12, 18, 20, 16)
)
# Load necessary libraries
library(plotly)

# Create 3D scatter plot
plot_ly(weather_data, x = ~WindSpeed, y = ~Humidity, z = ~Temperature, 
        type = 'scatter3d', mode = 'markers', 
        marker = list(size = 5)) %>%
  layout(scene = list(xaxis = list(title = 'Wind Speed (km/h)'),
                      yaxis = list(title = 'Humidity (%)'),
                      zaxis = list(title = 'Temperature (°C)')))
cor(weather_data$Temperature, weather_data$Humidity)
cor(weather_data$Temperature, weather_data$WindSpeed)

# Pair plot
pairs(weather_data[ , 2:4], 
      main = "Scatterplot Matrix", 
      pch = 19, 
      col = "blue")

# Create a grid of values for Humidity and Wind Speed
humidity_values <- seq(min(weather_data$Humidity), max(weather_data$Humidity), length.out = 20)
wind_speed_values <- seq(min(weather_data$WindSpeed), max(weather_data$WindSpeed), length.out = 20)

# Generate a data frame for the grid
grid_data <- expand.grid(Humidity = humidity_values, WindSpeed = wind_speed_values)
grid_data$Temperature <- with(grid_data, 
                              approx(weather_data$Humidity, weather_data$Temperature, Humidity)$y)

# Create 3D surface plot
plot_ly(grid_data, x = ~WindSpeed, y = ~Humidity, z = ~Temperature, 
        type = 'mesh3d') %>%
  layout(scene = list(xaxis = list(title = 'Wind Speed (km/h)'),
                      yaxis = list(title = 'Humidity (%)'),
                      zaxis = list(title = 'Temperature (°C)')))
# Temperature vs Humidity
plot_ly(grid_data, x = ~Humidity, y = ~Temperature, z = ~WindSpeed, 
        type = 'mesh3d') %>%
  layout(scene = list(xaxis = list(title = 'Humidity (%)'),
                      yaxis = list(title = 'Temperature (°C)'),
                      zaxis = list(title = 'Wind Speed (km/h)')))

# Temperature vs Wind Speed
plot_ly(grid_data, x = ~WindSpeed, y = ~Temperature, z = ~Humidity, 
        type = 'mesh3d') %>%
  layout(scene = list(xaxis = list(title = 'Wind Speed (km/h)'),
                      yaxis = list(title = 'Temperature (°C)'),
                      zaxis = list(title = 'Humidity (%)')))
