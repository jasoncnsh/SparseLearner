% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/Bolasso.R
\name{Bolasso}
\alias{Bolasso}
\title{Bolasso model.}
\description{
This function performs a Bolasso logistic regression model and produces an optimal set of predictors.
}
\usage{
Bolasso(x, y, BM = 100, kfold = 10, seed = 0123)
}
\arguments{
\item{x}{predictor matrix.}

\item{y}{response variable, a factor object with values of 0 and 1.}

\item{BM}{the number of bootstrapping, with the default value 100.}

\item{kfold}{the number of folds of cross validation - default is 10. Although kfold 
can be as large as the sample size (leave-one-out CV), it is not recommended for 
large datasets. Smallest value allowable is kfold=3.}

\item{seed}{the seed for random sampling, with the default value 0123.}
}
\details{
This function runs the LASSO logistic regression model using several bootstrap 
samples of the original data, and then intersects the non-zero coefficients for 
estimating consistent coefficients. A specific value of BM parameter should be 
supplied, however BM=100 is proposed by default. Users can reduce the running 
time by using 3-fold CV, but the proposed 10-fold CV is assumed by default. 
}
\value{
\item{BM}{the number of bootstrapping in this procedure.}

\item{var.selected}{significant variables that are selected by the Bolasso model.}
}
\references{
[1] Friedman, J., Hastie, T. and Tibshirani, R. (2008). Regularization Paths for Generalized 
Linear Models via Coordinate Descent. Journal of Statistical Software, 33(1), 1-22.

[2] Bach, F.R. (2008). Bolasso: model consistent lasso estimation through the bootstrap. 
Proceedings of the 25th international conference on Machine learning. ACM. pp. 33:40.
}
\examples{
library(datasets)
head(iris)
X <- as.matrix(subset(iris, iris$Species!="setosa")[, -5])
Y <- as.factor(ifelse(subset(iris, iris$Species!="setosa")[, 5]=='versicolor', 0, 1))
# Fit a Bolasso logistic regression model
# The BM parameter in the following example is set as small value to reduce
# the running time, however the default value is proposed
Bolasso.fit <- Bolasso(x=X, y=Y, BM=5, seed=0123)
# Significant variables that are selected by the Bolasso model
Bolasso.fit$var.selected
}
