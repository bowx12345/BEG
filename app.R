# Mononono
An RShiny app developed by students of Singapore Polytechnic for their final year project. App is derived from GeneCloudOmnics.
#code for our app.R Mononono

# https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# Concepts about Reactive programming used by Shiny, 
# https://shiny.rstudio.com/articles/reactivity-overview.html

# Load R packages
library(shiny)
library(shinythemes)

# NAVBAR PAGE SHD CONTAIN THE NAVBAR MENUS
# FLUIDPAGE SHD CONTAIN EVERYTH IN UI
# FIND TPM() FUNCTION PACKAGE
# Error in stopifnot: argument "meanFragmentLength" is missing, with no default

# Sys.setenv("plotly_username"=" your_plotly_username")
# Sys.setenv("plotly_api_key"="your_api_key")
## test repo

# wd <- dirname(rstudioapi::getActiveDocumentContext()$path) # set wd as the current folder
# print(wd == getwd())
# print(wd)
# print(getwd())
# if (!wd == getwd()) {
#   setwd(wd)
# }

print("start loading")
start.load <- Sys.time() ### time

library(DESeq2)
if (length(find.package(package = "countToFPKM", quiet = T)) > 0) {
  library(countToFPKM)
} else {
  print("Package countToFPKM not installed")
  BiocManager::install("countToFPKM")
  print("Package countToFPKM installed")
  library(countToFPKM)
}
if (length(find.package(package = "actuar", quiet = T)) > 0) {
  library(actuar)
} else {
  print("Package actuar not installed")
  install.packages("actuar")
  print("Package actuar installed")
  library(actuar)
}
if (length(find.package(package = "fitdistrplus", quiet = T)) > 0) {
  library(fitdistrplus)
} else {
  print("Package fitdistrplus not installed")
  install.packages("fitdistrplus")
  print("Package fitdistrplus installed")
  library(fitdistrplus)
}
if (length(find.package(package = "viridis", quiet = T)) > 0) {
  library(viridis)
} else {
  print("Package viridis not installed")
  install.packages("viridis")
  print("Package viridis installed")
  library(viridis)
}
if (length(find.package(package = "MASS", quiet = T)) > 0) {
  library(MASS)
} else {
  print("Package MASS not installed")
  BiocManager::install("MASS")
  print("Package MASS installed")
  library(MASS)
}
if (length(find.package(package = "EDASeq", quiet = T)) > 0) {
  library(EDASeq)
} else {
  print("Package EDASeq not installed")
  BiocManager::install("EDASeq")
  print("Package EDASeq installed")
  library(EDASeq)
}
if (length(find.package(package = "shiny", quiet = T)) > 0) {
  library(shiny)
} else {
  print("Package shiny not installed")
  install.packages("shiny")
  print("Package shiny installed")
  library(shiny)
}

if (length(find.package(package = "cyjShiny", quiet = T)) > 0) {
  library(cyjShiny)
} else {
  remotes::install_github("cytoscape/cyjShiny")
  library(cyjShiny)
}

if (length(find.package(package = "shinythemes", quiet = T)) > 0) {
  library(shinythemes)
} else {
  print("Package shinythemes not installed")
  install.packages("shinythemes")
  print("Package shinythemes installed")
  library(shinythemes)
}

if (length(find.package(package = "rstudioapi", quiet = T)) > 0) {
  library(rstudioapi)
} else {
  install.packages("rstudioapi")
  library(rstudioapi)
}

if (!length(find.package(package = "rlang", quiet = T)) > 0) {
  install.packages("rlang")
}

#################################
if (length(find.package(package = "RColorBrewer", quiet = T)) > 0) {
  library(RColorBrewer)
} else {
  install.packages("RColorBrewer")
  library(RColorBrewer)
}

if (length(find.package(package = "kohonen", quiet = T)) > 0) {
  library(kohonen)
} else {
  install.packages("kohonen")
  library(kohonen)
}

if (length(find.package(package = "sparsepca", quiet = T)) > 0) {
  library(sparsepca)
} else {
  install.packages("sparsepca")
  library(sparsepca)
}

if (length(find.package(package = "randomForest", quiet = T)) > 0) {
  library(randomForest)
} else {
  install.packages("randomForest") 
  library(randomForest)
}

if (length(find.package(package = "cluster", quiet = T)) > 0) {
  library(cluster)
} else {
  install.packages("cluster")
  library(cluster)
}

if (length(find.package(package = "ComplexHeatmap", quiet = T)) > 0) {
  library(ComplexHeatmap)
} else {
  BiocManager::install("ComplexHeatmap")
  library(ComplexHeatmap)
}

## for t-sne
# if (length(find.package(package = "reticulate", quiet = T)) > 0) {
#   library(reticulate)
# } else {
#   install.packages("reticulate")
#   library(reticulate)
# }

if (length(find.package(package = "Rtsne", quiet = T)) > 0) {
  library(Rtsne)
} else {
  install.packages("Rtsne")
  library(Rtsne)
}

######################################For Report Generation#################
if (length(find.package(package = "webshot2", quiet = T)) > 0) {
  library(webshot2)
} else {
  remotes::install_github("rstudio/webshot2")
  library(webshot2)
}
library(gridExtra)
library(plotly)
if (!require("processx")) install.packages("processx")
library(png)

if (length(find.package(package = "capture", quiet = T)) > 0) {
  library(capture)
} else {
  remotes::install_github("dreamRs/capture")
  library(capture)
}

####################### Dependencies For RAFSIL ###################################
# if (length(find.package(package = "RAFSIL", quiet = T)) > 0) {
#   library(RAFSIL)
# }

if (length(find.package(package = "gridGraphics", quiet = T)) > 0) {
  library(gridGraphics)
} else {
  install.packages("gridGraphics")
  library(gridGraphics)
}

if (length(find.package(package = "gridExtra", quiet = T)) > 0) {
  library(gridExtra)
} else {
  install.packages("gridExtra")
  library(gridExtra)
}

if (length(find.package(package = "tidyverse", quiet = T)) > 0) {
  library(tidyverse)
} else {
  install.packages("tidyverse", dependencies = TRUE)
  library(tidyverse)
}

if (length(find.package(package = "ggpubr", quiet = T)) > 0) {
  library(ggpubr)
} else {
  install.packages("ggpubr")
  library(ggpubr)
}

if (length(find.package(package = "networkD3", quiet = T)) > 0) {
  library(networkD3)
} else {
  install.packages("https://cran.r-project.org/src/contrib/Archive/networkD3/networkD3_0.2.10.tar.gz", repo=NULL, type="source")
  library(networkD3)
}

if (length(find.package(package = "data.tree", quiet = T)) > 0) {
  library(data.tree)
} else {
  install.packages("data.tree")
  library(data.tree)
}


if (length(find.package(package = "bubbles", quiet = T)) > 0) {
  library(bubbles)
} else {
  devtools::install_github("jcheng5/bubbles", upgrade = FALSE)
  library(bubbles)
}

###################################################################################
####################### Dependencies For Uniprot ###################################

if (length(find.package(package = "UniprotR", quiet = T)) > 0) {
  library(UniprotR)
} else {
  install.packages("UniprotR")
  library(UniprotR)
}

if (length(find.package(package = "scales", quiet = T)) > 0) {
  library(scales)
} else {
  install.packages("scales")
  library(scales)
}

###################################################################################

####################### Dependencies For Pathway Enrichment ###################################

if (length(find.package(package = "gprofiler2", quiet = T)) > 0) {
  library(gprofiler2)
} else {
  install.packages("gprofiler2")
  library(gprofiler2)
}

###################################################################################

####################### Dependencies For Protein Interactions ###################################

if (length(find.package(package = "httr", quiet = T)) > 0) {
  library(httr)
} else {
  install.packages("httr")
  library(httr)
}

if (length(find.package(package = "curl", quiet = T)) > 0) {
  library(curl)
} else {
  install.packages("curl")
  library(curl)
}

if (length(find.package(package = "later", quiet = T)) > 0) {
  library(later)
} else {
  install.packages("later")
  library(later)
}

if (length(find.package(package = "qdapTools", quiet = T)) > 0) {
  library(qdapTools)
} else {
  install.packages("qdapTools")
  library(qdapTools)
}

if (length(find.package(package = "alakazam", quiet = T)) > 0) {
  library(alakazam)
} else {
  install.packages("https://cran.r-project.org/src/contrib/Archive/alakazam/alakazam_1.0.0.tar.gz", repo=NULL, type="source")
  library(alakazam)
}

if (length(find.package(package = "msa", quiet = T)) > 0) {
  library(msa)
} else {
  BiocManager::install("msa", update = FALSE)
  library(msa)
}

if (length(find.package(package = "ape", quiet = T)) > 0) {
  library(ape)
} else {
  install.packages("ape")
  library(ape)
}

if (length(find.package(package = "seqinr", quiet = T)) > 0) {
  library(seqinr)
} else {
  install.packages("seqinr")
  library(seqinr)
}

if (length(find.package(package = "qdapRegex", quiet = T)) > 0) {
  library(qdapRegex)
} else {
  install.packages("qdapRegex")
  library(qdapRegex)
}

###################################################################################

####################### Dependencies For Co-expression ###################################

if (length(find.package(package = "shinyjs", quiet = T)) > 0) {
  library(shinyjs)
} else {
  install.packages("shinyjs")
  library(shinyjs)
}

###################################################################################

####################### Dependencies For Microarray ###################################

if (length(find.package(package = "devtools", quiet = T)) > 0) {
  library(devtools)
} else {
  install.packages("devtools")
  library(devtools)
}

if (length(find.package(package = "remotes", quiet = T)) > 0) {
  library(remotes)
} else {
  devtools::install_github("r-lib/remotes")
  library(remotes)
}

if (length(find.package(package = "maEndToEnd", quiet = T)) > 0) {
  suppressPackageStartupMessages({library("maEndToEnd")})
} 
# else {
#   remotes::install_github("b-klaus/maEndToEnd", ref="master")
#   suppressPackageStartupMessages({library("maEndToEnd")})
# }

if (length(find.package(package = "oligoClasses", quiet = T)) > 0) {
  library(oligoClasses)
} else {
  print("Package oligoClasses not installed")
  BiocManager::install("oligoClasses")
  print("Package oligoClasses installed")
  library(oligoClasses)
}

if (length(find.package(package = "ArrayExpress", quiet = T)) > 0) {
  library(ArrayExpress)
} else {
  print("Package ArrayExpress not installed")
  BiocManager::install("ArrayExpress")
  print("Package ArrayExpress installed")
  library(ArrayExpress)
}

if (length(find.package(package = "pd.hugene.1.0.st.v1", quiet = T)) > 0) {
  library(pd.hugene.1.0.st.v1)
} else {
  print("Package pd.hugene.1.0.st.v1 not installed")
  BiocManager::install("pd.hugene.1.0.st.v1")
  print("Package pd.hugene.1.0.st.v1 installed")
  library(pd.hugene.1.0.st.v1)
}

if (length(find.package(package = "hugene10sttranscriptcluster.db", quiet = T)) > 0) {
  library(hugene10sttranscriptcluster.db)
} else {
  print("Package hugene10sttranscriptcluster.db not installed")
  BiocManager::install("hugene10sttranscriptcluster.db")
  print("Package hugene10sttranscriptcluster.db installed")
  library(hugene10sttranscriptcluster.db)
}

if (length(find.package(package = "arrayQualityMetrics", quiet = T)) > 0) {
  library(arrayQualityMetrics)
} else {
  print("Package arrayQualityMetrics not installed")
  BiocManager::install("arrayQualityMetrics")
  print("Package arrayQualityMetrics installed")
  library(arrayQualityMetrics)
}

if (length(find.package(package = "limma", quiet = T)) > 0) {
  library(limma)
} else {
  print("Package limma not installed")
  BiocManager::install("limma")
  print("Package limma installed")
  library(limma)
}

if (length(find.package(package = "topGO", quiet = T)) > 0) {
  library(topGO)
} else {
  print("Package topGO not installed")
  BiocManager::install("topGO")
  print("Package topGO installed")
  library(topGO)
}

if (length(find.package(package = "ReactomePA", quiet = T)) > 0) {
  library(ReactomePA)
} else {
  print("Package ReactomePA not installed")
  BiocManager::install("ReactomePA")
  print("Package ReactomePA installed")
  library(ReactomePA)
}

###################################For GEO import###############################
library(xml2)
if (length(find.package(package = "GEOquery", quiet = T)) > 0) {
  library(GEOquery)
} else {
  BiocManager::install("GEOquery")
  library(GEOquery)
}
if (length(find.package(package = "umap", quiet = T)) > 0) {
  library(umap)
} else {
  install.packages("umap")
  library(umap)
}
if (length(find.package(package = "maptools", quiet = T)) > 0) {
  library(maptools)
} else {
  install.packages("maptools", repos="http://R-Forge.R-project.org")
  library(maptools)
}



###################################################################################
########################### Style files for Cytoscape.js ################

styles <- c(
  "generic style"="./www/style/basicStyle.js",
  "red-yellow"="./www/style/red-yellow.js",
  "red-pink" = "./www/style/red-pink.js",
  "green-blue"="./www/style/green-blue.js",
  "green-blue(ppi)"="./www/style/green-blue(ppi).js")

##########################################################################

#
# ## sourcing util files
#source("./www/utils.R")
#source("./www/PhyscochemicalSep.R")

#
#loadPkg()

#id_to_name <- read.csv(paste0("./www/TransTable_Human.csv"))


#################### Complex Enrichment ##########################

#complexes <- load(paste0("./www/allComplexes.RData")) #allComplexes is masked under complexes
#up_corum_mapping <- read.csv(paste0("./www/UniProt_CORUM_Mapping.csv"))

##################################################################


end.load <- Sys.time()
print("loading time")
print(end.load - start.load)






