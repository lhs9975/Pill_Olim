# 이미지 회전

import imgaug.augmenters as iaa
import os
import cv2

input_dir = 'E:\\test\\f_1'
output_dir = 'E:\\test\\f'

if not os.path.exists(output_dir):
    os.makedirs(output_dir)

rotate_aug = iaa.Affine(rotate=(-10, 10))

for filename in os.listdir(input_dir):
    if filename.endswith('.jpg') or filename.endswith('.png'):
        img_path = os.path.join(input_dir, filename)
        img = cv2.imread(img_path)


        for i in range(20):
            rotated_img = rotate_aug.augment_image(img)
            output_path = os.path.join(output_dir, f'{"rotate"[:4]}_{i}.jpg')
            cv2.imwrite(output_path, rotated_img)

print(f"{filename}이 {output_path}에 저장됨")