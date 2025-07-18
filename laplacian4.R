library(EBImage)

# Load image
img_path <- "C:/Users/USER/Downloads/Beirut/AOI/AOI/Pre.tif"
input_image <- readImage(img_path)

# Convert to grayscale
gray_img <- channel(input_image, "gray")

# Apply laplacian filter
laplacian4 <- filter2(gray_img, matrix(c(0, -1, 0,
                                      -1,  4,  -1,
                                      0,  -1,  0), nrow = 3, byrow = TRUE))

# View result
display(laplacian4, title = "laplacian Filter Output")

# Save output 
writeImage(sobel_y, "C:/Users/USER/Downloads/sobel_y_outputpost.tif")
