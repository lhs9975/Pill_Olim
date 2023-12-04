# 위치 조절

import imgaug.augmenters as iaa
import os
import cv2

input_dir = "F:\\Publications\\binary use image"
output_dir = "F:\\Publications\\position image"


# x, y 값 -> x 우측 : 양수, 좌측 : 음수 ||||    y 상 : 음수, 하 : 양수
augmenter1 = iaa.Affine(translate_percent={"x": 0.1, "y": -0.1})

for filename in os.listdir(input_dir):
    
    img = cv2.imread(os.path.join(input_dir, filename))

    img_aug = augmenter1.augment_image(img)

    cv2.imwrite(os.path.join(output_dir, 'po1_' + filename), img_aug)


augmenter2 = iaa.Affine(translate_percent={"x": -0.1, "y": -0.1})

for filename in os.listdir(input_dir):

    img = cv2.imread(os.path.join(input_dir, filename))

    img_aug = augmenter2.augment_image(img)

    cv2.imwrite(os.path.join(output_dir, 'po2_' + filename), img_aug)


augmenter3 = iaa.Affine(translate_percent={"x": 0.1, "y": 0.1})

for filename in os.listdir(input_dir):

    img = cv2.imread(os.path.join(input_dir, filename))

    img_aug = augmenter3.augment_image(img)

    cv2.imwrite(os.path.join(output_dir, 'po3_' + filename), img_aug)


augmenter4 = iaa.Affine(translate_percent={"x": -0.1, "y": 0.1})

for filename in os.listdir(input_dir):

    img = cv2.imread(os.path.join(input_dir, filename))

    img_aug = augmenter4.augment_image(img)

    cv2.imwrite(os.path.join(output_dir, 'po4_' + filename), img_aug)

augmenter5 = iaa.Affine(translate_percent={"x": 0.2, "y": -0.2})

for filename in os.listdir(input_dir):

    img = cv2.imread(os.path.join(input_dir, filename))

    img_aug = augmenter5.augment_image(img)

    cv2.imwrite(os.path.join(output_dir, 'po5_' + filename), img_aug)

augmenter6 = iaa.Affine(translate_percent={"x": -0.2, "y": -0.2})

for filename in os.listdir(input_dir):

    img = cv2.imread(os.path.join(input_dir, filename))

    img_aug = augmenter6.augment_image(img)

    cv2.imwrite(os.path.join(output_dir, 'po6_' + filename), img_aug)

augmenter7 = iaa.Affine(translate_percent={"x": 0.2, "y": 0.2})

for filename in os.listdir(input_dir):

    img = cv2.imread(os.path.join(input_dir, filename))

    img_aug = augmenter7.augment_image(img)

    cv2.imwrite(os.path.join(output_dir, 'po7_' + filename), img_aug)

augmenter8 = iaa.Affine(translate_percent={"x": -0.2, "y": 0.2})

for filename in os.listdir(input_dir):

    img = cv2.imread(os.path.join(input_dir, filename))


    img_aug = augmenter8.augment_image(img)

    cv2.imwrite(os.path.join(output_dir, 'po8_' + filename), img_aug)