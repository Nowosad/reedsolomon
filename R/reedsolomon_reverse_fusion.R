#' Reversal of Reed-Solomon Pixel-Level Algorithm for Remote Sensing Data Fusion
#'
#' @param x SpatRaster, the output of [reedsolomon_fusion()]
#' @param a Maximum theoretical number of categories (integer values)
#' @param k Expected number of raster layers
#' @param ... Other parameters of [terra::app()]
#'
#' @return SpatRaster
#' @export
#'
#' @examples
#' library(terra)
#' s1 = rast(system.file("ex/logo.tif", package = "terra"))
#' plot(s1)
#'
#' r1 = reedsolomon_fusion(s1, a = 256)
#' plot(r1)
#'
#' rev_r1 = reedsolomon_reverse_fusion(r1, a = 256, k = 3)
#' all.equal(values(s1), values(rev_r1))
reedsolomon_reverse_fusion = function(x, a, k, ...){
  terra::app(x, resursive_modulo, a, k, ...)
}
resursive_modulo = function(v, a, k){
  result = matrix(nrow = k, ncol = length(v))
  result[1, ] = v %% a
  for (i in seq_len(k)[-1]){
    v = (v %/% a)
    result[i, ] = v %% a
  }
  return(result)
}
