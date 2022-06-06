overview_main_page  <- mainPanel(
  h1("An Analysis of Spotify's Top Charted Songs From 2010-2019"),
  h2("by: Alex, Alicia, Harmony, and Jinny"),
  p("We started this project with the initial interest centering around the top charts. Particularlly genres 
  and traits that contributed as to why these songs ended up in the top charts. The focus later then changed to 
  the trait of danceability. As college students, music is such a big thing in our lives which is why we chose
  to center this project around music. In our exploration of the data we chose to have visulaizations around threee questions.
  The first being, how do other musical factors play into the danceability of music? 
  Secondly, does song energy, or tempo, have a correlation with song danceability? 
  Lastly, this last question was generally unrelated to the other parts of the data we explored but we still had in interest in.
  We used the data to answer the question of, what artist types trended the most on the charts?

We started off and included a handful of datasets in our project but ended up using one. The dataset we chose to use is from Kaggle. 
    This data is created by Leonardo Henrique and is composed of the top songs from the charts of 2010-2019."),
  p("In this project we will be taking a look at the top charted Spotify songs in the decade of 2010-2010. 
    We plan on exploring the musical traits of these top charted songs to find any correlation. 
    Perhaps to answer the question, what makes a top charted song?")
)

overview_side_panel <- sidebarPanel(
  img("Spotify logo", src = "spotify.png", hight = 300, width = 300))

overview <- tabPanel("Project Summary",
                     sidebarLayout(overview_main_page, overview_side_panel))



page_vic_sidepanel <- sidebarPanel(
  numericInput(
    inputId = "year",
    label = h2(
      "Enter a year from 2010 to 2019 for chart details"),
    value = 2000,
    min = 2010,
    max = 2019
  )
)
page_vic_mainpanel <- mainPanel(
  h2("Scale of each musical factor in each year"),
  plotOutput(outputId = "plot")
)
page_one <- tabPanel("Page One",
                     sidebarLayout(page_vic_sidepanel, page_vic_mainpanel))


page_o_mainpanel <- mainPanel(
  h2("Songs on the 2010-2019 Charts"),
  plotlyOutput(outputId = "message2")
)


page_o_sidepanel <- sidebarPanel(
  
  sliderInput(
    inputId = "Years",
    label = h2("Slide to view each year's top songs"),
    value = 1,
    min = 2010,
    max = 2019
  )
)

page_two <- tabPanel("Page Two",
                     sidebarLayout(page_o_sidepanel, page_o_mainpanel))
page_o_mainpanel <- mainPanel(
  h2("Songs on the 2010-2019 Charts"),
  plotlyOutput(outputId = "message2")
)

page_o_sidepanel <- sidebarPanel(
  
  sliderInput(
    inputId = "Years",
    label = h2("Slide to view each year's top songs"),
    value = 1,
    min = 2010,
    max = 2019
  )
)



page_three <- tabPanel("Page Three",
                       sidebarLayout(page_o_sidepanel, page_o_mainpanel))

summary_o_mainpanel <- mainPanel(
  p("In this project we analyized musical qualities of top chart songs in the 2010-2019 era.
    From the visualizations we can see how musical qualities lined up and what effect they had 
    on songs during
    this era.")
)


summary_o_sidepanel <- sidebarPanel(
  h2("Project Conclusion")
  
)

summary_section <- tabPanel("Summary",
                            sidebarLayout(summary_o_sidepanel, summary_o_mainpanel))

ui <- navbarPage("Spotify Analysis", overview, page_one, page_two, page_three,
                 summary_section)






