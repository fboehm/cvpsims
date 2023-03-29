#' Assemble pgs 
#' 
#' @param pgs_stem a character vector of the file name stem for the pgs files, which are typically the outputs from plink score allele command.
#' @param chr_vec an integer vector indicating the chromosome numbers to be included in the pgs
#' 

assemble_pgs <- function(pgs_stem, chr_vec){

    for (chr_num in chr_vec){
        pgs_fn <- paste0(pgs_stem, "_chr", chr_num, "_best.dbslmm.txt.profile")
        pgs <- readr::read_table(pgs_fn)
        if (chr_num == 1){
            ss[[chr_num]] <- out2[[chr_num]] %>%
                dplyr::select(1, 6)  # choose only the SCORESUM column, unless it's chr1
            colnames(ss[[chr_num]])[2] <- paste0(colnames(ss[[chr_num]])[2], "_chr", chr_num) 
        } else {
            ss[[chr_num]] <- out2[[cross_num]][[chr_num]] %>%
                dplyr::select(6)  # choose only the SCORESUM column
            colnames(ss[[chr_num]]) <- paste0(colnames(ss[[chr_num]]), "_chr", chr_num) 
        }
    }
}