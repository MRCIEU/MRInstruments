#' Drug interactions
#'
#' List of drug names and the genes that they target, along with information about how they interact and source of information
#'
#' @format A data frame with 38116 rows and 6 columns
#' \describe{
#'   \item{entrez_gene_symbol}{entrez gene symbol}
#'   \item{gene_long_name}{gene long name}
#'   \item{interaction_claim_source}{interaction claim source}
#'   \item{interaction_types}{interaction types}
#'   \item{drug_name}{drug name}
#'   \item{drug_primary_name}{drug primary name}
#' }
#'
#' @source The "Interactions TSV" at \url{http://dgidb.genome.wustl.edu/downloads}
"drug_interactions"