# Linked scatter plots 2
### Linked Scatter Plots
shared_data2 = SharedData$new(storms)

# Scatter plot 1
p1 = shared_data2 %>% 
  plot_ly(x =~pressure , y =~wind ) %>% 
  add_markers()

# Scatter plot 2
p2 = shared_data2 %>% 
  plot_ly(x =~wind , y =~pressure ) %>% 
  add_markers()

# Combine the plots using subplot 
subplot(p1,p2) %>% 
  highlight(on="plotly_hover", off="plotly_deselect") %>% 
  hide_legend()