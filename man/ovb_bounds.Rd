% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ovb_bounds.R
\name{ovb_bounds}
\alias{ovb_bounds}
\alias{ovb_bounds.lm}
\title{Bounds on the strength of unobserved confounders using observed covariates}
\usage{
ovb_bounds(...)

\method{ovb_bounds}{lm}(model, treatment, benchmark_covariates, kd = 1,
  ky = kd, reduce = TRUE, bound = c("partial r2", "partial r2 no D",
  "total r2"), adjusted_estimates = TRUE, ci_alpha = 0.05, ...)
}
\arguments{
\item{...}{arguments passed to other methods. First argument should either be an \code{\link{lm}} model with the
outcome regression, or a \code{\link{formula}} describing the model along
with the \code{\link{data.frame}} containing the variables of the model.}

\item{model}{An \code{lm} object with the outcome regression.}

\item{treatment}{A character vector with the name of the treatment variable
of the model.}

\item{benchmark_covariates}{a character vector of the names of covariates that will be used to bound the plausible strength
of the unobserved confounders.}

\item{kd}{numeric vector. Parameterizes how many times stronger the confounder is related to the treatment in comparison to the observed benchmark covariate.
Default value is \code{1} (confounder is as strong as benchmark covariate).}

\item{ky}{numeric vector. Parameterizes how many times stronger the confounder is related to the outcome in comparison to the observed benchmark covariate.
Default value is the same as \code{kd}.}

\item{reduce}{Should the bias adjustment reduce or increase the
absolute value of the estimated coefficient? Default is \code{TRUE}.}

\item{bound}{type of bounding procedure. Currently only \code{"partial r2"} is implemented.}

\item{adjusted_estimates}{should the bounder also compute the adjusted estimates?}

\item{ci_alpha}{significance level for computing the adjusted confidence intervals.
Default is \code{TRUE}.}
}
\value{
The function returns a \code{\link{data.frame}} with the bounds on the strength of the unobserved confounder
as well with the adjusted point estimates, standard errors and t-values (optional, controlled by argument \code{adjusted_estimates}).
}
\description{
Bounds on the strength of unobserved confounders using observed covariates, as in Cinelli and Hazlett (2020).
}
\details{
Currently it implements only the bounds based on partial R2. Other bounds will be implemented soon.
}
\examples{

# runs regression model
model <- lm(peacefactor ~ directlyharmed + age + farmer_dar + herder_dar +
             pastvoted + hhsize_darfur + female + village, data = darfur)

# bounds on the strength of confounders 1, 2, or 3 times as strong as female
# and 1,2, or 3 times as strong as pastvoted
ovb_bounds(model, treatment = "directlyharmed",
          benchmark_covariates = c("female", "pastvoted"),
          kd = 1:3)

}
\references{
Cinelli, C. and Hazlett, C. (2020), "Making Sense of Sensitivity: Extending Omitted Variable Bias." Journal of the Royal Statistical Society, Series B.
}
