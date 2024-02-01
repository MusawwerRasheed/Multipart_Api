
import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../../Application/Services/APIServices/api_services.dart';


class FormRepository {

  static Future<Map<String, dynamic>> getFormdata(Map<String,dynamic> repodata) async {

    try {
      return await Api.postFormdata(data: repodata).then(
            (value) {
              print('data inside of the repository is $value');
          return value;
        },
      ).catchError((e) {
        throw e;
      });
    } catch (e) {
      print('Error in Repository: $e');
      rethrow;
    }







  //   try {
  //     return await Api.postFormdata(data: repodata).then(
  //           (value) {
  //             print('data inside of the repository is $value');
  //         return value;
    
  //       },
  //     ).catchError((e) {
  //       throw e;
  //     });
  //   } catch (e) {
  //     print('Error in Repository: $e');
  //     rethrow;
  //   }
  // }
  
//   static postFormdata() async {

//     return {
//     "body": {
//         "data": {
//             "nameStr": "ffff",
//             "nameBool": "true",
//             "nameInt": "1111"
//         },
//         "files": ["/data/user/0/com.example.multipartapi/cache/file_picker/Deepwater-01-2.3.001-bigpicture_01_10.jpg",
//          "/data/user/0/com.example.multipartapi/cache/file_picker/Deepwater-01-2.3.001-bigpicture_01_1.jpg"]
//     }
// }
// ;

//   }

}

} 
 




