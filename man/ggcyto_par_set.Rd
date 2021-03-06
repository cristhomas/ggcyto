% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggcyto_par.R
\name{ggcyto_par_set}
\alias{ggcyto_par_set}
\title{Set some default parameters for ggcyto}
\usage{
ggcyto_par_set(...)
}
\arguments{
\item{...}{a list of element name, element pairings that modify the
existing parameter settings}
}
\value{
a list of new settings for ggycto
}
\description{
Use this function to modify ggcyto parameters 
These are the regular (or to be instantiated as) scales, labs, facet objects.
They can be added as a single layer to the plot for the convenience.
}
\section{elements}{

The individual elements are:

\tabular{ll}{
  limits             \tab can be "data"(default) or "instrument" or a list of numeric limits for x and y
                   (e.g. \code{list(x = c(0, 4000))}) \cr
  facet             \tab the regular facet object \cr
  hex_fill             \tab default scale_fill_gradientn for geom_hex layer \cr
  lab              \tab labs_cyto object
  
}
}
\examples{
library(ggcyto)
dataDir <- system.file("extdata",package="flowWorkspaceData")
gs <- load_gs(list.files(dataDir, pattern = "gs_manual",full = TRUE))

p <- ggcyto(gs, aes(x = CD4, y = CD8), subset = "CD3+") 
# 2d plot 
p <- p + geom_hex(bins = 64)
p

#use instrument range by overwritting the default limits settings
p + ggcyto_par_set(limits = "instrument")

#manually set limits
myPars <- ggcyto_par_set(limits = list(x = c(0,3.2e3), y = c(-10, 3.5e3)))
 p  + myPars# or xlim(0,3.2e3) + ylim(-10, 3.5e3) 
}

