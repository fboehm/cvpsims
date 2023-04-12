#' Assemble pgs from a collection of chromosome-specific pgs files
#' 
#' @param pgs_stem a character vector of the file name stem for the pgs files, which are typically the outputs from plink score allele command.
#' @param chr_vec an integer vector indicating the chromosome numbers to be included in the pgs
#' @param subject_ids_column_number an integer indicating the column number of the subject ids in the pgs files
#' @param score_column_number an integer indicating the column number of the pgs scores in the pgs files
#' @return a data frame with two columns, the first being the subject ids and the second being the pgs scores
#' @export
#' @details 
#' The function reads the PGS files, which are typically outputted by plink score allele. 
#' Each chromosome is assumed to have its own file, and the function reads in each file 
#' and adds the scores together. The function assumes that the subject ids are in the same
#' column in each file, and that the pgs scores are in the same column in each file.
#' The function also assumes that the chromosome-specific pgs files are named in the specified way.

assemble_pgs <- function(pgs_stem, chr_vec, subject_ids_column_number, score_column_number){
    for (chr_num in chr_vec){
        pgs_fn <- paste0(pgs_stem, "_chr", chr_num, "_best.dbslmm.txt.profile")
        pgs <- readr::read_table(pgs_fn)
        if (chr_num == 1){
            ss <- pgs %>%
                dplyr::select(subject_ids_column_number, score_column_number)  # choose only the SCORESUM column, unless it's chr1
        } else {
            ss <- ss %>%
                dplyr::mutate(SCORESUM = SCORESUM + pgs$SCORESUM)
        }
    }
    return(ss)
}

