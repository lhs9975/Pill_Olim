from tensorflow import keras

model = keras.models.load_model(
    'E:\\Pill Project\\model_h5\\AlexNet_11_07_data18_batch32_epoch60_m1.h5', compile=False)

export_path = 'E:\\Pill Project\\model_pb'
model.save(export_path, save_format="tf")
