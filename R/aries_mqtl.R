#' Data frame of mQTLs from ARIES study
#'
#' mQTL analysis was performed in five time points in mothers and children.
#' These data are obtained from \url{http://www.gtexportal.org/home/} (GCTA version).
#'
#' @format A data frame with 187318 rows and 19 columns
#'	\describe{
#'    \item{SNP}{SNP}
#'    \item{timepoint}{timepoint}
#'    \item{cpg}{cpg}
#'    \item{beta}{beta}
#'    \item{pval}{pval}
#'    \item{se}{se}
#'    \item{snp_chr}{snp_chr}
#'    \item{snp_pos}{snp_pos}
#'    \item{effect_allele}{effect_allele}
#'    \item{other_allele}{other_allele}
#'    \item{eaf}{eaf}
#'    \item{sex}{sex}
#'    \item{age}{age}
#'    \item{units}{units}
#'    \item{island_location}{island_location}
#'    \item{cpg_chr}{cpg_chr}
#'    \item{cpg_pos}{cpg_pos}
#'    \item{gene}{gene}
#'    \item{gene_location}{gene_location}
#'    \item{cis_trans}{cis or trans acting mQTL}
#'	}
#'
#' @source \url{http://www.gtexportal.org/home/}
"aries_mqtl"
