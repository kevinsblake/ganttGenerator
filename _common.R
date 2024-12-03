
### Load packages --------------------------------------------------------------
# devtools::install_github("giocomai/ganttrify")
library("ganttrify")
library("readxl")
library("ggplot2")

### Helper functions -----------------------------------------------------------

export_plot <- function(plot, fname, w, h, fmt=c("pdf", "png")) {
  
  fname.pdf <- stringr::str_interp("${out.path}/${fln.prfx}-${fname}.pdf")
  fname.png <- stringr::str_interp("${out.path}/${fln.prfx}-${fname}.png")
  
  if (missing(fmt)){
    fmt <- "pdf"
  }
  if (fmt == "pdf") {
    save <- ggsave(plot, filename=fname.pdf, device=cairo_pdf, width=w, height=h)
  }
  if (fmt == "png") {
    save <- ggsave(plot, filename=fname.png, device=png, width=w, height=h)
  }
  
  return(save)
}


# ### Directory structure --------------------------------------------------------
# 
# cur.date <- format(Sys.Date(), "%y%m%d")
# fln.prfx <- stringr::str_interp("${cur.date}")
# main.dir <- file.path(getwd(), "reports")
# 
# ## Provide the dir name to create under main dir:
# out.path <- file.path(main.dir, fln.prfx)
# 
# if (!dir.exists(out.path)){
#   dir.create(out.path)
# } else {
#   print("output dir already exists!")
# }