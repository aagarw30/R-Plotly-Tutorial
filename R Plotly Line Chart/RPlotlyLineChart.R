## Line chart
library(plotly)

# Line chart of storms by year
storms %>% 
  count(year) %>% 
  plot_ly(x=~year, y=~n) %>% 
  add_lines()
