
<!-- README.md is generated from README.Rmd. Please edit that file -->

# reedsolomon

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/Nowosad/reedsolomon/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Nowosad/reedsolomon/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of {reedsolomon} is to apply the Reed-Solomon algorithm on
remote sensing data. It allows using Reed-Solomon algorithm for data
fusion (turning many raster layers into one) and performing reverse
transformation (Werner (2020)).

## Installation

You can install the development version of {reedsolomon} from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("Nowosad/reedsolomon")
```

## Example

``` r
library(terra)
#> terra 1.6.46
s1 = rast(system.file("ex/logo.tif", package = "terra"))
plot(s1, 1:3, nr = 1)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

``` r
library(reedsolomon)
r1 = reedsolomon_fusion(s1)
plot(r1)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

``` r
s2 = reedsolomon_reverse_fusion(r1, a = 256, k = 3)
plot(s2, 1:3, nr = 1)
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

## References

- Werner, P. A. (2020). Application of the Reed-Solomon Algorithm as a
  Remote Sensing Data Fusion Tool for Land Use Studies. Algorithms,
  13(8), 188. MDPI AG. Retrieved from
  <http://dx.doi.org/10.3390/a13080188>

## Contribution

Contributions to this package are welcome - let us know if you have any
suggestions or spotted a bug. The preferred method of contribution is
through a GitHub pull request. Feel also free to contact us by creating
[an issue](https://github.com/nowosad/bespatial/issues).
