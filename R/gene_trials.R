#' Drug trial information regarding target genes
#'
#' The drug trial information comes from PMID 26121088 supplementary table 13.
#' For a number of genes information is provided about diseases for which they are targeted, and the status of the trials in which they were tested.
#'
#' @format A data frame with 19085 rows and 5 columns
#'	\describe{
#'		\item{drug_proxy}{Binary value for whether used as drug proxy}
#'		\item{MeSH1}{MeSH term 1}
#'		\item{MeSH2}{Top MeSH term}
#'		\item{drug_phase}{Phase of drug development}
#'		\item{approved}{Approved in EU or US}
#'  }
#'
#' @source \url{http://www.ncbi.nlm.nih.gov/pubmed/26121088}
"gene_trials"