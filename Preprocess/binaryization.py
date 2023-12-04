# 이진화 작업

import os
import cv2

# dir_path_i = 입력 이미지 폴더 경로
# dir_path_o = 출력 이미지 폴더 경로
dir_path_i = 'E:\\200807552'
dir_path_o = 'E:\\test\\1'

for filename in os.listdir(dir_path_i):

    # 디렉터리 내부에 이미지 파일 존재하는지 체크
    if filename.endswith('.jpg') or filename.endswith('.png'):
        # Gray Scale 진행
        img = cv2.imread(os.path.join(dir_path_i, filename),
                         cv2.IMREAD_GRAYSCALE)

        # Thresholding 을 이용한 이진화 진행
        _, binary_img = cv2.threshold(img, 0, 255, cv2.THRESH_BINARY)

        # 이진화 이미지 저장
        cv2.imwrite(os.path.join(dir_path_o, filename), binary_img)

    print(f"{filename}이 {dir_path_o}에 저장됨")
