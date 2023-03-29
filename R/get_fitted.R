#' Get specified entry (index) from a vector (vec)
#' 
#' @param index Index of the entry to be returned. Must be a single positive integer less than or equal to length(vec)
#' @param vec Vector from which the entry is to be returned
#' @return a single element of the inputted vector
#' @export
#' @examples
#' get_fitted(1, c(1,2,3))

get_fitted <- function(index, vec){
    stopifnot(length(index) == 1)
    stopifnot(length(vec) > 0)
    if (index > length(vec)){ 
        stop("Index out of bounds", call. = FALSE)
    }
    return(vec[index])
}
