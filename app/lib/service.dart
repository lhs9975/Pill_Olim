// import 'package:gpt_pill_03/model/epill_api.dart';
// import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';

// class Services {
//   static const String url =
//       'https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=r6XhTJHYJcuvIXbQZZ6pwuWvhTsOezeFufA8QoKy7cNYhBhXBT4PjbYrjUcrodJOpyGrCiN%2FZT7qzwAY8J5Pwg%3D%3D&type=json&pageNo=1&startPage=1&numOfRows=3';

//   static Future<List<Welcome>> getInfo() async {
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final List<Welcome> welcome = welcomeFromJson(response.body);
//         return welcome;
//       } else {
//         Fluttertoast.showToast(msg: 'Error occurred. Please try again');
//         return <Welcome>[];
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: e.toString());
//       return <Welcome>[];
//     }
//   }
// }
