#Assignment 3 --- Figure 2

#Link to dataset of choice:

#I've picked the cucumber production and yield this time : 
#https://data.ontario.ca/dataset/aggregated-cucumber-production-and-yields
#I've also attached the xlsx for convenience

#--- because there was a time where cucumber salad was viral from tiktok LOL

# Load necessary libraries
library(readxl)
library(ggplot2)
library(patchwork)

# Path to the Excel file
file_path <- "/Users/lilianawu/visualization/02_activities/assignments/cucumber_en.xlsx"

# Read the Excel file
df_clean <- read_excel(file_path)

# Clean column names (remove leading/trailing spaces)
colnames(df_clean) <- trimws(colnames(df_clean))

# Convert necessary columns to numeric
df_clean$Year <- as.numeric(df_clean$Year)
df_clean$`Harvested Area      (acres)` <- as.numeric(df_clean$`Harvested Area      (acres)`)
df_clean$`Average Price   (cents/lb)` <- as.numeric(df_clean$`Average Price   (cents/lb)`)
df_clean$`Average Yield      (lbs/acre)` <- as.numeric(df_clean$`Average Yield      (lbs/acre)`)

# Create the three plots
p1 <- ggplot(df_clean, aes(x = Year, y = `Harvested Area      (acres)`)) +
  geom_line(color = "green", linewidth = 1) +  # <-- updated here
  geom_point(shape = 15, color = "green", size = 2) +
  labs(y = "Harvested Area (acres)", title = "Cucumber and Gherkin Production Metrics in Ontario") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))


p2 <- ggplot(df_clean, aes(x = Year, y = `Average Price   (cents/lb)`)) +
  geom_line(color = "blue", linewidth = 1) +
  geom_point(shape = 16, color = "blue", size = 2) +
  labs(y = "Avg Price (cents/lb)") +
  theme_minimal()

p3 <- ggplot(df_clean, aes(x = Year, y = `Average Yield      (lbs/acre)`)) +
  geom_line(color = "red", linewidth = 1) +
  geom_point(shape = 17, color = "red", size = 2) +
  labs(y = "Avg Yield (lbs/acre)", x = "Year") +
  theme_minimal()

# Combine plots vertically
final_plot <- p1 / p2 / p3 

# Show the plot
print(final_plot)


#What software did you use to create your data visualization?
  #I used Python with pandas and matplotlib libraries

# Who is your intended audience? 
 # Agriculture researchers, policymakers, and students interested in Ontario cucumber crop production.

# What information or message are you trying to convey with your visualization? 
 # I want to show how harvested area, average price, and average yield of cucumbers have changed over time in Ontario.

# What aspects of design did you consider when making your visualization? How did you apply them? With what elements of your plots? 
 # I focused on clarity and readability by using clear axis labels, different colors for each plot (green, blue, red), and markers to highlight data points. I also made sure the axis (year) matched for all plots... didn't want to repeate the x-axis on all of them to avoid visual cluterring 

#How did you ensure that your data visualizations are reproducible? If the tool you used to make your data visualization is not reproducible, how will this impact your data visualization? 
  #I made it reproducible by writing the code in R so anyone can rerun it with the same dataset. I've also attached the excel file 

# How did you ensure that your data visualization is accessible?
 # High contrast colors for each figure.   

# Who are the individuals and communities who might be impacted by your visualization?  
 # Farmers, agriculture organizations, food policymakers, educators, tiktokers who want to buy cucumbers to make the viral cucumber salad recipe lol 

# How did you choose which features of your chosen dataset to include or exclude from your visualization? 
 # I included harvested area, price, and yield because they best represent production trends; I excluded other columns like production value to keep the figure simple

# What ‘underwater labour’ contributed to your final data visualization product?
 # I had to clean the dataset, manually exclude some of the headings and footnotes, fix column names --> convert them to numeric. 