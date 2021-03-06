#' Data frame of cis-eQTLs from GTEx study (version 6p)
#'
#' Gene expression - SNP associations from 27094 gene names and 44 tissues. Obtained from \url{http://www.gtexportal.org/home/}.
#' These data only include associations that GTEx labelled as \code{is_choson_snp}.
#'
#' @format A data frame with 280630 rows and 11 columns
#'	\describe{
#'		\item{gene_name}{Gene name}
#'		\item{tissue}{Tissue}
#'		\item{gene_start}{Gene chromosome : gene start position (b37)}
#'		\item{SNP}{SNP rs ID}
#'		\item{snp_position}{SNP chromosome : SNP position (b37)}
#'		\item{effect_allele}{Effect allele}
#'		\item{other_allele}{Non effect allele}
#'		\item{beta}{Effect size}
#'		\item{se}{Standard error}
#'		\item{pval}{p-value}
#'		\item{n}{samplesize}
#'	}
#'
#' @source \url{https://scmv-ieugit.epi.bris.ac.uk/gh13047/gtex_data}
"gtex_eqtl"
