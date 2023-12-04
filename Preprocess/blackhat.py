# Black Hat / 전처리 최종본
import cv2
import os

# Gray Scale, Denoise, Histogram Equization, Blackhat 동시 수행
input_dir = 'E:\\test\\rembg'
output_dir = 'E:\\test\\blackhat'

# 값 범위 조절 필요, 커널의 모형으로 MORPH_RECT = 직사각형
kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (50, 50))

for filename in os.listdir(input_dir):
    img_path = os.path.join(input_dir, filename)
    img = cv2.imread(img_path, cv2.IMREAD_COLOR)

    # Gray Scale
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # Denoise
    # h : 필터의 강도를 결정하는 파라미터, 클수록 노이즈를 더 잘 제거, 단 너무 크면 이미지의 디테일도 제거, h값 조절 필요
    denoised = cv2.GaussianBlur(gray, (5, 5), 0)

    # histogram equalization
    equ = cv2.equalizeHist(denoised)

    blackhat = cv2.morphologyEx(equ, cv2.MORPH_BLACKHAT, kernel)

    out_path = os.path.join(output_dir, 'bh_' + filename)
    cv2.imwrite(out_path, blackhat)

    print(f"{filename}이 {out_path}에 저장됨")
