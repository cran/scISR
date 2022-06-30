## ---- eval=FALSE---------------------------------------------------------
#  # Install devtools package
#  utils::install.packages('devtools')
#  # Install scISR from GitHub
#  devtools::install_github('duct317/scISR')

## ---- eval=FALSE---------------------------------------------------------
#  #Load required library
#  library(scISR)
#  
#  # Load example data (Goolam dataset with reduced number of genes), other dataset can be download from our server at http://scisr.tinnguyen-lab.com/
#  data('Goolam')
#  # Raw data
#  raw <- Goolam$data
#  # Cell types information
#  label <- Goolam$label

## ---- eval=FALSE---------------------------------------------------------
#  # Generating subtyping result
#  set.seed(1)
#  imputed <- scISR(data = raw, ncores = 4)

## ---- eval=FALSE---------------------------------------------------------
#  library(irlba)
#  library(mclust)
#  # Perform PCA and k-means clustering on raw data
#  set.seed(1)
#  # Filter genes that have only zeros from raw data
#  raw_filer <- raw[rowSums(raw != 0) > 0, ]
#  pca_raw <- irlba::prcomp_irlba(t(raw_filer), n = 50)$x
#  cluster_raw <- kmeans(pca_raw, length(unique(label)),
#                        nstart = 2000, iter.max = 2000)$cluster
#  print(paste('ARI of clusters using raw data:', round(adjustedRandIndex(cluster_raw, label),3)))
#  
#  # Perform PCA and k-means clustering on imputed data
#  set.seed(1)
#  pca_imputed <- irlba::prcomp_irlba(t(imputed), n = 50)$x
#  cluster_imputed <- kmeans(pca_imputed, length(unique(label)),
#                            nstart = 2000, iter.max = 2000)$cluster
#  print(paste('ARI of clusters using imputed data:', round(adjustedRandIndex(cluster_imputed, label),3)))

## ---- eval=FALSE---------------------------------------------------------
#  sessionInfo()

