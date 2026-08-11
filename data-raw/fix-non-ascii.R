# Transliterate the non-ASCII characters that appear in the packaged datasets
# into ASCII equivalents, so that R CMD check does not warn about non-ASCII
# strings in data. Re-run from the package root with:
#
#   Rscript data-raw/fix-non-ascii.R

# Map of every non-ASCII code point currently present in the data.
subs <- c(
	" " = " ",       # no-break space
	" " = " ",       # thin space
	"​" = "",        # zero-width space
	"‐" = "-",       # hyphen
	"‑" = "-",       # non-breaking hyphen
	"–" = "-",       # en dash
	"—" = "-",       # em dash
	"−" = "-",       # minus sign
	"‘" = "'",       # left single quote
	"’" = "'",       # right single quote
	"′" = "'",       # prime
	"“" = "\"",      # left double quote
	"”" = "\"",      # right double quote
	"±" = "+/-",     # plus-minus
	"≤" = "<=",      # less than or equal to
	"≥" = ">=",      # greater than or equal to
	"²" = "2",       # superscript two
	"⁷" = "7",       # superscript seven
	"ﬁ" = "fi",      # fi ligature
	"ﬂ" = "fl",      # fl ligature
	"µ" = "u",       # micro sign (units, e.g. umol/L)
	"μ" = "u",       # greek small mu (units)
	"α" = "alpha",
	"β" = "beta",
	"ε" = "epsilon",
	"τ" = "tau",
	"ö" = "o"
)

to_ascii <- function(x) {
	changed <- grepl("[^\x01-\x7f]", x, perl = TRUE)
	if (!any(changed, na.rm = TRUE)) return(x)
	y <- x[which(changed)]
	for (i in seq_along(subs)) {
		y <- gsub(names(subs)[i], subs[i], y, fixed = TRUE, useBytes = FALSE)
	}
	# Catch-all for anything not covered above, then tidy up the whitespace
	# left behind by no-break spaces.
	y <- iconv(y, "UTF-8", "ASCII//TRANSLIT", sub = "")
	y <- trimws(gsub(" +", " ", y))
	stopifnot(!any(grepl("[^\x01-\x7f]", y, perl = TRUE)))
	Encoding(y) <- "unknown"
	x[which(changed)] <- y
	x
}

fix_object <- function(x) {
	for (cn in names(x)) {
		if (is.factor(x[[cn]])) {
			levels(x[[cn]]) <- to_ascii(levels(x[[cn]]))
		} else if (is.character(x[[cn]])) {
			x[[cn]] <- to_ascii(x[[cn]])
		}
	}
	x
}

for (f in list.files("data", full.names = TRUE)) {
	e <- new.env()
	objs <- load(f, envir = e)
	n_before <- 0
	for (n in objs) {
		x <- get(n, envir = e)
		if (!is.data.frame(x)) next
		n_before <- n_before + sum(vapply(x, function(col) {
			v <- if (is.factor(col)) levels(col) else if (is.character(col)) col else return(0L)
			sum(grepl("[^\x01-\x7f]", v, perl = TRUE))
		}, integer(1)))
		assign(n, fix_object(x), envir = e)
	}
	if (n_before == 0) {
		message(basename(f), ": already ASCII")
		next
	}
	message(basename(f), ": converted ", n_before, " strings")
	save(list = objs, envir = e, file = f, compress = "xz", version = 2)
}

# Use the best available compression for every dataset.
tools::resaveRdaFiles("data", compress = "auto")
print(tools::checkRdaFiles("data"))
