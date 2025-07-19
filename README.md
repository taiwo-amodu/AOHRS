# AOHRS
## Object-Based Image Analysis (OBIA) for Beirut Explosion Mapping
### Overview
This project applies Object-Based Image Analysis (OBIA) using QGIS and Orfeo Toolbox (OTB) to map and analyze the damage caused by the Beirut explosion. The goal is to assess changes in land cover—particularly buildings—by comparing pre- and post-event satellite imagery from the Maxar Open Data Portal. The process involves segmentation, classification, and accuracy assessment to quantify the affected area and validate the results.

### Methodology
The workflow began with creating a new shapefile layer for training samples. A minimum of 30 training samples per class was collected to ensure model robustness. Five land cover classes were identified based on visual inspection of the satellite imagery: establishments (buildings), cement/road, bare ground, trees, and water. Each training sample was digitized manually over representative segments of the image.

Next, segmentation was performed using the Large-Scale Mean Shift algorithm from the Orfeo Toolbox. This step divided the image into homogeneous regions based on spectral similarity, forming the basis for object-based classification. After segmentation, the Zonal Statistics tool was used to extract statistical features from the original satellite image using the segmented layer as the zone input.

Following that, the Join Attributes by Location tool was applied, with the statistics layer as the base and the training sample shapefile as the join layer. This step enriched the training data with spectral statistics needed for classification. Then, the TrainVectorClassifier tool was used to build a classification model based on the joined training data. Once the model was created, it was applied to the full segmented dataset using the VectorClassifier tool, resulting in a classified OBIA output.

### Area Calculation
To quantify the affected area, the $area expression was used in QGIS’s Field Calculator to create a new field representing the area of each polygon. However, since the layers were initially in EPSG:4326 (WGS 84), the area values were not in square meters. To correct this, the layer was reprojected into a projected coordinate system—specifically UTM Zone 36N to ensure that area values were correctly expressed in square meters. After this step, the total area for the "establishments" class was calculated. Before the explosion, the total building area was approximately 244,468.45 square meters. After the explosion, it was reduced to around 115,286.23 square meters.

### Accuracy Assessment
For classification accuracy, 100 random validation points were generated across the study area. These points were manually checked against the satellite imagery and used to produce a confusion matrix. The overall accuracy for the pre-explosion classification was 82%, and the accuracy for the post-explosion classification was 76%. These values were computed by comparing the predicted and reference classes at each validation point.
