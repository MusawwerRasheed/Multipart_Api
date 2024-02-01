import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;


class Api {
  static const String baseUrl = 'http://192.168.1.18:8008';

  static const String url = "dummy_api";

  static Future <Map<String, dynamic>> postFormdata(

      { required Map<String, dynamic> data}

      ) async {

    var postUri = Uri.parse("$baseUrl/$url");
    var request = http.MultipartRequest("POST", postUri);


    String name = data['name'];
    String age = data['age'].toString();
    String option = data['option'].toString();
    List<String>? imagepaths = [];
    List<String>? videopaths = [];
    List<String>? docpaths = [];  


     imagepaths = List<String>.from(data['imagepaths']);
     docpaths =   List<String>.from(data['docpaths']);
     videopaths = List<String>.from(data['videopaths']);
 

    request.fields['nameStr'] = name;
    request.fields['nameInt'] = age;
    request.fields['nameBool']  = option;


    if(imagepaths.isNotEmpty){
      
    for( String? p in imagepaths){
      request.files.add(
        await http.MultipartFile.fromPath(
          "images",
          p!,
          filename: p.split("/").last,
        ),
      );}
    }
     
      if(videopaths.isNotEmpty){
      for( String? v in videopaths){ 
      request.files.add(
        await http.MultipartFile.fromPath(
          "video",
          v!,
          filename: v.split("/").last,
        ),
      );
      }
      }
      
      if(docpaths.isNotEmpty){ 
      for( String? d in docpaths){
      request.files.add(
        await http.MultipartFile.fromPath(
          "Document",
          d!,
          filename: d.split("/").last,
        ),
      );
      }
      }


      
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();

      print(responseString);
      Map<String, dynamic> responseJson = json.decode(responseString);

      if (responseJson.isEmpty) {
        print('server error');

      } else {
        print('uploaded successfully');
        return responseJson;
      }
    } else {
      print('something went wrong');

    }
    throw();
  }
}