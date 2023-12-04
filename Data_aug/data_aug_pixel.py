import os
import cv2
import imgaug.augmenters as iaa

input_dir = "C:\\Users\\LEE\\Desktop\\new"
output_dir = "C:\\Users\\LEE\\Desktop\\new1"

resize_augmenter = iaa.Resize((224, 224))

for filename in os.listdir(input_dir):
    input_path = os.path.join(input_dir, filename)

    image = cv2.imread(input_path)

    resized_image = resize_augmenter.augment_image(image)

    output_path = os.path.join(output_dir, filename)
    cv2.imwrite(output_path, resized_image)
