

# dependecies 
pkgs = renv::dependencies(path = '_posts',errors = 'ignored', dev = TRUE)


# run and render posts
files = list.files(path = '_posts', pattern = '.Rmd',recursive = TRUE)

files = paste('_posts',files, sep = '/')

install.packages(unique(pkgs$Package))

for (i in 1:length(files)) {
  rmarkdown::render(files[i],quiet = TRUE)
  print(paste('Done',i,'post out of',length(files)))
}

rmarkdown::render_site()
