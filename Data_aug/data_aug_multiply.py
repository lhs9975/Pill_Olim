# 이미지 밝기 조절

import os
import cv2
import imgaug.augmenters as iaa

input_dir = "E:\\Pill Project\\original_data\\david"
output_dir = "E:\\Pill Project\\multiply_data\\david"

# 밝기 조절 1> = 밝아짐, 1< = 어두워짐
aug = iaa.Multiply((0.9, 1.1))


for filename in os.listdir(input_dir):

    img_path = os.path.join(input_dir, filename)
    img = cv2.imread(img_path)

    img_aug = aug(image=img)

    output_path = os.path.join(output_dir, 'multiply' + filename)
    cv2.imwrite(output_path, img_aug)
