# denoise 전처리

import cv2
import os

# Gray Scale, Histogram Equization, desoise 동시 수행

input_dir = "D:\\pill\\image\\three\\bgrm"

output_dir = "D:\\pill\\image\\three\\denoise"

for filename in os.listdir(input_dir):
    # Load the image
    img_path = os.path.join(input_dir, filename)
    img = cv2.imread(img_path)

    # Convert the image to grayscale
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # Apply histogram equalization
    equ = cv2.equalizeHist(gray)

    # Apply Non-Local Means denoising to the image
    denoised = cv2.fastNlMeansDenoising(
        equ, None, h=20, templateWindowSize=7, searchWindowSize=21)

    # Save the output image
    out_path = os.path.join(output_dir, 'denoise_' + filename)
    cv2.imwrite(out_path, denoised)

    print(f"{filename}이 {out_path}에 저장됨")
