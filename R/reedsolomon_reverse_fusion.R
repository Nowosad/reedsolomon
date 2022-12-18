# x = r1
# k = 4
# a = 256
#
# reedsolomon_reverse_fusion = function(x, a, k, ...){
#   empty_rast = rast(x, nlyrs = k)
#   x2 = x[50, 50][[1]]
#   x2%%a
#
#   xx = app(x, resursive_modulo, seq_k = seq_len(k), a = a)
# }
#
# resursive_modulo = function(v, seq_k, a){
#   result = vector(mode = "numeric", length = max(seq_k))
#   result[[1]] = v%%a
#   for (i in seq_k[-1]){
#     result[[i]] = result[[i - 1]] %% a
#   }
#   return(result)
# }
#
#
#
# plot(x)
# y = predict(x, model = NULL, fun = function(x) x + 1)
#
