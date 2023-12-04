import cv2

img = cv2.imread(
    'E:\\Pill Project\\blackhat_data\\alle\\bh_rembg_20230530_181242.png')
print(img.shape)  # 이 코드는 (높이, 너비)만 출력해야 합니다. 채널이 있다면 (높이, 너비, 채널)을 출력할 것입니다.
