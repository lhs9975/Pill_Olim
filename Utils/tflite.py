import tensorflow as tf

# Define paths for the input h5 file and the output tflite file
h5_file_path = 'E:\\Pill Project\\model_h5\\AlexNet_10_31_data18_batch16_epoch30_m1.h5'
tflite_file_path = 'E:\\Pill Project\\model_tflite\\AlexNet_10_31_data18_batch16_epoch30_m1.tflite'

# Load the h5 model
model = tf.keras.models.load_model(h5_file_path)

# Convert the model to TFLite format
converter = tf.lite.TFLiteConverter.from_keras_model(model)
tflite_model = converter.convert()

# Save the TFLite model to a file
with open(tflite_file_path, 'wb') as f:
    f.write(tflite_model)

print('Conversion to TFLite completed successfully.')
