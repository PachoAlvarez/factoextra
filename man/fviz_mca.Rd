% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/fviz_mca.R
\name{fviz_mca}
\alias{fviz_mca}
\alias{fviz_mca_biplot}
\alias{fviz_mca_ind}
\alias{fviz_mca_var}
\title{Visualize Multiple Correspondence Analysis}
\usage{
fviz_mca_ind(X, axes = c(1, 2), geom = c("point", "text"), label = "all",
  invisible = "none", labelsize = 4, pointsize = 2, habillage = "none",
  addEllipses = FALSE, ellipse.level = 0.95, col.ind = "blue",
  col.ind.sup = "darkblue", alpha.ind = 1, shape.ind = 19,
  select.ind = list(name = NULL, cos2 = NULL, contrib = NULL),
  map = "symmetric", ...)

fviz_mca_var(X, axes = c(1, 2), geom = c("point", "text"), label = "all",
  invisible = "none", labelsize = 4, pointsize = 2, col.var = "red",
  alpha.var = 1, shape.var = 17, col.quanti.sup = "blue",
  col.quali.sup = "darkgreen", select.var = list(name = NULL, cos2 = NULL,
  contrib = NULL), map = "symmetric")

fviz_mca_biplot(X, axes = c(1, 2), geom = c("point", "text"),
  label = "all", invisible = "none", labelsize = 4, pointsize = 2,
  habillage = "none", addEllipses = FALSE, ellipse.level = 0.95,
  col.ind = "blue", col.ind.sup = "darkblue", alpha.ind = 1,
  col.var = "red", alpha.var = 1, col.quanti.sup = "blue",
  col.quali.sup = "darkgreen", shape.ind = 19, shape.var = 17,
  select.var = list(name = NULL, cos2 = NULL, contrib = NULL),
  select.ind = list(name = NULL, cos2 = NULL, contrib = NULL),
  map = "symmetric", arrows = c(FALSE, FALSE), ...)

fviz_mca(X, ...)
}
\arguments{
\item{X}{an object of class MCA [FactoMineR], acm [ade4].}

\item{axes}{a numeric vector of length 2 specifying the dimensions to be plotted.}

\item{geom}{a text specifying the geometry to be used for the graph.
Allowed values are the combination of c("point", "arrow", "text").
Use "point" (to show only points);
"text" to show only labels; c("point", "text") or c("arrow", "text") to show both types.}

\item{label}{a text specifying the elements to be labelled.
 Default value is "all".
 Allowed values are "none" or the combination of c("ind", "ind.sup","var", "quali.sup",  "quanti.sup").
 "ind" can be used to label only active individuals.
 "ind.sup" is for supplementary individuals.
"var" is for active variable categories.
 "quali.sup" is for supplementary qualitative variable categories.
"quanti.sup" is for quantitative supplementary variables.}

\item{invisible}{a text specifying the elements to be hidden on the plot.
Default value is "none".
Allowed values are the combination of c("ind", "ind.sup","var", "quali.sup",  "quanti.sup").}

\item{labelsize}{font size for the labels}

\item{pointsize}{the size of points}

\item{habillage}{an optional factor variable for coloring
the observations by groups. Default value is "none".
If X is an MCA object from FactoMineR package, habillage can also specify
the index of the factor variable in the data.}

\item{addEllipses}{logical value.
If TRUE, draws ellipses around the individuals when habillage != "none".}

\item{ellipse.level}{the size of the concentration ellipse in normal probability}

\item{col.ind,col.var}{color for individuals and variables, respectively.
Possible values include also : "cos2", "contrib", "coord", "x" or "y".
In this case, the colors for individuals/variables are automatically controlled by their qualities ("cos2"),
contributions ("contrib"), coordinates (x^2 + y^2 , "coord"), x values("x") or y values("y").
To use automatic coloring (by cos2, contrib, ....), make sure that habillage ="none".}

\item{col.ind.sup}{color for supplementary individuals}

\item{alpha.ind,alpha.var}{controls the transparency of
 individual and variable colors, respectively.
The value can variate from 0 (total transparency) to 1 (no transparency).
Default value is 1. Possible values include also : "cos2", "contrib", "coord", "x" or "y".
 In this case, the transparency for individual/variable colors are automatically controlled by their qualities ("cos2"),
 contributions ("contrib"), coordinates (x^2 + y^2 , "coord"), x values("x") or y values("y").
 To use this, make sure that habillage ="none".}

\item{shape.ind,shape.var}{point shapes of individuals and variables}

\item{select.ind,select.var}{a selection of individuals/variables to be drawn.
Allowed values are NULL or a list containing the arguments name, cos2 or contrib:
\itemize{
\item name is a character vector containing individuals/variables to be drawn
\item cos2 if cos2 is in [0, 1], ex: 0.6, then individuals/variables with a cos2 > 0.6 are drawn.
if cos2 > 1, ex: 5, then the top 5 individuals/variables with the highest cos2 are drawn.
\item contrib if contrib > 1, ex: 5,  then the top 5 individuals/variables with the highest cos2 are drawn
}}

\item{map}{character string specifying the map type. Allowed options include:
"symmetric", "rowprincipal", "colprincipal", "symbiplot", "rowgab",
"colgab", "rowgreen" and "colgreen". See details}

\item{...}{Arguments to be passed to the function fviz_mca_biplot()}

\item{col.quanti.sup,col.quali.sup}{a color for the quantitative/qualitative supplementary variables.}

\item{arrows}{Vector of two logicals specifying if the plot should contain
points (FALSE, default) or arrows (TRUE).
First value sets the rows and the second value sets the columns.}
}
\value{
a ggplot2 plot
}
\description{
Graph of individuals/variables from the output of Multiple Correspondence Analysis (MCA).\cr\cr
\itemize{
\item{fviz_mca_ind(): Graph of individuals}
\item{fviz_mca_var(): Graph of variables}
\item{fviz_mca_biplot(): Biplot of individuals and variables}
\item{fviz_mca(): An alias of fviz_mca_biplot()}
}
}
\details{
The default plot of MCA is a "symmetric" plot in which both rows and
columns are in principal coordinates. In this situation, it's not possible
to interpret the distance between row points and column points. To overcome this
problem, the simplest way is to make an asymmetric plot. This means that,
the column profiles must be presented in row space or vice-versa.
The allowed options for the argument map are:
\itemize{
\item "rowprincipal" or "colprincipal": asymmetric plots with either rows in principal
coordinates and columns in standard coordinates, or vice versa.
These plots preserve row metric or column metric respectively.
\item "symbiplot": Both rows and columns are scaled to have variances
equal to the singular values (square roots of eigenvalues),
which gives a symmetric biplot but does not preserve row or column metrics.
\item "rowgab" or "colgab": Asymmetric maps, proposed by Gabriel & Odoroff (1990),
with rows (respectively, columns) in
principal coordinates and columns (respectively, rows) in standard coordinates
multiplied by the mass of the corresponding point.
\item "rowgreen" or "colgreen": The so-called contribution biplots
showing visually the most contributing points (Greenacre 2006b).
These are similar to "rowgab" and "colgab" except that the points
in standard coordinates are multiplied by the square root of the corresponding masses,
giving reconstructions of the standardized residuals.
}
}
\examples{
\donttest{
# Multiple Correspondence Analysis
# ++++++++++++++++++++++++++++++
# Install and load FactoMineR to compute MCA
# install.packages("FactoMineR")
library("FactoMineR")
data(poison)
poison.active <- poison[1:55, 5:15]
head(poison.active)
res.mca <- MCA(poison.active, graph=FALSE)

# Graph of individuals
# +++++++++++++++++++++
# Default plot
fviz_mca_ind(res.mca)
# Change title and axis labels
fviz_mca_ind(res.mca) +
 labs(title = "MCA", x = "Dim.1", y ="Dim.2" )
# Change axis limits by specifying the min and max
fviz_mca_ind(res.mca) +
   xlim(-0.8, 1.5) + ylim (-1.5, 1.5)
# Use text only
fviz_mca_ind(res.mca, geom = "text")
# Use points only
fviz_mca_ind(res.mca, geom="point")
# Change the size of points
fviz_mca_ind(res.mca, geom="point", pointsize = 4)
# Change point color and theme
fviz_mca_ind(res.mca, col.ind = "blue")+
   theme_minimal()

# Control automatically the color of individuals
# using the cos2 or the contributions
# cos2 = the quality of the individuals on the factor map
fviz_mca_ind(res.mca, col.ind="cos2")
# Gradient color
fviz_mca_ind(res.mca, col.ind="cos2") +
      scale_color_gradient2(low="white", mid="blue",
      high="red", midpoint=0.4)
# Change the theme and use only points
fviz_mca_ind(res.mca, col.ind="cos2", geom = "point") +
      scale_color_gradient2(low="white", mid="blue",
      high="red", midpoint=0.4)+ theme_minimal()

# Color by the contributions
fviz_mca_ind(res.mca, col.ind="contrib") +
      scale_color_gradient2(low="white", mid="blue",
      high="red", midpoint=1.5)

# Control the transparency of the color by the
# contributions
fviz_mca_ind(res.mca, alpha.ind="contrib") +
     theme_minimal()

# Color individuals by groups
grp <- as.factor(poison.active[, "Vomiting"])
fviz_mca_ind(res.mca, label="none", habillage=grp)
# Add ellipses
p <- fviz_mca_ind(res.mca, label="none", habillage=grp,
             addEllipses=TRUE, ellipse.level=0.95)
print(p)
# Change group colors using RColorBrewer color palettes
p + scale_color_brewer(palette="Dark2") +
   theme_minimal()
p + scale_color_brewer(palette="Paired") +
     theme_minimal()
p + scale_color_brewer(palette="Set1") +
     theme_minimal()

# Select and visualize individuals with cos2 >= 0.4
fviz_mca_ind(res.mca, select.ind = list(cos2 = 0.4))
# Select the top 20 according to the cos2
fviz_mca_ind(res.mca, select.ind = list(cos2 = 20))
# Select the top 20 contributing individuals
fviz_mca_ind(res.mca, select.ind = list(contrib = 20))
# Select by names
fviz_mca_ind(res.mca,
select.ind = list(name = c("44", "38", "53",  "39")))


# Graph of variable categories
# ++++++++++++++++++++++++++++
# Default plot
fviz_mca_var(res.mca)
# Change color and theme
fviz_mca_var(res.mca, col.var="steelblue")+
 theme_minimal()

# Control variable colors using their contributions
fviz_mca_var(res.mca, col.var = "contrib")+
 scale_color_gradient2(low = "white", mid = "blue",
           high = "red", midpoint = 2) +
 theme_minimal()
# Control the transparency of variables using their contributions
fviz_mca_var(res.mca, alpha.var = "contrib") +
   theme_minimal()

# Select and visualize categories with cos2 >= 0.4
fviz_mca_var(res.mca, select.var = list(cos2 = 0.4))
# Select the top 10 contributing variable categories
fviz_mca_var(res.mca, select.var = list(contrib = 10))
# Select by names
fviz_mca_var(res.mca,
 select.var= list(name = c("Courg_n", "Fever_y", "Fever_n")))

# biplot
# ++++++++++++++++++++++++++
fviz_mca_biplot(res.mca)
# Keep only the labels for variable categories
fviz_mca_biplot(res.mca, label ="var")
# Keep only labels for individuals
fviz_mca_biplot(res.mca, label ="ind")
# Hide variable categories
fviz_mca_biplot(res.mca, invisible ="var")
# Hide individuals
fviz_mca_biplot(res.mca, invisible ="ind")
# Control automatically the color of individuals using the cos2
fviz_mca_biplot(res.mca, label ="var", col.ind="cos2") +
       theme_minimal()
# Change the color by groups, add ellipses
fviz_mca_biplot(res.mca, label="var", col.var ="blue",
   habillage=grp, addEllipses=TRUE, ellipse.level=0.95) +
   theme_minimal()

# Select the top 30 contributing individuals
# And the top 10 variables
fviz_mca_biplot(res.mca,
               select.ind = list(contrib = 30),
               select.var = list(contrib = 10))

 }
}
\author{
Alboukadel Kassambara \email{alboukadel.kassambara@gmail.com}
}
\references{
http://www.sthda.com
}

