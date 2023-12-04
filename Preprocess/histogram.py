import cv2
import os

# Gray Scale 과 Histogram Equization 동시 수행

input_dir = 'E:\\test\\denoise'
output_dir = 'E:\\test\\histo'

for filename in os.listdir(input_dir):
    img_path = os.path.join(input_dir, filename)
    img = cv2.imread(img_path)

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    equ = cv2.equalizeHist(gray)

    out_path = os.path.join(output_dir, 'histogram_' + filename)
    cv2.imwrite(out_path, equ)

    print(f"{filename}이 {out_path}에 저장됨")
