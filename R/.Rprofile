# Manual-Browser   
if(interactive()){
  # Use text based web browser to navigate through R docs after help.start()
  # if you cannot run a graphical web browser (e.g. when you are in the
  # Linux console):
  if(Sys.getenv("DISPLAY") == ""){
    if(Sys.getenv("TMUX") != "")
      options(browser = function(u) system(paste0("tmux new-window 'w3m ", u, "'")))
    else if(Sys.getenv("NVIMR_TMPDIR") != "")
      options(browser = function(u) .C("nvimcom_msg_to_nvim",
              paste0('StartTxtBrowser("w3m", "', u, '")')))
  }
}

# CRAN-Mirror
options(repos=structure(c(CRAN="https://ftp.gwdg.de/pub/misc/cran/")))

# Upgrade local packages
#update.packages(lib.loc = "/home/jv/Develop/R/x86_64-pc-linux-gnu-library/")

# preload packages
library("colorout")

# multi-processing
library(parallel)
if( Sys.info()['sysname'] == "Windows" )
{
    library(doParallel)
    registerDoParallel(cores=detectCores())
} else {
    library(doMC)
    registerDoMC(cores=detectCores())
}
