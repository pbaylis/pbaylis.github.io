---
layout: post
title:  "High dimensional fixed effects in Stata and R"
date:   2014-03-05
categories: econometrics, fixed effects
---

# Notes on packages to estimate high-dimensional FE

## Stata

- reghdfe: Implements and improves algorithm from Guimaraes and Portugal (2010) by porting to mata and avoiding bottlenecks
    + https://github.com/sergiocorreia/reghdfe
    + Arbitrary #s of fixed effects

- twoway: Wolak and Somaini (2014) implement an algorithm that speeds up regression when the FE are non-overlapping and when there are large differences in the number of levels for each FE. 
    + Only 2 sets of *non-overlapping* FE
    + Somewhat buggy, requires dropping missing obs

## R

- felm (package mle): Implements Method of Alternating Projections, per Guire (2013) and Guimaraes and Portugal (2010), who call it the Gauss-Siegel algorithm.
    - Ex.: felm(data = data.df, formula = ln_hedon_score ~ tmean | statecounty_fips + statemonth |0| statecounty_fips))

### Upgrading BLAS 

- Basic Linear Algebra Subprograms: can be upgraded in R to be more efficient
- http://blog.nguyenvq.com/blog/2014/11/10/optimized-r-and-python-standard-blas-vs-atlas-vs-openblas-vs-mkl/
- http://mran.revolutionanalytics.com/download/

## Speed tests

- Right now, twoway > felm > reghdfe, although felm and reghdfe are quite close
    + Twoway is often faster but limited in some situations (see above)
