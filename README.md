# 딥러닝을 활용한 알약 이미지 인식 앱(약올림)
__알약 이미지 인식 앱__


## 프로젝트 소개
__CNN을 활용하여 알약의 각인 및 모양 학습을 통해 정확한 알약 분류.__  
__생활에서 복용하는 알약에 대한 상세 정보 및 위험도를 사용자에게 안내.__  
__사용자 개인의 알약 일정 관리를 가능하게 함.__


## 개발 기간
__2023.03.02 ~ 2023.11.14__


## Stacks
### Environment
<img src="https://img.shields.io/badge/visualstudiocode-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white"> <img src="https://img.shields.io/badge/jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">

### Library
<img src="https://img.shields.io/badge/tensorflow-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white"> <img src="https://img.shields.io/badge/opencv-5C3EE8?style=for-the-badge&logo=opencv&logoColor=white"> <img src="https://img.shields.io/badge/numpy-013243?style=for-the-badge&logo=numpy&logoColor=white"> 

### Development
<img src="https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white"> <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> <img src="https://img.shields.io/badge/flask-000000?style=for-the-badge&logo=flask&logoColor=white"> <img src="https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white">

## 1. 시스템 구성도
![시스템 구성도](https://github.com/lhs9975/Pill_Olim/assets/129912761/4b7ccaea-b427-42e2-aad1-cc04953e8b38)

## 2. DB
![DB](https://github.com/lhs9975/Pill_Olim/assets/129912761/f2afc80a-329b-4e39-99fb-dc31ab82227d)

## 3. UI
![UI](https://github.com/lhs9975/Pill_Olim/assets/129912761/a976a85e-0822-46df-b031-ecfa2eb147c5)

## 4. 데이터 개요
__60개의 알약을 직접 수집, 모든 알약을 직접 수집하기에 어려움이 있어 약학 정보원의 도움을 받아 5,088개의 알약을 추가로 수집__
### 1) 직접 수집한 알약
![그림 2-2](https://github.com/lhs9975/Pill_Olim/assets/129912761/265fa886-8881-42e1-9744-750fb2d7d7b8)

### 2) 약학 정보원에서 제공받은 알약
![그림 2-1](https://github.com/lhs9975/Pill_Olim/assets/129912761/4b4139aa-a89f-4105-b507-b768383d4441)

## 5. Preprocess
### 1) Remove Background
__배경이 존재하는 이미지의 경우 알약 인식 정확도에 영향을 끼칠 수 있어 알약만 추출하는 배경 제거를 진행__
![그림 2-7](https://github.com/lhs9975/Pill_Olim/assets/129912761/0e21030d-2e4f-4a87-af1c-d71765ba6e81)

### 2) Shape Preprocess
__모양 학습 진행 시 알약의 색상 및 각인의 영향을 제거하기 위해 이진화 진행__
![그림 2-8](https://github.com/lhs9975/Pill_Olim/assets/129912761/aa184188-c86f-47c4-bda8-31e7792ead81)

### 3) Imprint Preprocess
__GrayScale, Denoise, Histogram Equalization, BlackHat 순으로 전처리를 진행하여 각인 추출__  

![그림 9](https://github.com/lhs9975/Pill_Olim/assets/129912761/bf2a1e27-ee69-46f3-bc7a-17192f4f9d2f)

### 4) Data Augmentation
__데이터 증강을 위해 각인 및 모양 위치 ±10~20% 이동__
![그림 2-9](https://github.com/lhs9975/Pill_Olim/assets/129912761/335affbe-9fc6-4994-859a-e303bc3f8bb8)

## 6. 학습 결과
### 1) AlexNet
![image](https://github.com/lhs9975/Pill_Olim/assets/129912761/b503380a-15f0-4a95-b143-6615f876d710)

### 2) MobileNet
![image](https://github.com/lhs9975/Pill_Olim/assets/129912761/4c871244-de3a-4122-bbf8-4d4f60369592)

### 3) ResNet-50
![image](https://github.com/lhs9975/Pill_Olim/assets/129912761/454c91e6-a6f3-492f-9b9f-4876456e0669)