# Define UI
   ui = fluidPage(theme = shinytheme("united"),
                navbarPage(
                  # theme = "united",  # <--- To use a theme, uncomment this
                  "zao shang hao",
########################################################################################                  
                  # NAVBAR 1
                  navbarMenu("Preprocessing",
                             ### RNA SEQ DATA IMPORT ###
                             tabPanel(
                               "RNASeq Data", 
                               value = "active_tab_rnaseq",
                               tabsetPanel(
                                 id = "Rnaseq_pre",
                                 tabPanel(
                                   "Upload data",
                                   sidebarPanel(
                                     radioButtons(
                                       "file_type", "Choose File Type",
                                       c("Raw file (read count)" = "raw", "Normalised file" = "norm")
                                     ),
                                     conditionalPanel(
                                       condition = "input.file_type=='raw'",
                                       fileInput("file1", "Choose Raw Counts (required)"),
                                       fileInput("length1", "Choose Gene Length (optional)"), # gene id + length
                                       fileInput("spikes1", "Choose negative controls (eg. ERCC Spike-in) (optional)")
                                     ),
                                     conditionalPanel(
                                      condition = "input.file_type=='norm'",
                                      fileInput("file2", "Choose Normalized Expression (required)"),
                                      ),
                                     fileInput("metafile1", "Choose Meta Data File (required)"),
                                     actionButton("submit_input", "Submit")
                                   )
                                   ),
                                 
                               
                                 tabPanel(
                                   "Preprocessing",
                                   value="active_tab_preprocessing_rnaseq",
                                   sidebarPanel(
                                     h4("Filtering"),
                                     splitLayout(
                                       numericInput("min_val", "Min. value", min = 0.1, step = 0.1, value = 1.0),
                                       numericInput("min_col", "Min. columns", min = 1, value = 2)
                                     ),
                                     conditionalPanel(
                                       condition = "input.file_type=='raw'",
                                       radioButtons(
                                         "norm_method", "Normalisation method",
                                         c(
                                           "None (Black)" = "None",
                                           "TPM (Gene length input required)" = "TPM"      
                                         )
                                       )
                                     ),
                                     actionButton("submit_preprocessing", "Submit"),
                                     conditionalPanel(
                                       condition = "input.preprocessing_tabs == 'Data table' ",
                                       br(),
                                       br(),
                                       downloadButton("download_norm_data", "Download table (csv)")
                                     )
                                   ),
                                   mainPanel(
                                     h3("Preprocessing Rnaseq data"),
                                     tabsetPanel(
                                       type = "tabs", id = "preprocessing_tabs",
                                       tabPanel(
                                         "RLE plot",
                                         conditionalPanel(
                                           condition = "$('html').hasClass('shiny-busy')",
                                           div(img(src = "load.gif", width = 240, height = 180),
                                               h4("Processing ... Please wait"),
                                               style = "text-align: center;"
                                           )
                                         ),
                                         conditionalPanel(
                                           condition = "!$('html').hasClass('shiny-busy')",
                                           plotOutput("RLE.plot2")
                                         ),
                                         
                                         conditionalPanel(
                                           condition = "input.file_type=='raw'",
                                           conditionalPanel(
                                             condition = "$('html').hasClass('shiny-busy')",
                                             div(img(src = "load.gif", width = 240, height = 180),
                                                 h4("Processing ... Please wait"),
                                                 style = "text-align: center;"
                                             )
                                           ),
                                           conditionalPanel(
                                             condition = "!$('html').hasClass('shiny-busy')",
                                             plotOutput("RLE.plot")
                                           )
                                         )
                                       ),
                                       tabPanel(
                                         "Violin Plot",
                                         conditionalPanel(
                                           condition = "$('html').hasClass('shiny-busy')",
                                           div(img(src = "load.gif", width = 240, height = 180),
                                               h4("Processing ... Please wait"),
                                               style = "text-align: center;"
                                           )
                                         ),
                                         conditionalPanel(
                                           condition = "!$('html').hasClass('shiny-busy')",
                                           plotlyOutput("violin_plot2")
                                         ),
                                         conditionalPanel(
                                           condition = "!$('html').hasClass('shiny-busy')",
                                           plotlyOutput("violin_plot")
                                         )
                                       ),
                                       tabPanel(
                                         "Data table",
                                         h3("Normalized data"),
                                         DT::dataTableOutput("norm_table")
                                       ),
                                       tabPanel(
                                         "Description table",
                                         h3("Data description"),
                                         DT::dataTableOutput("meta_table")
                                       )
                                     )
                                   )
                                 )
                               )
                             ),
                             ### MICROARRAY DATA ###     
                             tabPanel(
                               "Microarray Data",
                               value = "active_tab_micro",
                               sidebarPanel(
                                 fileInput("file_micro", "Choose Microarray Data"),
                                 downloadButton("downloadMicroRaw", "Download Raw Data as CSV"),
                                 br(), br(),
                                 downloadButton("downloadMicroMeta", "Download Meta Data as CSV")
                               ),
                               
                               mainPanel(
                                 h3("Preprocessing Microarray Data"),
                                 conditionalPanel(
                                   condition = "$('html').hasClass('shiny-busy')",
                                   div(img(src = "load.gif", width = 240, height = 180),
                                       h4("Processing ... Please wait"),
                                       style = "text-align: center;"
                                   )
                                 )
                               )
                             ),
                             ### GEO DATA IMPORT ###
                             tabPanel(
                               "GEO Data Import",
                               value = "active_tab_geo",
                               sidebarPanel(
                                 tabsetPanel(type="tabs", id = "geo_tab",
                                             tabPanel("GEO DATA",
                                                      div(class= "header","For Example: GSE153941"),
                                                      textInput("geo_acc_no", "Enter Accession Number", value = "", width = NULL, placeholder = NULL),
                                                      radioButtons("file_type_button","FILE TYPE",
                                                                   c("RnaSeq","Microarray","Auto")),
                                                      actionButton("submit_geo_acc_no", "Submit")),
                                             tabPanel("PREPROCESSING",value="geo_pre",radioButtons("file_name_button","SELECT FILE",
                                                                                                   c("a")),              
                                                      fileInput("length2", "Choose Gene Length (optional)"), # gene id + length
                                                      
                                                      
                                                      fileInput("spikes2", "Choose negative controls (eg. ERCC Spike-in) (optional)"),
                                                      actionButton("submit_geo_preprocessing", "Submit"),
                                                     )             
                                             )
                                            ),
                                mainPanel(
                                  h3("GEO DATA IMPORT"),
                                  tabsetPanel(type ="tabs", 
                                              tabPanel(
                                               uiOutput("help_text_geo")
                                              )
                                              ),
                                 h4("Overview of GEO Imported Data"),
                                 tabsetPanel(type ="tabs",  tabPanel("Box Plot",plotOutput("geo_box_plot")),
                                             tabPanel("Expression Density", plotOutput("geo_expr_plot")),
                                             tabPanel("Mean variance", plotOutput("geo_mean_plot")),
                                             tabPanel("UMAP", plotOutput("geo_umap_plot")))
                                         )
                                     )
                             ), ## END OF NAVBAR 1
########################################################################################################
                # NAVBAR2
                  ### TRANSCRIPTOME ANALYSIS ###
navbarMenu('Transcriptome Analysis',
           tabPanel(
             "    Scatter    ",
             sidebarPanel(
               selectInput(inputId = "scatter.x", label = "X-axis", choices = ""),
               selectInput(inputId = "scatter.y", label = "Y-axis", choices = ""),
               radioButtons(
                 "trans", "Transformation:",
                 c("None", "Natural log", "log2", "log10")
               ),
               checkboxInput("regline", "Display regression line", value = FALSE),
               actionButton("submit_scatter", "Plot"),
               br(),
               br(),
               downloadButton("downloadscatter", "Download as PDF"),
               #h6("Download all pairs of samples in one PDF (this may take some time to run) :"),
               br(),
               br(),
               actionButton("add_scatter","Add to report"),
               downloadButton("downloadscatter_collage", "Download collage")
             ),
             mainPanel(
               h3("Heatscatter"),
               uiOutput("help_text_scatter"),
               plotlyOutput("scatter.plot"),
               #      tags$script('
               # document.getElementById("downloadscatter").onclick = function() {
               # var gd = document.getElementById("scatter.plot");
               # Plotly.Snapshot.toImage(gd, {format: "png"}).once("success", function(url) {
               #   var a = window.document.createElement("a");
               #   a.href = url; 
               #   a.type = "image/png";
               #   a.download = "plot.png";
               #   document.body.appendChild(a);
               #   a.click();
               #   document.body.removeChild(a);                      
               # });
               # }
               # ')
             )
           ),
                           ### DISTRIBUTION FITTING ##
                             tabPanel(
                               "Distribution Fit",
                               sidebarPanel(
                                 conditionalPanel(
                                   condition = "input.dist_tabs=='Distribution Fit'",
                                   selectInput(inputId = "dist.var", label = "Choose a column", choices = colnames("dataset")),
                                   checkboxGroupInput("distributions", "Distributions:",
                                                      choices = c("Log-normal", "Log-logistic", "Pareto", "Burr", "Weibull", "Gamma"), selected = c("Log-normal", "Pareto")
                                   ),
                                   radioButtons("dist_zoom", "Zoom to see fit", c("slider", "text input")),
                                   conditionalPanel(
                                     condition = "input.dist_zoom=='slider'",
                                     sliderInput("dist_range", "Range:",
                                                 min = 0.1, max = 1000, step = 1,
                                                 value = c(0.1, 1000)
                                     )
                                   ),
                                   actionButton("submit_distfit","Plot"),
                                   conditionalPanel(
                                     condition = "input.dist_zoom=='text input'",
                                     textOutput("dist_range_allowed"),
                                     numericInput("dist_range_min", "min", value = 0.1, min = 0.1, max = 1000),
                                     numericInput("dist_range_max", "max", value = 1000, min = 0.1, max = 1000)
                                   ),
                                   downloadButton("downloaddist", "Download as PDF")
                                 ),
                                 conditionalPanel(
                                   condition = "input.dist_tabs=='AIC table'",
                                   downloadButton("downloaddistaic", "Download as CSV")
                                 ),
                                 checkboxInput("checkbox_distfit", label = "Distribution Fit", value = FALSE),
                                 checkboxInput("checkbox_aic", label = "AIC table", value = FALSE),
                                 actionButton("add_distfit","Add to report")
                               ),
                               mainPanel(
                                 h3("Distribution Fit"),
                                 tabsetPanel(
                                   type = "tabs", id = "dist_tabs",
                                   tabPanel(
                                     "Distribution Fit",
                                     uiOutput("help_text_dis_fit"),
                                     plotOutput("dist.plot")),
                                   tabPanel(
                                     "AIC table",
                                     conditionalPanel(
                                       condition = "$('html').hasClass('shiny-busy')",
                                       div(img(src = "load.gif", width = 240, height = 180),
                                           h4("Processing ... Please wait"),
                                           style = "text-align: center;"
                                       )
                                     ),
                                     conditionalPanel(
                                       condition = "!$('html').hasClass('shiny-busy')",
                                       div(tableOutput("dist.aic"), style = "font-size:80%")
                                     )
                                   )
                                 )
                               )
                             )
                           ### WE HAVE TO CODE ALL THESE OURSELVES FML ###
                           ### CUTOFF DETERMINATION ### (PUT UNDER DISTRIBUTION FITTING)
                            ),# END OF NAVBAR 2
### NAVBAR 3 = TOGGLE GENE ANALYSIS ### 
                  navbarMenu('Toggle Gene analysis',
                             ### Toggle Gene extraction ###
                             tabPanel('Toggle Gene extraction',
                                      sidebarPanel(
                                        selectInput(inputId = "rep1.toggle", label = "Sample 1", choices = "nms"),
                                        selectInput(inputId = "rep2.toggle", label = "Sample 2", choices = "nms"),
                                        actionButton("submit_input.1", "Submit"),
                                        downloadButton("download_tog_data", "Download table (csv)")
                                        ),
                                      ### rep 1 and 2 toggles are 1st and 2nd columns of toggle gene matrix
                             mainPanel(h3('Toggle Genes between Replicates'),
                                       div(dataTableOutput("toggle.genes.df"), style = "font-size:80%")
                                       )
                             ),
                             ### Gene Ontology ###
                             tabPanel(
                               "Gene ontology",
                               sidebarPanel(
                                 withTags({
                                   div(class = "header",
                                       p("Example ", a("here", href = "https://github.com/buithuytien/GeneCloudOmics/blob/online-version/Test%20data/gene_id.csv", target="_blank")),
                                   )
                                 }),
                                 fileInput("file_uniprot", "Upload UniProt accession CSV file"),
                                 textInput("text_uniprot", "Enter UniProt accession csv file"),
                                 actionButton("submit_uniprot", "Submit"),br(),br(),
                                 conditionalPanel(
                                   condition = "input.uniprot_tabs == 'Biological process'",
                                   downloadButton("download_bio_plot", "Download Plot"),br(),br(),
                                   downloadButton("download_bio_pro", "Download Table")
                                 ),
                                 conditionalPanel(
                                   condition = "input.uniprot_tabs == 'Molecular function'",
                                   downloadButton("download_mole_plot", "Download Plot"),br(),br(),
                                   downloadButton("download_mole_func", "Download Table")
                                 ),
                                 conditionalPanel(
                                   condition = "input.uniprot_tabs == 'Cellular component'",
                                   downloadButton("download_cell_plot", "Download Plot"),br(),br(),
                                   downloadButton("download_cell_comp", "Download Table")
                                 ),
                                 checkboxInput("checkbox_bio_proc_plot", label = "Biological Process Plot", value = FALSE),
                                 checkboxInput("checkbox_bio_proc_table", label = "Biological Process Table", value = FALSE),
                                 checkboxInput("checkbox_mol_func_plot", label = "Molecular Function Plot", value = FALSE),
                                 checkboxInput("checkbox_mol_func_table", label = "Molecular Function Table", value = FALSE),
                                 checkboxInput("checkbox_cell_comp_plot", label = "Cellular Component Plot", value = FALSE),
                                 checkboxInput("checkbox_cell_comp_table", label = "Cellular Component Plot", value = FALSE),
                                 actionButton("add_gene_onto","Add to report"),
                               ),
                               mainPanel(
                                 h3("Gene ontology"),
                                 tabsetPanel(
                                   type = "tabs", id = "uniprot_tabs",
                                   tabPanel("Biological process",
                                            uiOutput("help_text_bio_pr"),
                                            conditionalPanel(
                                              condition = "$('html').hasClass('shiny-busy')",
                                              div(img(src = "load.gif", width = 240, height = 180),
                                                  h4("Processing ... Please wait"),
                                                  style = "text-align: center;"
                                              )
                                            ),
                                            conditionalPanel(
                                              condition = "!$('html').hasClass('shiny-busy')",
                                              plotOutput("uniprotbioplot"),
                                              shiny::dataTableOutput("uniprot_biotable")),
                                   ),
                                   tabPanel("Molecular function",
                                            conditionalPanel(
                                              condition = "$('html').hasClass('shiny-busy')",
                                              div(img(src = "load.gif", width = 240, height = 180),
                                                  h4("Processing ... Please wait"),
                                                  style = "text-align: center;"
                                              )
                                            ),
                                            conditionalPanel(
                                              condition = "!$('html').hasClass('shiny-busy')",
                                              plotOutput("uniprot_molcplot"),
                                              shiny::dataTableOutput("uniprot_molctable")
                                            ),
                                   ),
                                   tabPanel("Cellular component",
                                            conditionalPanel(
                                              condition = "$('html').hasClass('shiny-busy')",
                                              div(img(src = "load.gif", width = 240, height = 180),
                                                  h4("Processing ... Please wait"),
                                                  style = "text-align: center;"
                                              )
                                            ),
                                            conditionalPanel(
                                              condition = "!$('html').hasClass('shiny-busy')",
                                              plotOutput("uniprot_celplot"),
                                              shiny::dataTableOutput("uniprot_celtable")
                                            ),
                                   )
                                 )
                               ))
                             ),
###NAVBAR 4: PATHWAYS ENRICHMENT
                            navbarMenu(
                             "Protein Set Analysis",
                             tabPanel(
                               "Pathways Enrichment",
                               tags$head(tags$style("#path_enri_visu{height:95vh !important;}")),
                               sidebarLayout(
                                 sidebarPanel(
                                   withTags({
                                     div(class = "header",
                                         p("Example ", a("here", href = "https://github.com/buithuytien/GeneCloudOmics/blob/online-version/Test%20data/gPro_gene_names.csv", target="_blank")),
                                     )
                                   }),
                                   fileInput("file_path_enri_prot", "Upload genes CSV file"),
                                   textInput("text_path_enri_prot", "Enter gene id"),
                                   actionButton("submit_path_enri_prot", "Submit"),br(),br(),
                                   selectInput("loadStyleFile_path_prot", "Select Style: ", choices=styles),
                                   # selectInput(inputId = "overlap_min", label = "Minimum Overlap", choices = ""),
                                   hidden(sliderInput("overlap_min_prot", "Minimum Overlap",
                                                      min = 0, max = 100,
                                                      value = 15)),
                                   hidden(selectInput("doLayout_path_prot", "Select Layout:",
                                                      choices=c("",
                                                                "cose",
                                                                "cola",
                                                                "circle",
                                                                "concentric",
                                                                "breadthfirst",
                                                                "grid",
                                                                "random",
                                                                "dagre",
                                                                "cose-bilkent"))),
                                   hidden(actionButton("sfn_path_prot", "Select First Neighbor")),
                                   br(),br(),
                                   
                                   #             actionButton("fit_path_prot", "Fit Graph"),br(),br(),
                                   #             actionButton("fitSelected_path_prot", "Fit Selected"),br(),br(),
                                   #             actionButton("clearSelection_path_prot", "Clear Selection"), br(),br(),
                                   #             actionButton("removeGraphButton_path_prot", "Remove Graph"), br(),br(),
                                   #             actionButton("addRandomGraphFromDataFramesButton_path_prot", "Add Random Graph"),br(),br(),
                                   #             actionButton("getSelectedNodes_path_prot", "Get Selected Nodes"), br(),br(),
                                   #             htmlOutput("selectedNodesDisplay_path_prot"),
                                   #             checkboxInput("checkbox_plot_prot", label = "Plot", value = FALSE),
                                   #             checkboxInput("checkbox_visualization_prot", label = "Visualizationt", value = FALSE),
                                   #             actionButton("add_prot_path_enrich","Add to report"),
                                   
                                   hidden(actionButton("fit_path_prot", "Fit Graph")),br(),br(),
                                   hidden(actionButton("fitSelected_path_prot", "Fit Selected")),br(),br(),
                                   hidden(actionButton("clearSelection_path_prot", "Clear Selection")), br(),br(),
                                   hidden(actionButton("removeGraphButton_path_prot", "Remove Graph")), br(),br(),
                                   hidden(actionButton("addRandomGraphFromDataFramesButton_path_prot", "Add Random Graph")),br(),br(),
                                   hidden(actionButton("getSelectedNodes_path_prot", "Get Selected Nodes")), br(),br(),
                                   hidden(htmlOutput("selectedNodesDisplay_path_prot")),
                                   width=2
                                   
                                 ),
                                 mainPanel(
                                   h3("Pathways Enrichment"),
                                   tabsetPanel(
                                     type = "tabs", id = "path_enri_tab_prot",
                                     tabPanel("Plot",
                                              uiOutput("help_text_path_enri_prot"),
                                              conditionalPanel(
                                                condition = "$('html').hasClass('shiny-busy')",
                                                div(img(src = "load.gif", width = 240, height = 180),
                                                    h4("Processing ... Please wait"),
                                                    style = "text-align: center;"
                                                )
                                              ),
                                              conditionalPanel(
                                                condition = "!$('html').hasClass('shiny-busy')",
                                                plotlyOutput("path_enri.plot_prot")
                                              ), 
                                     ),
                                     tabPanel(
                                       "Visualization",
                                       conditionalPanel(
                                         condition = "$('html').hasClass('shiny-busy')",
                                         div(img(src = "load.gif", width = 240, height = 180),
                                             h4("Processing ... Please wait"),
                                             style = "text-align: center;"
                                         )
                                       ),
                                       conditionalPanel(
                                         condition = "!$('html').hasClass('shiny-busy')",
                                         cyjShinyOutput('path_enri_visu_prot', height=350)
                                       ),
                                     )
                                   )
                                 )
                               )) #Pathway enrichemnt analysis 
                             
                            ), ####Nav bar closing 
tabPanel('Generate Report',fluidPage(
  
  uiOutput("error_text_report"),
  tags$div( h2("GeneCloudOmics Report",align = "center"), id = 'placeholder'),
  capture_pdf(
    selector = "#placeholder",
    filename = "results",
    icon("camera"), "Download as PDF"
  )
))


                             
 #########################################################################################
              ) ## THIS IS THE END OF NAVBARPAGE BRACKET
              ) ## END BRACKET WHOLE THING IN UI

   # Define server function  
   server <- function(input, output, session) {
     # <<<<<<< develop
     
     value_var<- reactiveValues()
     value_var$geo_file_type<-"none"
     
     
     # >>>>>>> master
     gene_mania_link <- reactiveVal("https://genemania.org")
     count_fasta <- reactiveVal(0)
     count_id <- reactiveVal(0)
     ####################download report#############
     output$error_text_report <- renderUI({
       HTML("
    <br>
    <br>
      <center>
        <p>
          <b>
          You have not added anything to the report. Please perform the analysis first.
          </b>
        </p>
      </center>
    ")
     })
     
     #######################################################
     toggle.genes =    observe({
       type <- input$file_type
       if (type == "norm") {
         raw_DS <- df_norm()
         
         
       } else if (type == "raw") {
         raw_DS <- df_raw_filt()
         lengths <- gene_length()
         lengths_df <- gene_length()
         merge_DS <- merge(raw_DS, lengths_df, by = "row.names")
         rownames(merge_DS) <- merge_DS[, 1]
         merge_DS <- merge_DS[, -1]
         raw_DS <- merge_DS[, -ncol(merge_DS)]
         lengths <- merge_DS[, ncol(merge_DS)]
       }
       
        observeEvent(input$submit_input.1, { tog.start <- Sys.time()
       if(type == "norm"){
         S1 <- raw_DS[,input$rep1.toggle]
         S2 <- raw_DS[,input$rep2.toggle]
         df = data.frame(genes = rownames(raw_DS),
                         sample.1 = as.numeric(S1),
                         sample.2 = as.numeric(S2))
         df = df[(rowSums(df>0)==2),]
         output$toggle.genes.df <- renderDataTable(df) 
       } else if (type == "raw"){
         tpm.df = df_raw_shiny()
         
         S1 <- tpm.df[,input$rep1.toggle]
         S2 <- tpm.df[,input$rep2.toggle]
         df = data.frame(genes = rownames(tpm.df),
                         sample.1 = as.numeric(S1),
                         sample.2 = as.numeric(S2)) 
         df = df[(rowSums(df>0)==2),]
         output$toggle.genes.df <- renderDataTable(df)
         
       }
       })
     })
     
     #################################################

     output$download_tog_data <- downloadHandler(
       filename = function() { 
         "toggle.csv"
       },
       content = function(file) {
         type <- input$file_type
         if (type == "norm") {
           raw_DS <- df_norm()
           S1 <- raw_DS[,input$rep1.toggle]
           S2 <- raw_DS[,input$rep2.toggle]
           df = data.frame(genes = rownames(raw_DS),
                           sample.1 = as.numeric(S1),
                           sample.2 = as.numeric(S2))
           df = df[(rowSums(df>0)==2),]
           
         } else if (type == "raw") {
           raw_DS <- df_raw_filt()
           lengths <- gene_length()
           lengths_df <- gene_length()
           merge_DS <- merge(raw_DS, lengths_df, by = "row.names")
           rownames(merge_DS) <- merge_DS[, 1]
           merge_DS <- merge_DS[, -1]
           raw_DS <- merge_DS[, -ncol(merge_DS)]
           lengths <- merge_DS[, ncol(merge_DS)]
           tpm.df = df_raw_shiny()
           
           S1 <- tpm.df[,input$rep1.toggle]
           S2 <- tpm.df[,input$rep2.toggle]
           df = data.frame(genes = rownames(tpm.df),
                           sample.1 = as.numeric(S1),
                           sample.2 = as.numeric(S2)) 
           df = df[(rowSums(df>0)==2),]
           
         }
      
         write.csv( df, file, row.names = F)
       }
     )
   
     
     ###############################################
     
     
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     observeEvent(input$add_scatter, {
       hide("error_text_report")
       insertUI(
         selector = '#placeholder',
         ui = tagList(
           
           fluidRow(
             column(width=2),
             column(width= 8,h3("Scatter Plot",align = "center"), plotOutput("scatter", height = 500),br(),br()))
         ),
       )
       output$scatter <- renderPlot({
         scatterplot()
       })
     })
     observeEvent(input$add_distfit,{
       hide("error_text_report")
       if(input$checkbox_distfit == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Distribution Fit",align = "center"), plotOutput("dis_fit", height = 500),br(),br()))
           )
         )
         output$dis_fit <- renderPlot({
           distplot()
         })
         
       }
       if(input$checkbox_aic == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("AIC Table",align = "center"), div(tableOutput("dist_aic"), style = "font-size:80%"),br(),br()))
           )
         )
         output$dist_aic <- renderTable({
           distaic()
         })
         
       }
       
     })
     observeEvent(input$add_correlation, {
       hide("error_text_report")
       if(input$checkbox_corrheatmap == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Correlation Heatmap",align = "center"), plotOutput("corr_hm", height = 500),br(),br()))
           )
         )
         output$corr_hm <- renderPlot({
           corrplot1()
         })
         
       }
       if(input$checkbox_corrplot == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Correlation Plot",align = "center"), plotlyOutput("corr_m", height = 500),br(),br()))
           )
         )
         output$corr_m <- renderPlot({
           corrplot2()
         })
         
         
       }
       if(input$checkbox_corrmat == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Correlation Matrix",align = "center"), div(tableOutput("corr_mat"), style = "font-size:80%"),br(),br()))
           )
         )
         output$corr_mat <- renderTable({
           cor_df()
         })
         
       }
     })
     observeEvent(input$add_pca, {
       hide("error_text_report")
       if(input$checkbox_pcavar == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             fluidRow(
               column(width=2),
               column(width= 8,h3("PCA Variance",align = "center"), plotlyOutput("pca_var", height = 500),br(),br()))
           )
         )
         output$pca_var <- renderPlotly({
           pcavarplot()
         })
         
       }
       if(input$checkbox_pca2d == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("PCA 2D Plot",align = "center"), plotlyOutput("pca_2d", height = 500),br(),br()))
           )
         )
         output$pca_2d <- renderPlotly({
           pca2dplot()
         })
         
         
       }
       if(input$checkbox_pca3d == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             h3("PCA 3D Plot"),
             fluidRow(plotlyOutput("pca_3d"),br(),br())
           )
         )
         output$pca_3d <- renderPlotly({
           pca3dplot()
         })
         
         
       }
     })
     observeEvent(input$add_de_analysis, {
       hide("error_text_report")
       if(input$checkbox_volcano == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Volcano Plot",align = "center"), plotOutput("vol_plot", height = 500),br(),br()))
           )
         )
         output$vol_plot <- renderPlot({
           volcano_plot()
         })
         
       }
       if(input$checkbox_dispersion == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Dispersion Plot",align = "center"), plotlyOutput("dis_plot", height = 500),br(),br()))
           )
         )
         output$dis_plot <- renderPlot({
           dispersion_plot()
         })
         
         
       }
       if(input$checkbox_corrmat == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("DE genes",align = "center"), div(DT::dataTableOutput("DE_gene"), style = "font-size:80%"),br(),br()))
           )
         )
         output$DE_gene <- DT::renderDataTable({
           res.df <- de_no_filt()
           p_val <- input$p_val
           fc <- input$fc
           rep_number <- input$n_rep
           if (input$submit_DE > 0) {
             res.df.filt <- de_filt(res.df, p_val, fc, rep_number)
             res.df.filt
           }
         })
         
       }
     })
     observeEvent(input$add_heatmap,{
       hide("error_text_report")
       if(input$checkbox_heatmap == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Heatmap",align = "center"), plotOutput("heat_plot", height = 500),br(),br()))
           )
         )
         output$heat_plot <- renderPlot({
           mapplot()
         })
         
       }
       if(input$checkbox_gene_cluster == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Gene Clusters",align = "center"), div(dataTableOutput("cluster_gene"), style = "font-size:80%"),br(),br()))
           )
         )
         output$cluster_gene <- DT::renderDataTable({
           clusternum <- input$display_cluster
           gl <- plotHeatmap()[[3]] # getCluster()
           if (!is.null(gl)) {
             if (clusternum == "ALL") {
               gl
             } else {
               clusternum <- as.numeric(clusternum)
               dplyr::filter(gl, cluster == clusternum)
             }
           }
           
         })
       }
     })
     observeEvent(input$add_noise, {
       hide("error_text_report")
       insertUI(
         selector = '#placeholder',
         ui = tagList(
           
           fluidRow(
             column(width=2),
             column(width= 8,h3("Noise",align = "center"), plotlyOutput("noise_p", height = 500),br(),br()))
         )
       )
       output$noise_p <- renderPlotly({
         noisePlot()
       })
     })
     observeEvent(input$add_entropy, {
       hide("error_text_report")
       insertUI(
         selector = '#placeholder',
         ui = tagList(
           
           fluidRow(
             column(width=2),
             column(width= 8,h3("Shannon Entropy",align = "center"), plotlyOutput("entropy_plot", height = 500),br(),br()))
         )
       )
       output$entropy_plot <- renderPlotly({
         entropyPlot()
       })
     })
     observeEvent(input$add_tsne,{
       hide("error_text_report")
       if(input$checkbox_tsne_plot == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("t-SNE Plot",align = "center"), plotlyOutput("tsne_p", height = 500),br(),br()))
           )
         )
         output$tsne_p <- renderPlotly({
           li <- tsne2plot()
           p <- li[[1]]
           tsne_table <- li[[2]]
           p
         })
         
       }
       if(input$checkbox_tsne_table == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("t-SNE Table",align = "center"), div(tableOutput("tsne_data"), style = "font-size:80%"),br(),br()))
           )
         )
         output$tsne_data <- renderTable({
           tsne_table <- tsne2plot()[[2]] # get table
           
           tsne_table
         })
         
       }
       
     })
     observeEvent(input$add_rf, {
       hide("error_text_report")
       if(input$checkbox_rf_plot == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("RF Plot",align = "center"), plotlyOutput("rf", height = 500),br(),br()))
           )
         )
         output$rf <- renderPlotly({
           rfplot()
         })
         
       }
       if(input$checkbox_rafsil_plot == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("RAFSIL Plot",align = "center"), plotlyOutput("raf_sil", height = 500),br(),br()))
           )
         )
         output$raf_sil <- renderPlotly({
           rafsilplot()
         })
         
         
       }
       if(input$checkbox_rf_matrix == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("RF Matrix",align = "center"), div(tableOutput("rf_mat"), style = "font-size:80%"),br(),br()))
           )
         )
         output$rf_mat <- renderTable({
           rf_matrix()
         })
         
       }
     })
     observeEvent(input$add_som, {
       hide("error_text_report")
       if(input$checkbox_property == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("SOM Analysis - ( Property Plot )",align = "center"), plotOutput("som_prop", height = 500),br(),br()))
           )
         )
         output$som_prop <- renderPlot({
           sompropertyplot()
         })
         
       }
       if(input$checkbox_count == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("SOM Analysis - ( Count Plot )",align = "center"), plotOutput("som_co", height = 500),br(),br()))
           )
         )
         output$som_co <- renderPlot({
           somcountplot()
         })
         
       }
       if(input$checkbox_codes == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("SOM Analysis - ( Codes Plot )",align = "center"), plotOutput("som_cod", height = 500),br(),br()))
           )
         )
         output$som_cod <- renderPlot({
           somcodesplot()
         })
         
       }
       if(input$checkbox_distance == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("SOM Analysis - ( Distance Plot )",align = "center"), plotOutput("som_dis", height = 500),br(),br()))
           )
         )
         output$som_dis <- renderPlot({
           somdistplot()
         })
         
       }
       if(input$checkbox_cluster == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("SOM Analysis - ( Cluster Plot )",align = "center"), plotOutput("som_clus", height = 500),br(),br()))
           )
         )
         output$som_clus <- renderPlot({
           somclusterplot()
         })
         
       }
       
     })
     observeEvent(input$add_gene_path_enrich,{
       hide("error_text_report")
       if(input$checkbox_plot == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Pathways Enrichment (Plot)",align = "center"), plotlyOutput("path_enr_plot_gene", height=500),br(),br()))
           )
         )
         output$path_enr_plot_gene <- renderPlotly({
           df_path_enri_id_gene()
           gene_name <- as.data.frame(df_path_enri_id_gene())
           gene_name[,1] <- as.character(gene_name[,1])
           
           ggplotly(Pathway.Enr(gene_name[,1]), tooltip = c("text"))
         })
         
       }
       if(input$checkbox_visualization == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Pathways Enrichment (Visualization)",align = "center"), cyjShinyOutput('path_enri_vis', height=350),br(),br()))
           )
         )
         output$path_enri_vis <- renderCyjShiny({
           
           print("visualization")
           df_path_enri_id_gene()
           Enrich <- gost(df_path_enri_id_gene(),evcodes = T, sources = c('KEGG', 'REAC'))
           Pathway <- Construct.COPathway(Enrich, input$overlap_min_gene)
           nodes_tot <- c(unique(Pathway[,1],unique(Pathway[,2])))
           
           
           path_enri.nodes <- data.frame(id=nodes_tot,
                                         type=nodes_tot,
                                         stringsAsFactors=FALSE)
           
           path_enri.edges <- data.frame(source=Pathway[,1],
                                         target=Pathway[,2],
                                         interaction=Pathway[,1],
                                         stringsAsFactors=FALSE)
           
           graph.json <- dataFramesToJSON(path_enri.edges, path_enri.nodes)
           cyjShiny(graph=graph.json, layoutName="cola", styleFile = "./www/style/basicStyle.js")
           
         })
         
         
       }
       
     })
     observeEvent(input$add_tissue_exp, {
       hide("error_text_report")
       insertUI(
         selector = '#placeholder',
         ui = tagList(
           
           fluidRow(
             column(width=2),
             column(width= 8,h3("Scatter Plot",align = "center"),div(tableOutput("tissue_expr_table"), style = "font-size:80%"),br(),br()))
         )
       )
       output$tissue_expr_table <- renderTable({
         df_expr_table()
       })
     })
     observeEvent(input$add_gene_onto, {
       hide("error_text_report")
       if(input$checkbox_bio_proc_plot == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Gene Ontlogy (Biological Process Plot)",align = "center"), plotOutput("gene_bio_proc", height = 500),br(),br()))
           )
         )
         output$gene_bio_proc <- renderPlot({
           GO_df <- plotUniprot()
           PlotGOBiological(GO_df,20)
         })
         
       }
       if(input$checkbox_bio_proc_table == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Gene Ontology (Biological Process Table)",align = "center"), div(tableOutput("bio_proc_table"), style = "font-size:80%"),br(),br()))
           )
         )
         output$bio_proc_table <- renderTable({
           GO_df <- plotUniprot()
           BiologicalDF <- Goparse(GO_df, 3)
           BiologicalDF <- na.omit(BiologicalDF)
           download_bio_table <- BiologicalDF
           BiologicalDF
         })
         
       }
       if(input$checkbox_mol_func_plot == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Gene Ontlogy (Molecular Function Plot)",align = "center"), plotOutput("gene_mol_fun", height = 500),br(),br()))
           )
         )
         output$gene_mol_fun <- renderPlot({
           GO_df <- plotUniprot()
           Plot.GOMolecular(GO_df,20)
         })
         
       }
       if(input$checkbox_mol_func_table == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Gene Ontology (Molecular Function Table)",align = "center"), div(tableOutput("mol_func_table"), style = "font-size:80%"),br(),br()))
           )
         )
         output$mol_func_table <- renderTable({
           GO_df <- plotUniprot()
           MolecularDF <- Goparse(GO_df, 4)
           MolecularDF <- na.omit(MolecularDF)
           download_mol_table <- MolecularDF
           MolecularDF
         })
         
       }
       if(input$checkbox_cell_comp_plot == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Gene Ontlogy (Cellular Component Plot)",align = "center"), plotOutput("gene_cell_comp", height = 500),br(),br()))
           )
         )
         output$gene_cell_comp <- renderPlot({
           GO_df <- plotUniprot()
           Plot.GOSubCellular(GO_df,20)
         })
         
       }
       if(input$checkbox_cell_comp_table == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h4("Gene Ontology (Cellular Component Table)",align = "center"), div(tableOutput("cell_comp_table"), style = "font-size:80%")))
           )
         )
         output$cell_comp_table <- renderTable({
           GO_df <- plotUniprot()
           CellularDF <- Goparse(GO_df, 5)
           CellularDF <- na.omit(CellularDF)
           download_cel_table <- CellularDF
           CellularDF
         })
         
       }
     })
     observeEvent(input$add_pp_inter,{
       hide("error_text_report")
       if(input$checkbox_pp_visu == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein-Protein Interactions (Visualization)",align = "center"), cyjShinyOutput("pp_visu", height=350),br(),br()))
           )
         )
         output$pp_visu <- renderCyjShiny({
           
           print(" renderCyjShiny invoked")
           print("graph.json:")
           
           
           print("running...")
           
           
           # tryCatch({
           
           Accessions <- df_prot_int_id()
           print("Please Wait... Fetching interaction data. It may take a while")
           protein_interaction_df <- getInteraction(Accessions)
           df_interaction(protein_interaction_df)
           print("Fetched...")
           
           #migrating rowId to first colunm 
           # protein_interaction_df <- cbind(ID = rownames(protein_interaction_df),protein_interaction_df)
           # rownames(protein_interaction_df) <- 1:nrow(protein_interaction_df)
           
           #making nodes
           nodes <- as.character(protein_interaction_df[,1])
           for (i in 1:nrow(protein_interaction_df))
           {
             if(!(is.na(protein_interaction_df[i,2])))
             {
               data_df <- strsplit(as.character(protein_interaction_df[i,2]),"; ")
               for(j in data_df)
               {
                 nodes <- c(nodes,j)
               }
             }
           }
           
           print(nodes)
           
           print("Please Wait... Fetching Gene Names. It may take a while")
           protein_gene_name <- getGeneNames(nodes)
           df_names(protein_gene_name)
           print("........................")
           print(as.character(protein_gene_name[,1]))
           print("Fetched...")
           edge_source <- character()
           edge_target <- character()
           
           for (i in 1:nrow(protein_interaction_df))
           {
             if(!(is.na(protein_interaction_df[i,2])))
             {
               data_df <- strsplit(as.character(protein_interaction_df[i,2]),"; ")
               for(j in data_df)
               {
                 edge_source <- c(edge_source,rep(as.character(protein_gene_name[as.character(protein_interaction_df[i,1]),1]),length(j)))
                 print(as.character(protein_gene_name[j,1]))
                 edge_target <- c(edge_target,as.character(protein_gene_name[j,1]))
               }
             }
           }
           
           tbl.nodes <- data.frame(id=as.character(protein_gene_name[,1]),
                                   type=as.character(protein_gene_name[,1]),
                                   stringsAsFactors=FALSE)
           
           
           tbl.edges <- data.frame(source=edge_source,
                                   target=edge_target,
                                   interaction=edge_target,
                                   stringsAsFactors=FALSE)
           
           # }, error = function(error_condition) {
           #   print("using defauslt value")
           # })
           
           graph.json <- dataFramesToJSON(tbl.edges, tbl.nodes)
           
           print(fromJSON(graph.json))
           cyjShiny(graph=graph.json, layoutName="cola", styleFile = "./www/style/basicStyle.js")
           
           
         })
         
         
       }
       if(input$checkbox_pp_interact == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein-Protein Interactions(Protein Interactions) ",align = "center"), div(tableOutput("pp_inter_table"), style = "font-size:80%"),br(),br()))
           )
         )
         output$pp_inter_table <- renderTable({
           protein_interaction_df <- df_interaction()
           protein_gene_name <- df_names()
           print(protein_interaction_df)
           print("here")
           print(class(protein_interaction_df))
           if(df_names() == 0)
           {
             
             p_int_formatted <- data.frame()
             
           } else {
             
             protein_interaction_df[,1] <- as.character(protein_interaction_df[,1])
             
             p_int_formatted <- data.frame()
             count = 0
             n = 1
             for ( id in protein_interaction_df[,1])
             {
               count = count + 1
               if(!is.null(protein_interaction_df[,2]))
               {
                 a = strsplit(as.character(protein_interaction_df[,2]),"; ")
                 
                 for(int_with in a[[count]])
                 {
                   p_int_row <- data.frame(id = as.character(paste0(as.character(lookup(id, as.data.frame(id_to_name), missing="Not found"))," ( ", id," )")),
                                           Interacts_With = as.character(paste0(as.character(lookup(int_with, as.data.frame(id_to_name), missing="Not found"))," ( ", int_with," )")),
                                           row.names = n)
                   p_int_formatted <- rbind(p_int_formatted,p_int_row)
                   n = n + 1
                 }
               }
             }
             
             # for(i in 1:nrow(protein_interaction_df))
             # {
             #     protein_interaction_df[i,1] <- paste0(protein_interaction_df[i,1],
             #                               ' (',
             #                               protein_gene_name[protein_interaction_df[i,1],1],
             #                               ')')
             # }
             # print(protein_interaction_df)
             # colnames(protein_interaction_df)[2] <- "Interacts With"
             
           }
           
           p_int_formatted
         })
         
       }
       if(input$checkbox_prot_name == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein-Protein Interactions(Protein Names)",align = "center"), div(tableOutput("pp_name_table"), style = "font-size:80%"),br(),br()))
           )
         )
         output$pp_name_table <- renderTable({
           protein_gene_name <- df_names()
           if(protein_gene_name == 0)
           {
             protein_gene_name <- data.frame()
           } else {
             
             protein_gene_name <- cbind(ID = rownames(protein_gene_name),protein_gene_name)
             rownames(protein_gene_name) <- 1:nrow(protein_gene_name)
             colnames(protein_gene_name)[2] <- "Names"
             
           } 
           protein_gene_name
         })
         
       }
       
     })
     observeEvent(input$add_prot_func, {
       hide("error_text_report")
       insertUI(
         selector = '#placeholder',
         ui = tagList(
           
           fluidRow(
             column(width=2),
             column(width= 8,h3("Protein Function",align = "center"),div(tableOutput("prot_func_table"), style = "font-size:80%"),br(),br()))
         )
       )
       output$prot_func_table <- renderTable({
         df_func_table()
       })
     })
     observeEvent(input$add_subcell_loc, {
       hide("error_text_report")
       insertUI(
         selector = '#placeholder',
         ui = tagList(
           
           fluidRow(
             column(width=2),
             column(width= 8,h3("SubCellular Localization",align = "center"),div(tableOutput("sub_cell_table"), style = "font-size:80%"),br(),br()))
         )
       )
       output$sub_cell_table <- renderTable({
         df_local_table()
       })
     })
     observeEvent(input$add_prot_dom, {
       hide("error_text_report")
       insertUI(
         selector = '#placeholder',
         ui = tagList(
           
           fluidRow(
             column(width=2),
             column(width= 8,h3("Protein Domain",align = "center"),div(tableOutput("prot_dom_table"), style = "font-size:80%"),br(),br()))
         )
       )
       output$prot_dom_table <- renderTable({
         df_domain_table()
       })
     })
     observeEvent(input$add_prot_seq, {
       hide("error_text_report")
       if(input$checkbox_seq_charge == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein Sequences (Sequence Charge)",align = "center"), plotOutput("plot_seq_char", height = 500),br(),br()))
           )
         )
         output$plot_seq_char <- renderPlot({
           if (!is.null(df_prot_seq()))
           {
             hide("help_text_prot_seq")
             if(is.null(Seqdata))
             {
               Proteins <- df_prot_seq()
               Seqdata <<- GetSequences(Proteins)
             }
             PlotCharge(Seqdata)
           }
         })
         
       }
       if(input$checkbox_seq_acid == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein Sequences (Sequence Acidity)",align = "center"), plotOutput("plot_seq_acid", height = 500),br(),br()))
           )
         )
         output$plot_seq_acid <- renderPlot({
           if (!is.null(df_prot_seq()))
           {
             hide("help_text_prot_seq")
             if(is.null(Seqdata))
             {
               Proteins <- df_prot_seq()
               Seqdata <<- GetSequences(Proteins)
             }
             PlotAcidity(Seqdata)
           }
         })
         
       }
       if(input$checkbox_seq_grav_ind == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein Sequences (Sequence Gravy Index)",align = "center"), plotOutput("plot_seq_grav", height = 500),br(),br()))
           )
         )
         output$plot_seq_grav <- renderPlot({
           if (!is.null(df_prot_seq()))
           {
             hide("help_text_prot_seq")
             if(is.null(Seqdata))
             {
               Proteins <- df_prot_seq()
               Seqdata <<- GetSequences(Proteins)
             }
             PlotGravy(Seqdata)
           }
         })
         
       }
       if(input$checkbox_physio_prop == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein Sequences (All Physiochemical Properties)",align = "center"), plotOutput("plot_physio_prop", height = 500),br(),br()))
           )
         )
         output$plot_physio_prop <- renderPlot({
           if (!is.null(df_prot_seq()))
           {
             hide("help_text_prot_seq")
             if(is.null(Seqdata))
             {
               Proteins <- df_prot_seq()
               Seqdata <<- GetSequences(Proteins)
             }
             PlotPhysicochemical(Seqdata)
           }
         })
         
       }
     })
     observeEvent(input$add_prot_evol_analysis, {
       hide("error_text_report")
       if(input$checkbox_prot_gene == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein Evolutionary analysis (Protein's Gene Trees)",align = "center"), radialNetworkOutput("prot_gene_plot", width="500px",height="500px"),br(),br()))
           )
         )
         output$prot_gene_plot <- renderRadialNetwork(
           {
             if (!is.null(df_prot_seq_evol()))
             {
               if (is.null(GenesObj))
               {
                 Proteins <- df_prot_seq_evol()
                 GenesObj <- GetNamesTaxa(Proteins)
               }
               ConstructGenes(GenesObj)
             }
           }
         )
         
         
       }
       if(input$checkbox_prot_chrom == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein Evolutionary analysis (Protein's chromosomal location)",align = "center"), plotOutput("plot_prot_chrom", height = 500),br(),br()))
           )
         )
         output$plot_prot_chrom <- renderPlot(
           if (!is.null(df_prot_seq_evol()))
           {
             if(is.null(GenesObj))
             {
               Proteins <- df_prot_seq_evol()
               GenesObj <- GetNamesTaxa(Proteins)
             }
             PlotChromosomeInfo(GenesObj)
           }
         )
         
       }
       if(input$checkbox_prot_evol == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein Evolutionary analysis (Evolutionary analysis)",align = "center"), plotOutput("plot_evol_ana", height = 500),br(),br()))
           )
         )
         output$plot_evol_ana <- renderPlot(
           {
             if(!is.null(df_prot_seq_evol()))
               if(is.null(Seqdata))
               {
                 Proteins <- df_prot_seq_evol()
                 Seqdata <<- GetSequences(Proteins)
               }
             ConstructPhylogeny(Seqdata)
           }
         )
         
         
       }
       
     })
     observeEvent(input$add_prot_path_analysis, {
       hide("error_text_report")
       
       if(input$checkbox_dise_role == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein pathological analysis (Protein's disease role)",align = "center"), div(tableOutput("prot_dis_table"), style = "font-size:80%"),br(),br()))
           )
         )
         output$prot_dis_table <- renderTable({
           if(!is.null(df_prot_seq_Patho()))
           {
             Proteins <- df_prot_seq_Patho()
             Pathodata <- GetPathology_Biotech(Proteins)
             DiseaseTable <- Get.diseases(Pathodata) 
           }
         }, escape = F)
         
       }
       if(input$checkbox_dise_dist == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Protein pathological analysis (Protein's disease distribution)",align = "center"), bubblesOutput("prot_dis_plot"),br(),br()))
           )
         )
         output$prot_dis_plot <- renderBubbles({
           if(!is.null(df_prot_seq_Patho()))
           {
             if(!is.null(DiseaseTable))
             {
               Plot.NDiseases(DiseaseTable)
             }
             else {
               Proteins <- df_prot_seq_Patho()
               Pathodata <- GetPathology_Biotech(Proteins)
               DiseaseTable <- Get.diseases(Pathodata)
               Plot.NDiseases(DiseaseTable)
             }
           }
         })
         
       }
       
     })
     observeEvent(input$add_prot_comp_enrich, {
       hide("error_text_report")
       insertUI(
         selector = '#placeholder',
         ui = tagList(
           
           fluidRow(
             column(width=2),
             column(width= 8,h3("Complex Enrichment",align = "center"),div(tableOutput("comp_enrich_table"), style = "font-size:80%"),br(),br()))
         )
       )
       output$comp_enrich_table <- renderTable({
         df_com_table()
       })
     })
     observeEvent(input$add_prot_path_enrich,{
       hide("error_text_report")
       if(input$checkbox_plot_prot == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Pathways Enrichment (Plot)",align = "center"), plotlyOutput("path_enr_plot_prot", height=500),br(),br()))
           )
         )
         output$path_enr_plot_prot <- renderPlotly({
           df_path_enri_id_prot()
           gene_name <- as.data.frame(df_path_enri_id_prot())
           gene_name[,1] <- as.character(gene_name[,1])
           
           ggplotly(Pathway.Enr(gene_name[,1]), tooltip = c("text"))
         })
         
       }
       if(input$checkbox_visualization_prot == TRUE){
         insertUI(
           selector = '#placeholder',
           ui = tagList(
             
             fluidRow(
               column(width=2),
               column(width= 8,h3("Pathways Enrichment (Visualization)",align = "center"), cyjShinyOutput('path_enri_vis_prot', height=350),br(),br()))
           )
         )
         
         output$path_enri_vis_prot <- renderCyjShiny({
           
           print("visualization")
           df_path_enri_id_prot()
           Enrich <- gost(df_path_enri_id_prot(),evcodes = T, sources = c('KEGG', 'REAC'))
           Pathway <- Construct.COPathway(Enrich, input$overlap_min_prot)
           nodes_tot <- c(unique(Pathway[,1],unique(Pathway[,2])))
           
           
           path_enri.nodes <- data.frame(id=nodes_tot,
                                         type=nodes_tot,
                                         stringsAsFactors=FALSE)
           
           path_enri.edges <- data.frame(source=Pathway[,1],
                                         target=Pathway[,2],
                                         interaction=Pathway[,1],
                                         stringsAsFactors=FALSE)
           
           graph.json <- dataFramesToJSON(path_enri.edges, path_enri.nodes)
           cyjShiny(graph=graph.json, layoutName="cola", styleFile = "./www/style/basicStyle.js")
           
         })
         
       }
       
     })
     ########################################
     ##### Increases the Upload Limit #######
     ########################################
     
     options(shiny.maxRequestSize=250*1024^2)
     
     ########################################
     ##### get variable names for input #####
     ########################################
     
     observe({
       type <- input$file_type
       if (type == "norm") {
         DS <- df_norm()
       } else if (type == "raw") {
         DS <- df_raw()
       }
       
       nms <- colnames(DS)
       updateSelectInput(session, "scatter.x", choices = nms, selected = nms[1])
       updateSelectInput(session, "scatter.y", choices = nms, selected = nms[2])
       updateSelectInput(session, "rep1.toggle", choices = nms, selected = nms[1])
       updateSelectInput(session, "rep2.toggle", choices = nms, selected =nms[2])
       updateSelectInput(session, "dist.var", choices = nms)
       col_num <- ncol(DS)
       updateSliderInput(session, "pca_cluster_num", max = col_num - 1)
       genotype_num <- NULL
       if (is.null(DS) == FALSE) {
         for (i in 2:col_num) {
           if (col_num %% i == 0) {
             genotype_num <- c(genotype_num, i)
           }
         }
       }
       updateSelectInput(session, "numOfGeno", choices = genotype_num)
       updateSelectInput(session, "noise_anchor_c", choices = nms)
       
       ##############################################
       ##############################################
       updateSelectInput(session, "som_samples", choices = c("All", nms), selected = "All")
       updateSelectInput(session, "overlay.x1", choices = nms, selected = nms[1])
       updateSelectInput(session, "overlay.y1", choices = nms, selected = nms[2])
       updateSelectInput(session, "overlay.x2", choices = nms, selected = nms[3])
       updateSelectInput(session, "overlay.y2", choices = nms, selected = nms[4])
       ##############################################
       ##############################################
       
       observeEvent(input$start_rnaseq, {
         updateNavbarPage(session, inputId = "navbar", selected = "active_tab_rnaseq")
       })
       
       observeEvent(input$start_micro, {
         updateNavbarPage(session, inputId = "navbar", selected = "active_tab_micro")
       })
       
       ### preprocessing tab
       f <- group_names()
       f <- unique(as.character(f))
       if (is.null(f)) {
         hideTab(inputId = "preprocessing_tabs", target = "Description table")
         # hideTab(inputId="preprocessing_tabs", target="Description table")
       } else {
         showTab(inputId = "preprocessing_tabs", target = "Description table")
         updateSelectInput(session, "f1", choices = f, selected = f[1])
         updateSelectInput(session, "f2", choices = f, selected = f[2])
       }
       
       ### gene expression range for distribution fit ###
       if (is.null(DS) == FALSE) {
         DS_dist <- distfit_df()
         print(DS_dist)
         range_min <- min(DS_dist)
         range_max <- max(DS_dist)
         updateSliderInput(session, "dist_range", max = round(range_max), value = c(0.1, range_max))
         updateNumericInput(session, "dist_range_min", min = 0.000001, max = round(range_max), value = 0.1)
         updateNumericInput(session, "dist_range_max", min = 0.000001, max = round(range_max), value = round(range_max))
       }
       
       ### gene sample size choices for PCA ###
       # print("line 647 check input$submit_preprocessing")
       # v=input$submit_preprocessing
       if (input$submit_preprocessing > 0) {
         if (type == "norm") {
           DS_filt <- df_shiny()
         } else if (type == "raw") {
           DS_filt <- df_raw_shiny()
         }
       } else {
         DS_filt <- DS
       }
       
       i <- 1
       min_size <- 25
       samplesize <- NULL
       while (i * min_size < length(DS_filt[, 1])) {
         samplesize <- c(samplesize, i * min_size)
         i <- i * 2
       }
       if (is.null(samplesize)) {
         samplesize <- c(samplesize, length(DS_filt[, 1]))
       } else if (samplesize[length(samplesize)] != length(DS_filt[, 1])) {
         samplesize <- c(samplesize, length(DS_filt[, 1]))
       }
       updateSelectInput(session, "gene_size", choices = samplesize, selected = samplesize[length(samplesize)])
       
       ### pca choices for PCA-2D ###
       pcchoices <- NULL
       if (is.null(DS) == FALSE) {
         for (i in 1:ncol(DS)) {
           pcchoices <- c(pcchoices, paste("PC", i, sep = ""))
         }
       }
       updateSelectInput(session, "pca.x", choices = pcchoices, selected = pcchoices[1])
       updateSelectInput(session, "pca.y", choices = pcchoices, selected = pcchoices[2])
       
     })
     
     
     observeEvent(input$submit_input, {
       type <- input$file_type
       if (type == "norm") {
         DS <- df_norm()
         lengths <- 0
       } else if (type == "raw") {
         DS <- df_raw()
         lengths <- gene_length()
         # if( length(intersect(rownames(lengths), rownames(DS))) < 1000 )
         #   length <- NULL
       }
       f <- group_names()
       spikes <- neg_control()
       
       # if any NULL value, throw error. TO CHANGE TO BE MORE SPECIFIC
       input.list <- list(DS, f)
       input.null <- sapply(input.list, is.null)
       names(input.null) <- c("Expression/Counts", "Meta Data")
       
       if (any(input.null)) {
         index.null <- which(input.null)
         errors <- paste(names(input.null)[index.null], collapse = ", ")
         # print(errors)
         showModal(modalDialog(
           type = "Error",
           paste("Please check these input:", errors, "and try again!")
         ))
       } else {
         updateTabsetPanel(session, inputId = "Rnaseq_pre", selected = "Preprocessing")
       }
       
       # update input
       updateNumericInput(session, "min_col", max = ncol(DS)) # update max column nunmber in filtering
       if (is.null(spikes)) {
         updateRadioButtons(session, "norm_method", choices = c(
           "None (Black)" = "None",
           "TPM (Dark green)" = "TPM",
           "Upper Quartile (Brown)" = "RUV"
         ))
         # c("None",'RPKM','FPKM','TPM',"Upper Quartile"="RUV")
       } else {
         updateRadioButtons(session, "norm_method", choices = c(
           "None (Black)" = "None",
           "TPM (Dark green)" = "TPM",
           "RUV (Brown)" = "RUV"
         ))
       }
       if (is.null(lengths) & !(is.null(spikes))) {
         updateRadioButtons(session, "norm_method", choices = c("None (Black)" = "None", "RUV (Brown)" = "RUV"))
       } else if (is.null(lengths) & (is.null(spikes))) {
         updateRadioButtons(session, "norm_method", choices = c("None (Black)" = "None", "Upper Quartile (Brown)" = "RUV"))
       }
       
       if (is.null(f)) {
         hideTab(inputId = "navbar", target = "DE Analysis")
       } else {
         showTab(inputId = "navbar", target = "DE Analysis")
       }
       # if(is.null(f)){
       #   hideTab(inputId="preprocessing_tabs", target="Description table")
       # } else {
       #   showTab(inputId="preprocessing_tabs", target="Description table")
       # }
       
       hide("help_text_scatter")
       hide("help_text_dis_fit")
       hide("help_text_correlation")
       hide("help_text_PCA")
       hide("help_text_DE_anal")
       hide("help_text_heatmap")
       hide("help_text_Noise")
       hide("help_text_Entropy")
       # hide("help_text_SVM")
       hide("help_text_tsne")
       hide("help_text_rf")
       hide("help_text_SOM")
       
     })
     
     
     ############################ Micro array ###############################
     
     
     output$downloadMicroRaw <- downloadHandler(
       filename = function() {
         paste("Microarray_Raw", ".csv", sep = "")
       },
       content = function(file) {
         raw_data <- df_micro()
         
         micro_raw_data <- as.data.frame(raw_data@assayData[["exprs"]][1:2000,])
         micro_raw_data <- tibble::rowid_to_column(micro_raw_data, "Geneid")
         
         n <- ncol(micro_raw_data)
         for(i in 2:n)
         {
           colnames(micro_raw_data)[i] <- paste0('new_',colnames(micro_raw_data)[i])
         }
         
         write.csv(micro_raw_data, file, row.names = FALSE)
       }
     )
     
     output$downloadMicroMeta <- downloadHandler(
       filename = function() {
         paste("Microarray_Meta", ".csv", sep = "")
       },
       content = function(file) {
         raw_data <- df_micro()
         
         micro_raw_data <- as.data.frame(raw_data@assayData[["exprs"]][1:2000,])
         micro_meta_data <- as.data.frame(raw_data@phenoData@data[["Factor.Value.disease."]])
         micro_meta_data <- add_column(micro_meta_data, as.data.frame(colnames(micro_raw_data)), .after = 0)
         
         names(micro_meta_data)[1] <- "Id"
         names(micro_meta_data)[2] <- "Types"
         
         n <- nrow(micro_meta_data)
         micro_meta_data[,1] <- as.character(micro_meta_data[,1])
         for(i in 1:n)
         {
           micro_meta_data[i,1] <- paste0("new_",micro_meta_data[i,1])
         }
         
         write.csv(micro_meta_data, file, row.names = FALSE)
       }
     )
     
     
     ####################################################################
     
     # observeEvent(input$submit_preprocessing, {
     #   type <- input$file_type
     #   if(type=='norm'){
     #     DS <- df_shiny()
     #   }else if(type=='raw'){
     #     DS <- df_raw_shiny()
     #   }
     #   ### gene sample size choices for PCA ###
     #   i <- 1
     #   min_size <- 25
     #   samplesize <- NULL
     #   while(i*min_size<length(DS[,1])){
     #     samplesize <- c(samplesize,i*min_size)
     #     i <- i*2
     #   }
     #   if(is.null(samplesize)){
     #     samplesize <- c(samplesize,length(DS[,1]))
     #   }else if(samplesize[length(samplesize)]!=length(DS[,1])){
     #     samplesize <- c(samplesize,length(DS[,1]))
     #   }
     #   updateSelectInput(session,"gene_size", choices = samplesize,selected = samplesize[length(samplesize)])
     # })
     
     ######################################
     ######### read in / get data #########
     ######################################
     
     #####################
     ## get data #########
     #####################
     
     # get normalized counts
     df_norm <- reactive({ # get normalized counts
       if (is.null(input$file2)) {
         return(NULL)
       }
       parts <- strsplit(input$file2$datapath, ".", fixed = TRUE)
       type <- parts[[1]][length(parts[[1]])]
       type <- tolower(type)
       if (type != "csv") {
         showModal(modalDialog(
           title = "Error",
           "Please input a csv file!"
         ))
         return(NULL)
       }
       ds <- read.csv(input$file2$datapath)
       ds <- na.omit(ds)
       ds <- ds[!duplicated(ds[, 1]), ] # remove duplicated gene names
       
       row_names <- ds[, 1]
       DS <- data.frame(ds)
       if (ncol(DS) <= 1) {
         showModal(modalDialog(
           title = "Error",
           "Please check normalised data file format (Eg_normalised.png) and try again!"
         ))
         return(NULL)
       }
       DS <- DS[, -1]
       row.names(DS) <- row_names
       for (i in 1:ncol(DS)) {
         if (class(DS[, i]) != "numeric" & class(DS[, i]) != "integer") {
           showModal(modalDialog(
             title = "Error",
             "Please check normalised data file format (Eg_normalised.png) and try again!"
           ))
           return(NULL)
         }
       }
       return(DS)
     })
     
     # get raw counts
     df_raw <- reactive({
       print("in df_raw")
       print(value_var$geo_file_type)
       if (is.null(input$file1) && value_var$geo_file_type != "rnaseq") {
         return(NULL)
       }
       else if (!is.null(input$file1)){
         parts <- strsplit(input$file1$datapath, ".", fixed = TRUE)
         type <- parts[[1]][length(parts[[1]])]
         type <- tolower(type)
         if (type != "csv") {
           showModal(modalDialog(
             title = "Error",
             "Please input a csv file!"
           ))
           return(NULL)
         }
         raw_ds <- read.csv(input$file1$datapath)
         
         
       }
       else if(value_var$geo_file_type == "rnaseq"){
         
         if(file.exists(file.path(getwd(),input$file_name_button))){
           print("Reading geo_file")
           
           raw_ds <- read.table(file.path(getwd(),input$file_name_button) ,header=TRUE, stringsAsFactors = FALSE)
           print(raw_ds)
           #value_var$geo_file_type<-"none"
           
           
         }else{
           return(NULL)
         }
         
         
       } # remove duplicated gene names
       else{
         return(NULL)
       }
       raw_ds <- na.omit(raw_ds)
       raw_ds <- raw_ds[!duplicated(raw_ds[, 1]), ]  
       # raw_ds <- as.data.frame(raw_ds)
       if (ncol(raw_ds) <= 1) {
         showModal(modalDialog(
           title = "Error",
           "Data file must contain at least 2 columns. Please check raw data format and try again!"
         ))
         return(NULL)
       }
       
       row_names <- raw_ds[, 1]
       rownames(raw_ds) <- row_names
       raw_DS <- raw_ds[, -1] # remove the first column, which is gene Id
       for (i in 1:ncol(raw_DS)) {
         
         if (class(raw_DS[, i]) != "numeric" & class(raw_DS[, i]) != "integer") {
           showModal(modalDialog(
             title = "Error",
             "Raw counts must be integer. Please check raw data formate and try again!"
           ))
           return(NULL)
         }
       }
       print(raw_DS)
       return(raw_DS)
     })
     
     ######################## Micro array ##########################
     
     
     df_micro <- reactive({
       print("running")
       print("In Micro array")
       print(value_var$geo_file_type)
       if (is.null(input$file_micro)&& value_var$geo_file_type != "microarray") {
         return(NULL)
       }
       else if(!is.null(input$file_micro)){
         parts <- strsplit(input$file_micro$datapath, ".", fixed = TRUE)
         type <- parts[[1]][length(parts[[1]])]
         
         if (type != "zip") {
           showModal(modalDialog(
             title = "Error",
             "Please input a zip file!"
           ))
           return(NULL)
         }
         
         unzip(input$file_micro$datapath,exdir = parts[[1]][1])
       }else if( value_var$geo_file_type == "microarray"){
         parts <- strsplit(input$file_name_button, ".", fixed = TRUE)
         untar(file.path(getwd(),input$file_name_button),exdir = parts[[1]][1])
         
       }else {
         return(NULL)
       }
       fol_name <- print(list.files(parts[[1]][1]))
       micro_data_dir <- paste0(parts[[1]][1],"/",fol_name)
       print(micro_data_dir)
       
       sdrf_location <- file.path(micro_data_dir, "E-MTAB-2967.sdrf.txt")
       SDRF <- read.delim(sdrf_location)
       
       rownames(SDRF) <- SDRF$Array.Data.File
       SDRF <- AnnotatedDataFrame(SDRF)
       
       raw_data <- oligo::read.celfiles(filenames = file.path(micro_data_dir, 
                                                              SDRF$Array.Data.File),
                                        verbose = FALSE, phenoData = SDRF)
       
       print(raw_data)
       
       return(raw_data)
       
     }) ############################## GEO IMPORT###################
     
     output$help_text_geo <- renderUI({
       HTML("
    <br>
    <br>
      <center>
        <p>
          <b>
          Please enter the GEO accession number to begin analysis.
          </b>
        </p>
      </center>
    ")
     })
     getDirListing <- function(url) {
       # Takes a URL and returns a character vector of filenames
       a <- xml2::read_html(url)
       fnames = grep('^G',xml_text(xml_find_all(a,'//a/@href')),value=TRUE)
       return(fnames)
     }
     
     getFileUrl <- function(GEO,filetype){
       geotype <- toupper(substr(GEO,1,3))
       fileinfo <- list()
       stub = gsub('\\d{1,3}$','nnn',GEO,perl=TRUE)
       if(geotype=='GSM') {
         url <- sprintf("https://ftp.ncbi.nlm.nih.gov/geo/samples/%s/%s/%s/",stub,GEO,filetype)
       }
       if(geotype=='GSE') {
         url <- sprintf("https://ftp.ncbi.nlm.nih.gov/geo/series/%s/%s/%s/",stub,GEO,filetype)
       }
       if(geotype=='GPL') {
         url <- sprintf("https://ftp.ncbi.nlm.nih.gov/geo/platform/%s/%s/%s/",stub,GEO,filetype)
       }
       return(url)
     }
     
     getFiles <- function(url) {
       
       fnames <- try(getDirListing(url),silent=TRUE)
       
       if(inherits(fnames,'try-error')) {
         message('No supplemental files found.')
         message('Check URL manually if in doubt')
         message(url)
         return(NULL)
       }
       return(fnames)
       
       
     }
     
     downloadFile <- function(url,fname){
       storedir <- getwd()
       #suppressWarnings(dir.create(storedir <- file.path(getwd(),GEO)))
       if(!file.exists(file.path(getwd(),input$file_name_button))){
         download.file(paste(file.path(url,fname),'tool=geoquery',sep="?"),
                       destfile=file.path(storedir,fname),
                       mode='wb',
                       method=getOption('download.file.method.GEOquery'))
       }
       #acc_data <- read.table(file.path(storedir,fname))
       #return(acc_data)
       
     }
     
     check_file_type <- function(){
       parts <- strsplit(input$file_name_button, ".", fixed = TRUE)
       type <- parts[[1]][length(parts[[1]])]
       print("before")
       print(value_var$geo_file_type)
       if (type == "gz"){
         
         value_var$geo_file_type<-"rnaseq"
         output$help_text_geo <- renderUI({
           HTML("
    <br>
    <br>
      <center>
        <p>
          <b>
          GEO Data Import Complete. Please go to the preprocessing tab of RnaSeq and proceed with the analysis.
          </b>
        </p>
      </center>
    ")
         })
       }
       else if(type == "tar"){
         file_list <- untar(file.path(getwd(),input$file_name_button),list=TRUE)
         print(file_list[1])
         parts <- strsplit(file_list[1], ".", fixed = TRUE)
         type <- parts[[1]][length(parts[[1]])-1]
         print(type)
         if(type == "cel" || type == "CEL"){
           value_var$geo_file_type<-"microarray"
           output$help_text_geo <- renderUI({
             HTML("
    <br>
    <br>
      <center>
        <p>
          <b>
          Its Microarray file. Please go to the preprocessing tab of Microarray and proceed with the analysis.
          </b>
        </p>
      </center>
    ")
           })
         }
         #df_micro()
       }
       
       
     }
     
     observeEvent(input$submit_geo_acc_no, {
       
       url<-getFileUrl(input$geo_acc_no,"suppl")
       fname <- getFiles(url)
       updateRadioButtons(session, "file_name_button",
                          choices = fname,
                          selected = fname[1]
       )
       
       updateTabsetPanel(session, "geo_tab",
                         selected = "geo_pre")
       
     })
     
     observeEvent(input$submit_geo_preprocessing,{
       value_var$geo_file_type<-"none"
       url<-getFileUrl(input$geo_acc_no,"suppl")
       print(input$file_name_button)
       downloadFile(url,input$file_name_button)
       check_file_type()
       df_geo <- read.table(file.path(getwd(),input$file_name_button) ,header=TRUE, stringsAsFactors = TRUE)
       output$geo_box_plot <- renderPlot({# load series and platform data from GEO
         
         # box-and-whisker plot
         par(mar=c(7,4,2,1))
         title <- paste (input$geo_acc_no, "/",input$file_name_button , sep ="")
         boxplot(df_geo, boxwex=0.7, notch=FALSE, main=title, outline=FALSE, las=2)})
       
       output$geo_expr_plot <- renderPlot({
         
         par(mar=c(4,4,2,1))
         title <- paste (input$geo_acc_no, "/", input$file_name_button, " value distribution", sep ="")
         plotDensities(df_geo, main=title, legend=F)
         
       })
       output$geo_mean_plot <- renderPlot({
         
         # mean-variance trend
         ex <- na.omit(df_geo) # eliminate rows with NAs
         plotSA(lmFit(ex), main="Mean variance trend")
         
       })
       
       output$geo_umap_plot <- renderPlot({
         
         ex <- df_geo[!duplicated(df_geo), ]  # remove duplicates
         ump <- umap(t(ex), n_neighbors = 5, random_state = 123)
         plot(ump$layout, main="UMAP plot, nbrs=5", xlab="", ylab="", pch=20, cex=1.5)
         # point labels without overlaps
         pointLabel(ump$layout, labels = rownames(ump$layout), method="SANN", cex=0.6)
         
       })
     })
     
     
     ###############################################################
     
     # get gene length
     gene_length <- reactive({
       if (is.null(input$length1)&&is.null(input$length2)) {
         return(NULL)
       }
       else if (!is.null(input$length1)){
         lengths_df <- read.csv(input$length1$datapath)
       }else{
         lengths_df <- read.csv(input$length2$datapath)
       }
       lengths_df2 <- data.frame("len" = lengths_df[, 2])
       rownames(lengths_df2) <- as.character(lengths_df[, 1])
       return(lengths_df2)
     })
     
     # get spikes / negative control genes
     neg_control <- reactive({
       if (is.null(input$spikes1)&&is.null(input$spikes2)) {
         return(NULL)
       }else if (!is.null(input$spikes1)){
         spikes <- read.csv(input$spikes1$datapath, header = F)
       }else{
         spikes <- read.csv(input$spikes2$datapath, header = F)
       }
       spikes <- as.character(spikes[, 1])
       # print(spikes[1:10])
       return(spikes)
     })
     
     # get meta data table
     group_names <- reactive({
       # if no data
       if (is.null(input$metafile1)) {
         return(NULL)
       }
       
       # read in group names (metadata)
       groups <- read.csv(input$metafile1$datapath)
       group_colnames <- as.character(groups[, 1])
       
       type <- input$file_type
       if (type == "norm") {
         DS <- df_norm()
       } else if (type == "raw") {
         DS <- df_raw()
       }
       col_names <- colnames(DS) # columm names of DS in order
       
       # check if groups and column names are similar
       if (!all(col_names %in% group_colnames) || ncol(groups) < 2) {
         showNotification(type = "error", "group names and DS column names not similar")
         return(NULL)
       }
       
       if (ncol(groups) == 2) {
         f <- groups[match(col_names, groups[, 1]), ] [, 2] # arrange f in the same order as col_names
       } else {
         f <- groups[match(col_names, groups[, 1]), ] [, 2]
         for (i in 3:ncol(groups)) {
           f <- paste0(f, "_", groups[, i])
         }
       }
       f <- as.factor(make.names(f))
       # return(as.factor(f))
       return(f)
     })
     
     ### Gene ontology
     
     gene_list <- reactive({
       if (is.null(input$filego)) {
         return(NULL)
       }
       parts <- strsplit(input$filego$datapath, ".", fixed = TRUE)
       type <- parts[[1]][length(parts[[1]])]
       type <- tolower(type)
       if (type != "csv") {
         showModal(modalDialog(
           title = "Error",
           "Please input a csv file!"
         ))
         return(NULL)
       }
       ds <- read.csv(input$filego$datapath, header = FALSE)
       if (ncol(ds) >= 2) {
         col1 <- ds[-1, 1]
       } else if (ncol(ds) == 1) {
         col1 <- ds[, 1]
       } else {
         showModal(modalDialog(
           title = "Error",
           "No data found! Please check required data format and try again!"
         ))
         return(NULL)
       }
       gene_list <- as.character(col1)
       print("gene list from gene_list")
       print(head(gene_list))
       return(gene_list)
     })
     
     bg_list <- reactive({
       if (is.null(input$filebg)) {
         return(NULL)
       }
       parts <- strsplit(input$filebg$datapath, ".", fixed = TRUE)
       type <- parts[[1]][length(parts[[1]])]
       type <- tolower(type)
       if (type != "csv") {
         showModal(modalDialog(
           title = "Error",
           "Please input a csv file!"
         ))
         return(NULL)
       }
       ds <- read.csv(input$filebg$datapath, header = FALSE)
       if (ncol(ds) > 1) {
         col1 <- ds[-1, 1]
       } else if (ncol(ds) == 1) {
         col1 <- ds[, 1]
       } else {
         showModal(modalDialog(
           title = "Error",
           "No data found! Please check required data format and try again!"
         ))
         return(NULL)
       }
       bg_list <- as.character(col1)
       return(bg_list)
     })
     ####################################
     ########## PREPROCESSING ###########
     ####################################
     
     # filter normalized counts
     df_shiny <- eventReactive(input$submit_preprocessing, {
       DS_norm <- df_norm()
       min_val <- input$min_val
       min_col <- input$min_col
       keep <- rowSums(DS_norm >= min_val) >= min_col
       DS <- DS_norm[keep, ]
       # DS <- apply(DS_norm, 1, function(x) length(x[x>min_val])>=min_col)
       return(DS)
     })
     
     # filter raw counts
     df_raw_filt <- eventReactive(input$submit_preprocessing, {
       DS_raw <- df_raw()
       min_val <- input$min_val
       min_col <- input$min_col
       keep <- rowSums(DS_raw >= min_val) >= min_col
       DS_filt <- DS_raw[keep, ]
       # DS_filt <- apply(DS_raw, 1, function(x) length(x[x>min_val])>=min_col)
       return(DS_filt)
     })
     
     # normalizing raw counts
     df_raw_shiny <- reactive({
       raw_DS <- df_raw_filt() # get filtered raw counts
       method <- input$norm_method
       
       if (method %in% c("TPM", "RPKM", "FPKM")) {
         if (is.null(input$length1)&&is.null(input$length2)) {
           showModal(modalDialog(
             title = "Error",
             "Please Enter a Gene Length File first!"
           ))
         }
         
         lengths_df <- gene_length()
         merge_DS <- merge(raw_DS, lengths_df, by = "row.names")
         rownames(merge_DS) <- merge_DS[, 1]
         merge_DS <- merge_DS[, -1]
         raw_DS <- merge_DS[, -ncol(merge_DS)]
         lengths <- merge_DS[, ncol(merge_DS)]
         # print("length")
         # print(head(merge_DS))
       }
       # print("from line 981 df_raw_shiny")
       # print(method)
       # print("raw_DS")
       # print(head(raw_DS[,1:4]))
       # print("dimension of raw_DS")
       # print(dim(raw_DS))
       ####
       if (method == "TPM") {
         #####  
         RPK= (raw_DS/lengths)
         scaling.factors = t(data.frame(colSums(RPK)/1000000))
         tpm.df <- data.frame(mapply('/', RPK, scaling.factors))
         rownames(tpm.df) = rownames(RPK)
         return(tpm.df)
         output$norm_table = DT::renderDataTable(RPK)
         #####
       } else if (method == "RPKM") {
         rpkm.matrix <- edgeR::rpkm(raw_DS, lengths)
         rpkm.df <- data.frame(rpkm.matrix)
         return(rpkm.df)
       } else if (method == "FPKM") {
         fpkm.matrix <- apply(raw_DS, 2, function(x) fpkm(x, lengths))
         fpkm.df <- data.frame(fpkm.matrix)
         return(fpkm.df)
       } else if (method == "None") {
         return(raw_DS)
       } else if (method == "RUV") {
         if (is.null(input$spikes1)&&is.null(input$spikes2)) {
           showModal(modalDialog(
             title = "Error",
             "Please Enter a Negative Control File first!"
           ))
         }
         spikes <- neg_control()
         if (!is.null(spikes)) {
           spikes <- intersect(spikes, rownames(raw_DS))
         }
         # f <- group_names()
         # if( is.null(spikes) )
         #   spikes <- getEmpirical(rawDS,f)
         set1 <- RUVg.apply(raw_DS, spikes)
         RUV.df <- as.data.frame(normCounts(set1))
         return(RUV.df)
       }
     })
     
     ### for distribution fitting
     distfit_df <- reactive({
       type <- input$file_type
       if (type == "norm") {
         DS <- df_shiny()
       } else if (type == "raw") {
         DS <- df_raw_shiny()
       }
       for (i in 1:ncol(DS)) {
         DS <- DS[which(DS[, i] > 0), ]
         DS <- na.omit(DS)
       }
       return(DS)
     })
     
     
     ######### ANALYSIS FROM HERE ############
     ######## RLEplot and Preprocessing ###########
     #############################################
     
     
     RLE.plot <- reactive({
       type <- input$file_type
       if (type == "norm") {
         DS <- df_shiny()
       } else if (type == "raw") {
         DS <- df_raw_shiny()
       }
       set1 <- newSeqExpressionSet(as.matrix(DS))
       norm_method_name <- input$norm_method
       colors <- c("RPKM" = "blue", "FPKM" = "darkcyan", "TPM" = "darkgreen", "RUV" = "Brown", "Upper Quartile" = "Brown")
       if (norm_method_name != "None" & input$submit_preprocessing != 0) {
         spikes <- neg_control()
         if (norm_method_name == "RUV" & is.null(spikes)) {
           norm_method_name <- "Upper Quartile"
         }
         par(mar = c(7, 4, 4, 4) + 1.2)
         plotRLE(set1,
                 ylim = c(-1.5, 1.5), outline = FALSE, col = colors[norm_method_name],
                 las = 2,
                 hjust = 1,
                 main = paste(norm_method_name, "Normalized")
         )
       }
     })
     
     
     violin_plot <- reactive({
       type <- input$file_type
       if (type == "norm") {
         DS <- df_shiny()
       } else if (type == "raw") {
         DS <- df_raw_shiny()
       }
       
       norm_method_name <- input$norm_method
       
       if (norm_method_name != "None" & input$submit_preprocessing != 0) {
         
         df <- as.data.frame(DS)
         df <- setNames(stack(df),c("norm_type","Genotype"))
         df$norm_type <- log(df$norm_type+1)
         
         p <- ggplot(df, aes(x=Genotype, y=norm_type)) + 
           geom_violin(trim=FALSE) + 
           scale_color_brewer(palette="Dark2") +
           labs(title=paste(norm_method_name,"Normalized",sep = ' '), y = paste("log(",norm_method_name,"+1)",sep = '') )+
           stat_summary(fun.data=mean_sdl, mult=1, 
                        geom="pointrange", color="red") +
           theme(axis.text.x = element_text(angle = 90, hjust = 1))
         p
         
         ggplotly(p, tooltip = c("text"))
         
       }
     })
     
     
     output$RLE.plot <- renderPlot({
       RLE.plot()
     })
     
     output$violin_plot <- renderPlotly({
       violin_plot()
     })
     
     output$RLE.plot2 <- renderPlot({ # for raw data
       start.rle <- Sys.time()
       type <- input$file_type
       if (type == "norm") {
         raw_DS <- df_shiny()
         main_title <- "Input data"
       } else if (type == "raw") {
         raw_DS <- df_raw()
         main_title <- "Raw data"
       }
       
       set1 <- newSeqExpressionSet(as.matrix(raw_DS))
       if (input$submit_preprocessing != 0) {
         par(mar = c(7, 4, 4, 4) + 1.2)
         plotRLE(set1, ylim = c(-1.5, 1.5), outline = FALSE, main = main_title, las = 2)
       }
       end.rle <- Sys.time()
       print("time for RLE plot and preprocessing")
       print(end.rle - start.rle)
     })
     
     violin_plot2 <- reactive({
       type <- input$file_type
       if (type == "norm") {
         raw_DS <- df_shiny()
         main_title <- "Input data"
       } else if (type == "raw") {
         raw_DS <- df_raw()
         main_title <- "Raw data"
       }
       
       df <- as.data.frame(raw_DS)
       df <- setNames(stack(df),c("norm_type","Genotype"))
       df$norm_type <- log(df$norm_type+1)
       
       p <- ggplot(df, aes(x=Genotype, y=norm_type)) + 
         geom_violin(trim=FALSE) + 
         scale_color_brewer(palette="Dark2") +
         labs(title="Raw Data", y = paste("log(Raw Data+1)",sep = '') ) +
         stat_summary(fun.data=mean_sdl, mult=1, 
                      geom="pointrange", color="red") +
         theme(axis.text.x = element_text(angle = 90, hjust = 1))
       p
       
       ggplotly(p, tooltip = c("text"))
     })
     
     output$violin_plot2 <- renderPlotly({
       violin_plot2()
     })
     
     output$norm_table <- DT::renderDataTable({
       type <- input$file_type
       if (type == "norm") {
        DS <- df_shiny()
       } else if (type == "raw") {
         DS <- df_raw_shiny()
       }
        if(input$submit_preprocessing != 0)
       DS # with filtering and normalization
     })
    
     output$meta_table <- DT::renderDataTable({
       f <- group_names()
       type <- input$file_type
       if (type == "norm") {
         DS <- df_shiny()
       } else if (type == "raw") {
         DS <- df_raw_shiny()
       }
       if (!is.null(f)) {
         meta_df <- data.frame("Column names" = colnames(DS), "Description" = f)
         meta_df
       }
     })
     
     output$download_norm_data <- downloadHandler(
       filename = function() {
         method <- input$norm_method
         paste(method, "normalized.csv")
       },
       content = function(file) {
         type <- input$file_type
         if (type == "norm") {
           DS <- df_shiny()
         } else if (type == "raw") {
           DS <- df_raw_shiny()
         }
         write.csv(DS, file, row.names = T)
       }
     )
     
     
     
     
   
     
     ############################
     ######## scatter ###########
     ############################
     
     # input scatter data
     plotScatter <- reactive({
       scatter.start <- Sys.time()
       trans <- input$trans
       x <- input$scatter.x
       y <- input$scatter.y
       type <- input$file_type
       if (type == "norm") {
         DS <- df_shiny()
       } else if (type == "raw") {
         DS <- df_raw_shiny()
       }
       
       if (trans == "None") {
         scatter.data <- DS
       } else if (trans == "Natural log") {
         scatter.data <- log1p(DS)
       } else if (trans == "log2") {
         scatter.data <- log2(DS + 1)
       } else if (trans == "log10") {
         scatter.data <- log10(DS + 1)
       }
       scatter.end <- Sys.time()
       print("Scatter plot time")
       print(scatter.end - scatter.start)
       return(list(x, y, scatter.data))
     })
     
     
     get_density <- function(x, y, ...) {
       dens <- MASS::kde2d(x, y, ...)
       ix <- findInterval(x, dens$x)
       iy <- findInterval(y, dens$y)
       ii <- cbind(ix, iy)
       return(dens$z[ii])
     }
     
     scatterplot <- function() {
       # get values from list
       li <- plotScatter()
       xval <- li[[1]]
       yval <- li[[2]]
       scatter.data <- li[[3]]
       
       # data frame needed for ggplot
       df <- data.frame(t1 = scatter.data[, xval], t2 = scatter.data[, yval])
       
       # get 2d kernel density estimate
       df$density <- get_density(df$t1, df$t2, n = 100)
       
       # plot heat scatter w/ ggplot
       p <- ggplot(df, aes(x = t1, y = t2, color = density, text = paste(xval, ": ", round(t1, 4), "\n", yval, ": ", round(t2, 4), sep = ""), group = 1)) +
         geom_point(shape = 19, size =    0.25) +
         scale_color_viridis()
       
       # modify label and fill defaults
       p <- p + xlab(xval) + ylab(yval) + labs(color = "KDE", title = paste("Scatter Plot, R=", round(cor(scatter.data[, xval], scatter.data[, yval]), 3)))
       
       # if checkbox is ticked, display regression line
       if (input$regline == TRUE) {
         p <- p + geom_smooth(method = lm, se = FALSE, size = 0.5, color = "blue")
       }
       
       
       hide("help_text_scatter")
       # add interactivity w/ plotly
       p
       ggplotly(p, tooltip = c("text"))
       
       
     }
     
     scatterplot_collage <- function() {
       li <- plotScatter()
       scatter.data <- li[[3]]
       par(mfrow = c(3, 3))
       for (i in 1:ncol(scatter.data)) {
         for (j in i:ncol(scatter.data)) {
           d <- kde2d(scatter.data[, i], scatter.data[, j])
           ColorLevels <- round(seq(min(d$z), max(d$z), length = 5), 4)
           heatscatter(x = scatter.data[, i], y = scatter.data[, j], xlab = colnames(scatter.data)[i], ylab = colnames(scatter.data)[j], main = "")
           legend("topleft", paste("R=", round(cor(scatter.data[, i], scatter.data[, j]), 3)), bty = "n")
           legend("bottomright", title = "KDE", legend = ColorLevels, pch = 19, col = LSD::colorpalette("heat"))
           if (i != j) {
             lines(lowess(scatter.data[, i], scatter.data[, j]), col = "black")
           }
         }
       }
     }
     
     observeEvent(input$submit_scatter, {
       output$scatter.plot <- renderPlotly({
         scatterplot()
       })
       
     })
     
     output$downloadscatter_collage <- downloadHandler(
       filename = function() {
         paste("heatscatter_collage", ".pdf", sep = "")
       },
       content = function(file) {
         pdf(file)
         scatterplot_collage()
         dev.off()
       }
     )
     
     output$downloadscatter <- downloadHandler(
       filename = function() {
         paste("heatscatter", ".pdf", sep = "")
       },
       content = function(file) {
         htmlwidgets::saveWidget(widget = scatterplot(), file = "scatterplot.html")
         webshot(url = "scatterplot.html", file = file)
       }
     )
     
     output$help_text_scatter <- renderUI({
       HTML("
    <br>
    <br>
      <center>
        <p>
          <b>
          Scatter plot compares global gene expression
          between 2 conditions.<br>Color density is calculated based on 2D Gaussian kernel density.
          </b>
        </p>
      </center>
    ")
     })
     ############################
     ######## distfit ###########
     ############################
     
     
     output$downloaddist <- downloadHandler(
       filename = function() {
         paste("distribution_fit", ".pdf", sep = "")
       },
       content = function(file) {
         pdf(file)
         distplot()
         dev.off()
       }
     )
     
     output$dist_range_allowed <- renderText({
       DS <- distfit_df()
       paste("Suggested range: ( 0", " ~ ", round(max(DS)), " ]", sep = "")
     })
     
     plotDist <- reactive({
       dist.start <- Sys.time()
       dis <- input$distributions
       var <- input$dist.var
       DS <- distfit_df()
       fits <- list()
       distrs <- NULL
       numcol <- c(0, 0, 0, 0, 0, 0)
       dist_zoom <- input$dist_zoom
       if (dist_zoom == "slider") {
         fit_range <- input$dist_range
       } else if (dist_zoom == "text input") {
         fit_range <- c(input$dist_range_min, input$dist_range_max)
       }
       if ("Log-normal" %in% dis) {
         fit_ln <- fitdist(DS[, var], "lnorm")
         fits <- c(fits, list(fit_ln))
         distrs <- c(distrs, "Log-normal")
         numcol[1] <- 1
       }
       if ("Log-logistic" %in% dis) {
         fit_ll <- fitdist(DS[, var], "llogis", start = list(shape = 10, scale = 10), lower = c(0, 0))
         fits <- c(fits, list(fit_ll))
         distrs <- c(distrs, "Log-logistic")
         numcol[2] <- 1
       }
       if ("Pareto" %in% dis) {
         fit_P <- fitdist(DS[, var], "pareto", start = list(shape = 10, scale = 10), lower = c(0, 0))
         fits <- c(fits, list(fit_P))
         distrs <- c(distrs, "Pareto")
         numcol[3] <- 1
       }
       if ("Burr" %in% dis) {
         fit_B <- fitdist(DS[, var], "burr", start = list(shape1 = 0.3, shape2 = 1, rate = 1), lower = c(0, 0, 0))
         fits <- c(fits, list(fit_B))
         distrs <- c(distrs, "Burr")
         numcol[4] <- 1
       }
       if ("Weibull" %in% dis) {
         fit_W <- fitdist(DS[, var], "weibull", lower = c(0, 0))
         fits <- c(fits, list(fit_W))
         distrs <- c(distrs, "Weibull")
         numcol[5] <- 1
       }
       if ("Gamma" %in% dis) {
         fit_G <- fitdist(DS[, var], "gamma", lower = c(0, 0), start = list(scale = 1, shape = 1))
         fits <- c(fits, list(fit_G))
         distrs <- c(distrs, "Gamma")
         numcol[6] <- 1
       }
       dist.end <- Sys.time()
       print("Distribution fitting time")
       print(dist.end - dist.start)
       return(list(fits, distrs, numcol, var, fit_range))
     })
     
     distaic <- reactive({
       dist.start <- Sys.time()
       DS <- distfit_df()
       AIC.df <- as.data.frame(matrix(nrow = ncol(DS), ncol = 6))
       rownames(AIC.df) <- colnames(DS)
       colnames(AIC.df) <- c("Log-normal", "Log-logistic", "Pareto", "Burr", "Weibull", "Gamma")
       for (i in 1:nrow(AIC.df)) {
         fit_ln <- fitdist(DS[, i], "lnorm")
         fit_ll <- fitdist(DS[, i], "llogis", start = list(shape = 10, scale = 10), lower = c(0, 0))
         fit_P <- fitdist(DS[, i], "pareto", start = list(shape = 10, scale = 10), lower = c(0, 0))
         fit_B <- fitdist(DS[, i], "burr", start = list(shape1 = 0.3, shape2 = 1, rate = 1), lower = c(0, 0, 0))
         fit_W <- fitdist(DS[, i], "weibull", lower = c(0, 0))
         fit_G <- fitdist(DS[, i], "gamma", lower = c(0, 0), start = list(scale = 1, shape = 1))
         fits <- list(fit_ln, fit_ll, fit_P, fit_B, fit_W, fit_G)
         AIC.df[i, ] <- gofstat(fits)$aic
       }
       for (i in 1:nrow(AIC.df)) {
         AIC.df$min.AIC[i] <- colnames(AIC.df)[which.min(AIC.df[i, 1:6])]
       }
       dist.end <- Sys.time()
       print("distribution fitting time")
       print(dist.end - dist.start)
       
       return(AIC.df)
     })
     
     distplot <- function() {
       li <- plotDist()
       fits <- li[[1]]
       distrs <- li[[2]]
       numcol <- li[[3]]
       var <- li[[4]]
       fit_range <- li[[5]]
       line_types <- c(1, 2, 3, 4, 5, 6) # par lty
       if (length(fits) != 0) {
         cdfcomp(fits,
                 xlogscale = TRUE, ylogscale = TRUE,
                 ylab = "CDF", xlab = "Expression levels (log)", xlim = c(fit_range[1], fit_range[2]), ylim = c(10^-3, 1),
                 legendtext = distrs, cex = 0.5, main = var, fitcol = rainbow(6)[which(numcol == 1)], fitlty = line_types[which(numcol == 1)]
         )
       }
       
     }
     
     output$downloaddistaic <- downloadHandler(
       filename = function() {
         paste("aic", ".csv", sep = "")
       },
       content = function(file) {
         write.csv(distaic(), file, row.names = TRUE)
       }
     )
     
     observeEvent(input$submit_distfit, {
       output$dist.plot <- renderPlot({
         distplot()
       })
       output$dist.aic <- renderTable({
         distaic()
       },
       rownames = TRUE
       )
       
     })
     
     
     output$help_text_dis_fit <- renderUI({
       HTML("
    <br>
    <br>
      <center>
        <p>
          <b>
          Fitting the selected probability distribution(s) to transcriptome-wide data of the selected sample.<br>
           Cumulative distribution function will be showned, with black lines being the empirical (transcriptomic) data, 
           and colored lines being the probability distribution(s) with best fitted parameters. <br>
           The AIC (Akaike information criterion) table provides a comparison in goodness-of-fit to transcriptomic data
           among selected probability distribution(s).
          </b>
        </p>
      </center>
    ")
     })
  ###################################################################################################   
     ###################################
     ###################################
     ##########   Uniprot    ###########
     ###################################
     ###################################
     
     df_uniprot <- reactive({
       print("running")
       if (is.null(input$file_uniprot) && is.null(input$text_uniprot)) {
         return(NULL)
       }
       else if(!is.null(input$file_uniprot)){
         parts <- strsplit(input$file_uniprot$datapath, ".", fixed = TRUE)
         type <- parts[[1]][length(parts[[1]])]
         type <- tolower(type)
         if (type != "csv") {
           showModal(modalDialog(
             title = "Error",
             "Please input a csv file!"
           ))
           return(NULL)
         }
         
         Accessions <- read.csv(input$file_uniprot$datapath)
         Accessions <- na.omit(Accessions)[,1]
         Accessions <- unique(Accessions)
         Accessions <- trimws(Accessions)
         print(Accessions)
       }else{
         Acessions<-strsplit(input$text_uniprot,",")
         print(length(Acessions[[1]]))
         if(length(Acessions[[1]])==1){
           Acessions<-strsplit(input$text_uniprot," ")
           
         }
         
         Accessions <- data.frame(Acessions[[1]][1])
         for (x in 2:length(Acessions[[1]])) {
           Accessions<-rbind(Accessions,Acessions[[1]][x])
         }
         
         print(Accessions)
         Accessions <- na.omit(Accessions)
         Accessions <- Accessions[!duplicated(Accessions[, 1]), ]
         
       }
       return(Accessions)
       
     })
     
     plotUniprot <-  eventReactive(input$submit_uniprot, {
       
       Accessions <- df_uniprot()
       print(Accessions)
       hide("help_text_bio_pr")
       #print("Please Wait... Fetching Taxa Object. It may take a while")
       #TaxaObj <- GetNamesTaxa(Accessions)
       print("Please Wait... Fetching Gene Ontology Object. It may take a while")
       GeneOntologyObj <- GetProteinGOInfo(Accessions) 
       print("Done") 
       return(GeneOntologyObj)
     })
     
     output$help_text_bio_pr <- renderUI({
       HTML("
    <br>
    <br>
      <center>
        <p>
          <b>
          This page retrieves the Gene Ontology (GO) terms 
          from <a href ='http://UniProt.org'>UniProt.org</a> of a given set of UniProt accessions.
          </b>
        </p>
      </center>
    ")
     })
     
     plotCE <- function() {
       # get data
       GO_df <- plotUniprot()
       return(Plot.GOSubCellular(GO_df,20))
       # ggplotly(bar_plot, tooltip = c("text"))
     }
     
     output$download_cell_plot <- downloadHandler(
       filename = function(){paste("Cellular-Component",'.png',sep='')},
       content = function(file){
         ggsave(file,plot=plotCE())
       }
     )
     
     plotBIO <- function() {
       # get data
       GO_df <- plotUniprot()
       return(PlotGOBiological(GO_df,20))
       # ggplotly(bar_plot, tooltip = c("text"))
     }
     
     output$download_bio_plot <- downloadHandler(
       filename = function(){paste("Biological-Process",'.png',sep='')},
       content = function(file){
         ggsave(file,plot=plotBIO())
       }
     )
     
     plotMol <- function() {
       # get data
       GO_df <- plotUniprot()
       return(Plot.GOMolecular(GO_df, 20))
       # ggplotly(bar_plot, tooltip = c("text"))
     }
     
     output$download_mole_plot <- downloadHandler(
       filename = function(){paste("Molecular-Function",'.png',sep='')},
       content = function(file){
         ggsave(file,plot=plotMol())
       }
     )
     
     output$uniprot_celplot <- renderPlot({
       GO_df <- plotUniprot()
       Plot.GOSubCellular(GO_df,20)
       ##ggplotly(plotCE(), tooltip = c("text"))
     })
     
     output$uniprotbioplot <- renderPlot({
       #ggplotly(plotBIO(), tooltip = c("text"))
       GO_df <- plotUniprot()
       PlotGOBiological(GO_df,20)
     })
     
     output$uniprot_molcplot <- renderPlot({
       GO_df <- plotUniprot()
       Plot.GOMolecular(GO_df,20)
       #ggplotly(plotMol(), tooltip = c("text"))
     })
     
     download_cel_table <- NULL
     
     output$uniprot_celtable <- shiny::renderDataTable({
       
       GO_df <- plotUniprot()
       CellularDF <- Goparse(GO_df, 5)
       CellularDF <- na.omit(CellularDF)
       download_cel_table <- CellularDF
       CellularDF
       
       
     })
     
     output$download_cell_comp <- downloadHandler(
       filename = function() {
         paste("Cellular-Component", ".csv", sep = "")
       },
       content = function(file) {
         write.csv(download_cel_table, file, row.names = FALSE)
       }
     )
     
     download_bio_table <- NULL
     
     output$uniprot_biotable <- shiny::renderDataTable({
       
       GO_df <- plotUniprot()
       BiologicalDF <- Goparse(GO_df, 3)
       BiologicalDF <- na.omit(BiologicalDF)
       download_bio_table <- BiologicalDF
       BiologicalDF
     })
     
     output$download_bio_pro <- downloadHandler(
       filename = function() {
         paste("Biological-Process", ".csv", sep = "")
       },
       content = function(file) {
         write.csv(download_bio_table, file, row.names = FALSE)
       }
     )
     
     download_mol_table <- NULL
     
     output$uniprot_molctable <- shiny::renderDataTable({
       
       GO_df <- plotUniprot()
       MolecularDF <- Goparse(GO_df, 4)
       MolecularDF <- na.omit(MolecularDF)
       download_mol_table <- MolecularDF
       MolecularDF
       
     })
     
     output$download_mole_func <- downloadHandler(
       filename = function() {
         paste("Molecular-Function", ".csv", sep = "")
       },
       content = function(file) {
         write.csv(download_mol_table, file, row.names = FALSE)
       }
     )
     
     ###################################
     ###################################
     ###### Pathways Enrichment ########
     ###################################
     ###################################
     
     
     pathway_enri_df <- reactiveVal(0)
     pathway_enri_nodes <- reactiveVal(0)
     
     df_path_enri_gene <- reactive({
       print("running pathway gene...")
       if (is.null(input$file_path_enri_gene) && is.null(input$text_path_enri_gene) ) {
         return(NULL)
       }else if(!is.null(input$file_path_enri_gene)){
         parts <- strsplit(input$file_path_enri_gene$datapath, ".", fixed = TRUE)
         type <- parts[[1]][length(parts[[1]])]
         type <- tolower(type)
         if (type != "csv") {
           showModal(modalDialog(
             title = "Error",
             "Please input a csv file!"
           ))
           return(NULL)
         }
         
         Accessions <- read.csv(input$file_path_enri_gene$datapath)
         print(Accessions)
         Accessions <- na.omit(Accessions)
         Accessions <- Accessions[!duplicated(Accessions[, 1]), ]
       }
       else{
         
         Acessions<-strsplit(input$text_path_enri_gene," ")
         print(Acessions)
         Accessions <- data.frame(Acessions[[1]][1])
         for (x in 2:length(Acessions[[1]])) {
           print(x)
           Accessions<-rbind(Accessions,Acessions[[1]][x])
         }
         
         print(Accessions)
         Accessions <- na.omit(Accessions)
         Accessions <- Accessions[!duplicated(Accessions[, 1]), ]
         
       }
       
       return(Accessions)
     })
     
     
     df_path_enri_prot <- reactive({
       print("running...")
       if (is.null(input$file_path_enri_prot)&& is.null(input$text_path_enri_prot)) {
         return(NULL)
       }
       else if(!is.null(input$file_path_enri_prot)){
         parts <- strsplit(input$file_path_enri_prot$datapath, ".", fixed = TRUE)
         type <- parts[[1]][length(parts[[1]])]
         type <- tolower(type)
         if (type != "csv") {
           showModal(modalDialog(
             title = "Error",
             "Please input a csv file!"
           ))
           return(NULL)
         }
         
         Accessions <- read.csv(input$file_path_enri_prot$datapath)
         print(Accessions)
         Accessions <- na.omit(Accessions)
         Accessions <- Accessions[!duplicated(Accessions[, 1]), ]
       }
       else{
         Acessions<-strsplit(input$text_path_enri_prot,",")
         if(length(Acessions[[1]])==1){
           Acessions<-strsplit(input$text_path_enri_prot," ")
           
         }
         Accessions <- data.frame(Acessions[[1]][1])
         for (x in 2:length(Acessions[[1]])) {
           print(x)
           Accessions<-rbind(Accessions,Acessions[[1]][x])
         }
         
         print(Accessions)
         Accessions <- na.omit(Accessions)
         Accessions <- Accessions[!duplicated(Accessions[, 1]), ]
         
       }
       return(Accessions)
       
     })
     
     
     df_path_enri_id_gene <- eventReactive(input$submit_path_enri_gene,{
       print("running")
       
       hide("help_text_path_enri")
       df <- df_path_enri_gene()
       
       return(df)
     })
     
     df_path_enri_id_prot <- eventReactive(input$submit_path_enri_prot,{
       print("running")
       
       hide("help_text_path_enri")
       df <- df_path_enri_prot()
       return(df)
     })
     
     
     output$help_text_path_enri_gene <- renderUI({
       HTML("
    <br>
    <br>
      <center>
        <p>
          <b>
          This page performs Pathways Enrichment from for a given set of genes using
          <a href ='https://biit.cs.ut.ee/gprofiler/gost'>g:Profiler</a>.
          </b>
        </p>
      </center>
    ")
     })
     
     output$help_text_path_enri_prot <- renderUI({
       HTML("
    <br>
    <br>
      <center>
        <p>
          <b>
          This page performs Pathways Enrichment from for a given set of genes using
          <a href ='https://biit.cs.ut.ee/gprofiler/gost'>g:Profiler</a>.
          </b>
        </p>
      </center>
    ")
     })
     
     
     plot_path_enri_gene <- function() {
       df_path_enri_id_gene()
       gene_name <- as.data.frame(df_path_enri_id_gene())
       gene_name[,1] <- as.character(gene_name[,1])
       
       path_list <- gost(gene_name[,1],exclude_iea = TRUE,evcodes = TRUE ,sources = "GO:BP")
       path_df <- path_list[[1]]
       pathway_enri_df(path_df)
       prot_num <- data.frame()
       for(i in 1:nrow(path_df))
       {
         prot_num <- rbind(prot_num,nrow(as.data.frame(strsplit(path_df[i,"intersection"],","))))
       }
       
       path_enrich_df <- data.frame(
         "term_name" = path_df[,"term_name"],
         "intersection" = prot_num[,1]
       )
       
       pathway_enri_nodes(path_enrich_df)
       
       path_enrich_df <- path_enrich_df[order(path_enrich_df$intersection),]
       
       
       bar_plot <- ggplot(data=path_enrich_df, aes(x=reorder(path_enrich_df$term_name , path_enrich_df$intersection), y=path_enrich_df$intersection)) +
         geom_bar(stat="identity", fill="steelblue" , alpha = 0.7) + xlab("Molecular function") + ylab("Number of Genes") +
         geom_text(aes(label = path_enrich_df$intersection), vjust = -0.03) + theme(axis.text.x = element_text(angle = 90 , hjust = 1 , vjust = 0.2))+
         theme_minimal() +coord_flip() + theme_bw()+theme(text = element_text(size=12, face="bold", colour="black"),axis.text.x = element_text(vjust=2))
       
       
       return(bar_plot)
     }
     
     plot_path_enri_prot <- function() {
       df_path_enri_id_prot()
       gene_name <- as.data.frame(df_path_enri_id_prot())
       gene_name[,1] <- as.character(gene_name[,1])
       
       path_list <- gost(gene_name[,1],exclude_iea = TRUE,evcodes = TRUE ,sources = "GO:BP")
       path_df <- path_list[[1]]
       pathway_enri_df(path_df)
       prot_num <- data.frame()
       for(i in 1:nrow(path_df))
       {
         prot_num <- rbind(prot_num,nrow(as.data.frame(strsplit(path_df[i,"intersection"],","))))
       }
       
       path_enrich_df <- data.frame(
         "term_name" = path_df[,"term_name"],
         "intersection" = prot_num[,1]
       )
       
       pathway_enri_nodes(path_enrich_df)
       
       path_enrich_df <- path_enrich_df[order(path_enrich_df$intersection),]
       
       
       bar_plot <- ggplot(data=path_enrich_df, aes(x=reorder(path_enrich_df$term_name , path_enrich_df$intersection), y=path_enrich_df$intersection)) +
         geom_bar(stat="identity", fill="steelblue" , alpha = 0.7) + xlab("Molecular function") + ylab("Number of Genes") +
         geom_text(aes(label = path_enrich_df$intersection), vjust = -0.03) + theme(axis.text.x = element_text(angle = 90 , hjust = 1 , vjust = 0.2))+
         theme_minimal() +coord_flip() + theme_bw()+theme(text = element_text(size=12, face="bold", colour="black"),axis.text.x = element_text(vjust=2))
       
       
       return(bar_plot)
     }
     
     
     output$path_enri.plot_gene <- renderPlotly({
       df_path_enri_id_gene()
       gene_name <- as.data.frame(df_path_enri_id_gene())
       gene_name[,1] <- as.character(gene_name[,1])
       
       ggplotly(Pathway.Enr(gene_name[,1]), tooltip = c("text"))
     })
     
     output$path_enri.plot_prot <- renderPlotly({
       df_path_enri_id_prot()
       gene_name <- as.data.frame(df_path_enri_id_prot())
       gene_name[,1] <- as.character(gene_name[,1])
       
       ggplotly(Pathway.Enr(gene_name[,1]), tooltip = c("text"))
     })
     
     #visualization
     
     observeEvent(input$fit_path_gene, ignoreInit=TRUE, {
       fit(session, 80)
     })
     
     
     observeEvent(input$fit_path_prot, ignoreInit=TRUE, {
       fit(session, 80)
     })
     
     
     observeEvent(input$showCondition_gene, ignoreInit=TRUE, {
       condition.name <- isolate(input$showCondition_gene)
       values <- as.numeric(pathway_enri_nodes()[,2])
       node.names <- pathway_enri_nodes()[,1]
       print(values)
       setNodeAttributes(session, attributeName="lfc", nodes=node.names, values)
     })
     
     
     observeEvent(input$showCondition_prot, ignoreInit=TRUE, {
       condition.name <- isolate(input$showCondition_prot)
       values <- as.numeric(pathway_enri_nodes()[,2])
       node.names <- pathway_enri_nodes()[,1]
       print(values)
       setNodeAttributes(session, attributeName="lfc", nodes=node.names, values)
     })
     
     
     observeEvent(input$loadStyleFile_path_gene,  ignoreInit=TRUE, {
       if(input$loadStyleFile_path != ""){
         tryCatch({
           loadStyleFile(input$loadStyleFile_path_gene)
         }, error=function(e) {
           msg <- sprintf("ERROR in stylesheet file '%s': %s", input$loadStyleFile_path_gene, e$message)
           showNotification(msg, duration=NULL, type="error")
         })
         later(function() {updateSelectInput(session, "loadStyleFile", selected=character(0))}, 0.5)
       }
     })
     
     
     
     observeEvent(input$loadStyleFile_path_prot,  ignoreInit=TRUE, {
       if(input$loadStyleFile_path_prot != ""){
         tryCatch({
           loadStyleFile(input$loadStyleFile_path_prot)
         }, error=function(e) {
           msg <- sprintf("ERROR in stylesheet file '%s': %s", input$loadStyleFile_path_prot, e$message)
           showNotification(msg, duration=NULL, type="error")
         })
         later(function() {updateSelectInput(session, "loadStyleFile", selected=character(0))}, 0.5)
       }
     })
     
     
     
     observeEvent(input$doLayout_path_gene,  ignoreInit=TRUE,{
       if(input$doLayout_path_gene != ""){
         strategy <- input$doLayout_path_gene
         doLayout(session, strategy)
         later(function() {updateSelectInput(session, "doLayout", selected=character(0))}, 1)
       }
     })
     
     observeEvent(input$doLayout_path_prot,  ignoreInit=TRUE,{
       if(input$doLayout_path_prot != ""){
         strategy <- input$doLayout_path_prot
         doLayout(session, strategy)
         later(function() {updateSelectInput(session, "doLayout", selected=character(0))}, 1)
       }
     })
     
     
     
     observeEvent(input$sfn_path_gene,  ignoreInit=TRUE,{
       selectFirstNeighbors(session)
     })
     
     observeEvent(input$sfn_path_prot,  ignoreInit=TRUE,{
       selectFirstNeighbors(session)
     })
     
     
     
     observeEvent(input$fitSelected_path_gene,  ignoreInit=TRUE,{
       fitSelected(session, 100)
     })
     
     observeEvent(input$fitSelected_path_prot,  ignoreInit=TRUE,{
       fitSelected(session, 100)
     })
     
     
     
     observeEvent(input$getSelectedNodes_path_gene, ignoreInit=TRUE, {
       output$selectedNodesDisplay_path_gene <- renderText({" "})
       getSelectedNodes(session)
     })
     
     observeEvent(input$getSelectedNodes_path_prot, ignoreInit=TRUE, {
       output$selectedNodesDisplay_path_prot <- renderText({" "})
       getSelectedNodes(session)
     })
     
     
     
     observeEvent(input$clearSelection_path_gene,  ignoreInit=TRUE, {
       clearSelection(session)
     })  
     
     observeEvent(input$clearSelection_path_prot,  ignoreInit=TRUE, {
       clearSelection(session)
     })  
     
     
     
     observeEvent(input$removeGraphButton_path_gene, ignoreInit=TRUE, {
       removeGraph(session)
     })
     
     observeEvent(input$removeGraphButton_path_prot, ignoreInit=TRUE, {
       removeGraph(session)
     })
     
     
     observeEvent(input$addRandomGraphFromDataFramesButton_path_gene, ignoreInit=TRUE, {
       source.nodes <-  LETTERS[sample(1:5, 5)]
       target.nodes <-  LETTERS[sample(1:5, 5)]
       tbl.edges <- data.frame(source=source.nodes,
                               target=target.nodes,
                               interaction=rep("generic", length(source.nodes)),
                               stringsAsFactors=FALSE)
       all.nodes <- sort(unique(c(source.nodes, target.nodes, "orphan")))
       tbl.nodes <- data.frame(id=all.nodes,
                               type=rep("unspecified", length(all.nodes)),
                               stringsAsFactors=FALSE)
       addGraphFromDataFrame(session, tbl.edges, tbl.nodes)
     })
     
     observeEvent(input$addRandomGraphFromDataFramesButton_path_prot, ignoreInit=TRUE, {
       source.nodes <-  LETTERS[sample(1:5, 5)]
       target.nodes <-  LETTERS[sample(1:5, 5)]
       tbl.edges <- data.frame(source=source.nodes,
                               target=target.nodes,
                               interaction=rep("generic", length(source.nodes)),
                               stringsAsFactors=FALSE)
       all.nodes <- sort(unique(c(source.nodes, target.nodes, "orphan")))
       tbl.nodes <- data.frame(id=all.nodes,
                               type=rep("unspecified", length(all.nodes)),
                               stringsAsFactors=FALSE)
       addGraphFromDataFrame(session, tbl.edges, tbl.nodes)
     })
     
     
     
     # observeEvent(input$selectedNodes, {
     #       newNodes <- input$selectedNodes;
     #       output$selectedNodesDisplay <- renderText({
     #          paste(newNodes)
     #          })
     #       })
     
     pathway_overlap <- reactiveVal(0)
     
     new_source_var <- reactiveVal(0)
     new_target_var <- reactiveVal(0)
     overlap_wt <- reactiveVal(0)
     
     output$path_enri_visu_gene <- renderCyjShiny({
       
       print("visualization")
       df_path_enri_id_gene()
       Enrich <- gost(df_path_enri_id_gene(),evcodes = T, sources = c('KEGG', 'REAC'))
       Pathway <- Construct.COPathway(Enrich, input$overlap_min_gene)
       nodes_tot <- c(unique(Pathway[,1],unique(Pathway[,2])))
       
       
       path_enri.nodes <- data.frame(id=nodes_tot,
                                     type=nodes_tot,
                                     stringsAsFactors=FALSE)
       
       path_enri.edges <- data.frame(source=Pathway[,1],
                                     target=Pathway[,2],
                                     interaction=Pathway[,1],
                                     stringsAsFactors=FALSE)
       
       graph.json <- dataFramesToJSON(path_enri.edges, path_enri.nodes)
       cyjShiny(graph=graph.json, layoutName="cola", styleFile = "./www/style/basicStyle.js")
       
     })
     
     Construct.COPathway <- function(EnrichmentObject, threshold = 1)
     {
       
       PathwayNetwork <- data.frame()
       PathwayDF <- EnrichmentObject[["result"]] 
       for (i in 1:nrow(PathwayDF))
       {
         if (dim(PathwayDF)[1] == 1)
           break
         Pathway_accessions <- strsplit(PathwayDF$intersection, ",") 
         for (accession in Pathway_accessions)
         {
           inx <- which(grepl(accession, PathwayDF$intersection) == T)
           inx <- inx[-i] 
           Source <- rep(PathwayDF$term_name[i], length(inx))
           Target <- PathwayDF$term_name[c(inx)]
           PathwayNetwork <- rbind(PathwayNetwork , cbind(Source, Target, accession))
         }
         PathwayDF <- PathwayDF[-i,]
         CoEnrichment <- setNames(aggregate(PathwayNetwork$accession, by = list(PathwayNetwork$Source, PathwayNetwork$Target),
                                            paste, collapse=","), c("Source", "Target", "Accesion"))
         
         CoEnrichment$ProteinCount <- str_count(CoEnrichment$Accesion, ",")
         CoEnrichment <- CoEnrichment[CoEnrichment$ProteinCount >= threshold,]
       }
       return(CoEnrichment)
     }
     
     output$path_enri_visu_prot <- renderCyjShiny({
       
       print("visualization")
       df_path_enri_id_prot()
       Enrich <- gost(df_path_enri_id_prot(),evcodes = T, sources = c('KEGG', 'REAC'))
       Pathway <- Construct.COPathway(Enrich, input$overlap_min_prot)
       nodes_tot <- c(unique(Pathway[,1],unique(Pathway[,2])))
       
       
       path_enri.nodes <- data.frame(id=nodes_tot,
                                     type=nodes_tot,
                                     stringsAsFactors=FALSE)
       
       path_enri.edges <- data.frame(source=Pathway[,1],
                                     target=Pathway[,2],
                                     interaction=Pathway[,1],
                                     stringsAsFactors=FALSE)
       
       graph.json <- dataFramesToJSON(path_enri.edges, path_enri.nodes)
       cyjShiny(graph=graph.json, layoutName="cola", styleFile = "./www/style/basicStyle.js")
       
     })
     
     observeEvent(input$edge_wt_gene, ignoreInit=TRUE, {
       condition.name <- isolate(input$showCondition_gene)
       
       print(overlap_wt())
       setEdgeAttributes(session, attributeName="wt", sourceNodes=new_source_var(),
                         targetNodes=new_target_var(),
                         interactions=new_target_var(),
                         values=overlap_wt())
     })
     
     observeEvent(input$edge_wt_prot, ignoreInit=TRUE, {
       condition.name <- isolate(input$showCondition_prot)
       
       print(overlap_wt())
       setEdgeAttributes(session, attributeName="wt", sourceNodes=new_source_var(),
                         targetNodes=new_target_var(),
                         interactions=new_target_var(),
                         values=overlap_wt())
     })
     
     ###################################
     ###################################
     ###################################
     ###################################
     output$help_text_protein_set <- renderUI({
       HTML("
    <br>
    <br>
      <center>
        <p>
          <b>
          Please Upload or enter the Uniprot Accession Numbers.
          </b>
        </p>
      </center>
    ")
     })
     observeEvent(input$submit_protein_set,{
       if (is.null(input$file_protein_set) && is.null(input$text_protein_set)) {
         return(NULL)
       }else if(!is.null(input$file_protein_set)){
         parts <- strsplit(input$file_protein_set$datapath, ".", fixed = TRUE)
         type <- parts[[1]][length(parts[[1]])]
         type <- tolower(type)
         if (type != "csv") {
           showModal(modalDialog(
             title = "Error",
             "Please input a csv file!"
           ))
           return(NULL)
         }
         
         Accessions <- read.csv(input$file_protein_set$datapath)
         Accessions <- na.omit(Accessions)[,1]
         Accessions <- unique(Accessions)
         Accessions <- trimws(Accessions)
       }else{
         Accessions<-input$text_protein_set
         print(Accessions)
       }
       
       updateTextInput(session, "text_uniprot", value = paste(Accessions))
       updateTextInput(session, "text_prot_Int", value = paste(Accessions))
       updateTextInput(session, "text_prot_func", value = paste(Accessions))
       updateTextInput(session, "text_prot_local", value = paste(Accessions))
       updateTextInput(session, "text_prot_domain", value = paste(Accessions))
       updateTextInput(session, "text_prot_seq", value = paste(Accessions))
       updateTextInput(session, "text_prot_seq_evol", value = paste(Accessions))
       updateTextInput(session, "text_prot_seq_Patho", value = paste(Accessions))
       updateTextInput(session, "text_complex_prot", value = paste(Accessions))
       
       output$help_text_protein_set <- renderUI({
         HTML("
    <br>
    <br>
      <center>
        <p>
          <b>
          Data Upload Complete. Please proceed with the analysis.
          </b>
        </p>
      </center>
    ")
       })
     })
     
     
     
     
     
     
   }## server end bracket
               
   
shinyApp(ui = ui, server = server)



   
