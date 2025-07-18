library(EBImage)

# Load image
img_path <- "C:/Users/USER/Downloads/Beirut/AOI/AOI/Pre.tif"
input_image <- readImage(img_path)

# Convert to grayscale
gray_img <- channel(input_image, "gray")

# Apply Sobel filter
sobel_x <- filter2(gray_img, matrix(c(-1, 0, 1,
                                      -2,  0,  2,
                                      -1,  0,  1), nrow = 3, byrow = TRUE))

# View result
display(sobel_x, title = "Sobel Y Filter Output")

# Save output
writeImage(sobel_y, "C:/Users/USER/Downloads/sobel_y_outputpost.tif")
