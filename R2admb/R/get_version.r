##' Query ADMB version
##'
##' Report on the version of ADMB being used.
##'
##' @return Prints the version string from a compiled ADMB file, and returns the value (invisibly) as a character vector
##' @export
##' @author Ben Bolker
##' @keywords misc
##' @examples
##' admb_version()
admb_version <- function() {
    owd <- setwd(tempdir())
    on.exit(setwd(owd))
    file.copy(system.file("tplfiles","testversion.tpl",package="R2admb"),".")
    compile_admb("testversion")
    s1 <- system("./testversion --version",intern=TRUE)
    cat(ret <- s1[3:5],sep="\n")
    invisible(ret)
}
