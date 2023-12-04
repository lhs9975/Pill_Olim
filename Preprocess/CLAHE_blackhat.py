# Black Hat / 전처리 최종본

import cv2
import os

# Gray Scale, Histogram Equization, desoise 동시 수행

# 다비드정100mg
input_dir = "E:\\test\\a"

output_dir = "E:\\test\\e"

kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (50, 50))

clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))

for filename in os.listdir(input_dir):
    img_path = os.path.join(input_dir, filename)
    img = cv2.imread(img_path)

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    clahe_img = clahe.apply(gray)

    # Denoise
    # h : 필터의 강도를 결정하는 파라미터, 클수록 노이즈를 더 잘 제거, 단 너무 크면 이미지의 디테일도 제거
    # h값 조절 필요
    denoised = cv2.fastNlMeansDenoising(clahe_img, None, h=10, templateWindowSize=7, searchWindowSize=21)

    blackhat = cv2.morphologyEx(denoised, cv2.MORPH_BLACKHAT, kernel)

    out_path = os.path.join(output_dir, 'bh_' + filename)
    cv2.imwrite(out_path, blackhat)

    print(f"{filename}이 {out_path}에 저장됨")