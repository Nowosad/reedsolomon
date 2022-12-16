#' Reed-Solomon Pixel-Level Algorithm for Remote Sensing Data Fusion
#'
#' @param x SpatRaster
#' @param a
#' @param stretch TRUE/FALSE
#' @param ...
#'
#' @return SpatRaster
#' @export
#'
#' @references Werner, P. A. (2020). Application of the Reed-Solomon Algorithm as a Remote Sensing Data Fusion Tool for Land Use Studies. Algorithms, 13(8), 188. MDPI AG. Retrieved from http://dx.doi.org/10.3390/a13080188
#'
#' @examples
#' library(terra)
#' s1 = rast(system.file("ex/logo.tif", package = "terra"))
#' plot(s1)
#'
#' r1 = reedsolomon(s1)
#' plot(r1)
#'
#' s2 = s1 * 1.21
#' r2 = reedsolomon(s2)
#' s3 = s1 - 100
#' r3 = reedsolomon(s3)
reedsolomon = function(x, a, stretch = FALSE, ...){
  if (!all(terra::is.int(x))){
    warning("Input 'x' should contain integer values. Results may not be correct")
  }
  if (!all(terra::global(x, "min") >= 0)){
    warning("Input 'x' should contain positive values. Results may not be correct")
  }
  if (stretch){
    x = terra::stretch(x, ...)
  }
  if (missing(a)){
    a = max(terra::global(x, "max") - terra::global(x, "min") + 1)
  }
  r = terra::app(x, reedsolomon_single, a, ...)
  names(r) = "reedsolomon"
  return(r)
}
reedsolomon_single = function(s, a){
  sum(s * (a ^ seq_along(s)))
}

