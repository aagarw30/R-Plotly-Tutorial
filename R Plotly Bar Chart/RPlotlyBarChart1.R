## Bar chart
library(plotly)
## Creating a Bar chart - No. of cyl (Bar chart)
# Different color of bars . Changing the colors of the bar
# Annotations on the bars
# Update the hover text

mtcars %>% 
  count(cyl) %>%  ## count to get the frequency table (from dplyr package)
  plot_ly(x=~as.factor(cyl), y=~n, color=~as.factor(cyl)) %>%  # apply plotly on the frequency data
  add_bars() %>% 
  layout(title="Plotly Bar Chart",
         xaxis = list(title="No. of Cylinders"),
         yaxis = list(title = "Count"))

## Stacked Bar chart
mtcars %>% 
  count(cyl, am) %>%  ## count to get the frequency table (from dplyr package)
  plot_ly(x=~as.factor(cyl), y=~n, color=~as.factor(am)) %>%  # apply plotly on the frequency data
  add_bars() %>% 
  layout(title="Plotly Stacked Bar Chart",
         xaxis = list(title="No. of Cylinders"),
         yaxis = list(title = "Count"),
         barmode="stack")

## Bar mode example
## Add annotation on the stacked bars
storms %>% 
  count(year, status) %>%
  plot_ly(x=~year , y =~n, color=~status) %>% 
  add_bars() %>% 
  layout(barmode="stack")


# bar chart of storms by month
# add_bars() function is wrapper for bar trace
# Needs 2 variables as the arguments
# Used for the continous or discrete numeric variables
# Horizontal & vertical alignment
# Name the annotations on plotly graph
# Name the axis
# Adjusting the axis scale
# Bar chart Colours
# Bar Modes

storms %>% 
  count(month) %>%
  plot_ly(x=~month , y =~n) %>% 
  add_bars() %>% 
  layout(
    title = "Number of storms by Month ", 
    xaxis = list(title = "Month (1 thru 12)", showgrid = FALSE, showline = FALSE, zeroline=F),
    yaxis = list(title = "No. of Storms", showgrid = FALSE, showline = FALSE, zeroline=F)) %>% 
  add_annotations(
    xref = 'x',
    yref = 'y',
    text = ~n, 
    showarrow = FALSE,
    yanchor = "bottom")


# bar chart of storms by year and status

# bar chart of storms by year
storms %>% 
  group_by(year) %>% 
  tally() %>%
  plot_ly(x=~year , y =~n) %>% 
  add_bars()


# bar chart of storms by year and category
storms %>% 
  count(year, category) %>%
  plot_ly(x=~year , y =~n, color=~category) %>% 
  add_bars() %>% 
  layout(barmode="stack")

