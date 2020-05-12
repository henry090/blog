
# git add -A && git commit -m 'staging all files'
file.remove(list.files('docs',include.dirs = TRUE,full.names = TRUE))
unlink("docs/posts", recursive = TRUE)  
unlink("docs/site_libs", recursive = TRUE) 

# dependecies 
pkgs = renv::dependencies(path = '_posts',errors = 'ignored', dev = TRUE)


# run and render posts
files = list.files(path = '_posts', pattern = '.Rmd',recursive = TRUE)

files = paste('_posts',files, sep = '/')

install.packages(unique(pkgs$Package))
install.packages('remotes')
remotes::install_github("JohnCoene/echarts4r.suite")

for (i in 1:length(files)) {
  rmarkdown::render(files[i], quiet = TRUE)
  print(paste('Done',i,'post out of',length(files)))
}

rmarkdown::render_site()

