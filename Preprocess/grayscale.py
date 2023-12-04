import os
import cv2

# dir_path_i = 입력 이미지 폴더 경로
# dir_path_o = 출력 이미지 폴더 경로
dir_path_i = 'E:\\test\\rembg'
dir_path_o = 'E:\\test\\gray'

for filename in os.listdir(dir_path_i):
    if filename.endswith('.jpg') or filename.endswith('.png'):
        img = cv2.imread(os.path.join(dir_path_i, filename),
                         cv2.IMREAD_GRAYSCALE)

        cv2.imwrite(os.path.join(dir_path_o, 'gray_' + filename), img)

print(f"{filename}이 {dir_path_o}에 저장됨")
