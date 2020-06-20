.onAttach <- function(libname, pkgname) {

	a <- suppressWarnings(try(readLines("https://raw.githubusercontent.com/MRCIEU/MRInstruments/master/DESCRIPTION"), silent=TRUE))

	if(!class(a) == 'try-error')
	{
		latest <- gsub("Version: ", "", a[grep("Version", a)])
		current = utils::packageDescription('MRInstruments')

		test <- utils::compareVersion(latest, current$Version)
		if(test == 1)
		{
			packageStartupMessage("\nWarning:\nYou are running an old version of the MRInstruments package.\n",
				"This version:   ", current$Version, "\n",
				"Latest version: ", latest, "\n",
				"Please consider updating using devtools::install_github('MRCIEU/MRInstruments')")
		}
	}
	invisible()
}