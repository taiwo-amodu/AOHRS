library(raster)

input_image <- stack("C:/Users/USER/Downloads/Beirut/AOI/AOI/Pre.tif")

# Specify filter kernels for X- and Y-direction
KernelX <- matrix(c(-1,0,1,-2,0,2,-1,0,1), nrow = 3, byrow = TRUE)  # define Kernel X
KernelX  # show kernel

KernelY <- matrix(c(1,2,1,0,0,0,-1,-2,-1), nrow = 3, byrow = TRUE)  # define Kernel Y
KernelY  # show Kernel

# Apply both kernels separately using focal() (only summing up the element-wise products)
# Store results (raster layers) in variables SobelX and SobelY
SobelX <- focal(x = input_image[[1]], w = KernelX, fun = sum)
SobelY <- focal(x = input_image[[1]], w = KernelY, fun = sum)

# Compute final result as magnitude of results of both Kernels
Sobel <- sqrt(SobelX^2 + SobelY^2)

# Visualize results
library(mapview)
mapview(Sobel)

# Try Sobel only horizontally
SobelHorizontal <- sqrt(SobelY^2)
mapview(SobelHorizontal)
