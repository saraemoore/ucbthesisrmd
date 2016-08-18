#' UC Berkeley thesis format.
#'
#' Format for creating a University of California, Berkeley thesis or dissertation PDF document.
#' Adapted from
#' \href{https://math.berkeley.edu/~vojta/tex/ucbthesis-phd.html}{https://math.berkeley.edu/~vojta/tex/ucbthesis-phd.html} and
#' \href{https://math.berkeley.edu/~vojta/tex/ucbthesis-masters.html}{https://math.berkeley.edu/~vojta/tex/ucbthesis-masters.html}.
#' See the Graduate Division's formatting rules for theses (http://grad.berkeley.edu/academic-progress/thesis/)
#' and dissertations (http://grad.berkeley.edu/academic-progress/dissertation/) for more information.
#'
#' @param fig_width Default width (in inches) for figures.
#' @param fig_height Default width (in inches) for figures.
#' @param highlight Syntax highlighting style.
#' @param citation_package The LaTeX package to process citations, \code{natbib} or \code{biblatex}. The default in the R Markdown ucbthesis format is \code{biblatex}.
#' @param ... Other arguments to \code{rmarkdown::pdf_document}.
#' @inheritParams rmarkdown::pdf_document
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#'
#' \dontrun{
#' rmarkdown::draft("my_thesis.Rmd", template = "ucbthesis", package = "ucbthesisrmd")
#' }
#'
#' @export
ucbthesis <- function(fig_width = 7, fig_height = 5,
	highlight = "pygments", citation_package = c("biblatex", "natbib"),
	...) {

	citation_package <- match.arg(citation_package)
	rmarkdown::pdf_document(fig_width = fig_width,
		fig_height = fig_height, highlight = highlight,
		template = system.file("rmarkdown", "templates", "ucbthesis", "resources", "template.tex",
			package = "ucbthesisrmd", mustWork = TRUE),
		latex_engine = "xelatex",
		citation_package = citation_package,
		...)
}
