#ui.R for internship project

shinyUI(fluidPage(
  titlePanel("Swallowing Visualizations"),
  sidebarLayout(
    sidebarPanel(
      h2("Variables"),
      selectInput("SubjID", 
                  label="Subj ID",
                  choices=list("V004","V009","V012","V020","V022","V029","V034","V036","V039","V040","V043","V044","V045","V046","V048","V049","V051","V052","V054","V059","V061","V064","V065","V066","V067","V069","V070","V075","V076","V077","V079","V081","V082","V083","V090"),
                  selected="V009"),
      
      selectInput("Time_1",
                  label="Time 1",
                  choices=list("Begin Posterior Movement"="BeginPosteriorMove",
                               "Head Enter Pharynx"="HeadEnterPharynx",
                               "Enter Tail in Pharynx"="EnterTailPharynx",
                               "Begin LVC"="BeginLVC",
                               "End LVC"="EndLVC",
                               "Begin Max Elevation"="BeginMaxElevation",
                               "First Max Elevation"="FirstMaxElevation",
                               "Last Max Elevation"="LastMaxElevation",
                               "First Max Anterior"="FirstMaxAnterior",
                               "Last Max Anterior"="LastMaxAnterior",
                               "Return to Rest"="ReturnToRest",
                               "CP Open"="CPopen",
                               "Head Into CP"="HeadIntoCP",
                               "Tail into CP"="TailIntoCP",
                               "CP Closed"="CPclosed"),
                  selected="Begin Posterior Move"),
      
      selectInput("Time_2",
                  label="Time 2",
                  choices=list("Begin Posterior Movement"="BeginPosteriorMove",
                               "Head Enter Pharynx"="HeadEnterPharynx",
                               "Enter Tail in Pharynx"="EnterTailPharynx",
                               "Begin LVC"="BeginLVC",
                               "End LVC"="EndLVC",
                               "Begin Max Elevation"="BeginMaxElevation",
                               "First Max Elevation"="FirstMaxElevation",
                               "Last Max Elevation"="LastMaxElevation",
                               "First Max Anterior"="FirstMaxAnterior",
                               "Last Max Anterior"="LastMaxAnterior",
                               "Return to Rest"="ReturnToRest",
                               "CP Open"="CPopen",
                               "Head Into CP"="HeadIntoCP",
                               "Tail into CP"="TailIntoCP",
                               "CP Closed"="CPclosed"),
                  selected="CPclosed")
    ),
    # checkboxGroupInput("checkGroup", 
    #                    label = h3("X-axis Range"), 
    #                    choices = list("1.5" = 1.5, 
    #                                   "3" = 3),
    #                    selected = 1.5),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot",plotOutput("plot")),
        tabPanel("Table",tableOutput("swallowtable"))
      )
      #textOutput("text1"),
      # br(),
      # br(),
      # br(),
      # plotOutput("plot"),
      # br(),
      # br(),
      # tableOutput("swallowtable")
    )
  )
))