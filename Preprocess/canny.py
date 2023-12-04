# Canny - 프린팅 각인 알약 적용

import cv2
import os


# 다비드정100mg
input_dir = "F:\\graudate\\Pill Project\\test3"

output_dir = "F:\\graudate\\Pill Project\\test4"

# 값 범위 조절 필요, 커널의 모형으로 MORPH_RECT = 직사각형
kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (50, 50))

for filename in os.listdir(input_dir):
    img_path = os.path.join(input_dir, filename)
    img = cv2.imread(img_path)

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    equ = cv2.equalizeHist(gray)

    # Denoise
    # h : 필터의 강도를 결정하는 파라미터, 클수록 노이즈를 더 잘 제거, 단 너무 크면 이미지의 디테일도 제거
    # h값 조절 필요
    blurred = cv2.GaussianBlur(equ, (5, 5), 0)

    edged = cv2.Canny(blurred, 75, 200, kernel)

    out_path = os.path.join(output_dir, 'cn_' + filename)
    cv2.imwrite(out_path, edged)

    print(f"{filename}이 {out_path}에 저장됨")
