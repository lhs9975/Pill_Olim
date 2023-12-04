import tensorflow as tf

saved_model_dir = 'E:\\Pill Project\\model_pb'
converter = tf.lite.TFLiteConverter.from_saved_model(saved_model_dir)
converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS,
                                       tf.lite.OpsSet.SELECT_TF_OPS]
tflite_model = converter.convert()
open('E:\\Pill Project\\model_tflite\\AlexNet_11_07_data18_batch32_epoch60_m1.tflite',
     'wb').write(tflite_model)
