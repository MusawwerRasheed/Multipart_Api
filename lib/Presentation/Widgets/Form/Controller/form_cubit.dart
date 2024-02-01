import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:multipartapi/Data/Repository/form_repository.dart';
import 'package:multipartapi/Domain/Models/app_form_data.dart';
import '../State/form_state.dart';

class FormCubit extends Cubit<MultipartFormState> {
  
  FormCubit() : super(FormInitialState());
  Future<void> getCubitFormData({required Map<String, dynamic> cubitData}) async {
    
    await Future.delayed(Duration(milliseconds: 20));
    emit(FormLoading());
    try {
      Map<String, dynamic> response = await FormRepository.getFormdata(cubitData);
      print('response inside of cubit $response');

      if (response['Success']) {
        
        Map<String, dynamic> responseData = response['body'];
       AppFormData formdata = AppFormData.fromJson(responseData);
         
      emit(FormLoadedState(data: formdata));
      } else {
      }
    } catch (e) {
      emit(FormErrorState("An error occurred: $e", error: '', errorMessage: ''));
    }
  }
}













//   Future<void> getCubitFormData({required Map<String, dynamic> cubitData}) async {
//     emit(FormLoading());
//     try {
//       Map<String, dynamic> response = await FormRepository.getFormdata(cubitData);
//            print('response inside of cubit $response'); 

//        if (response['Success'] ) {
     
//      Map<String,dynamic> responseBody = response['body'];
//      Map<String, dynamic> data = response['body']['data']; 
//      Map<String, dynamic> files = response['body']['files']; 
  
//   // Map<String,dynamic> 
//   // AppFormData modeldata = AppFormData(response['']);


//  Map<String, dynamic> data  =  response['body']['data']; 
 
//  List files =  response['body']['files']; 
//  List<String> filesPaths = files.map((x) => x.toString()).toList();
  
//   print('paths are >>>> $filesPaths'); 
// //  print('data is $data'); 
// //  print('files are $files'); 
// // print('>>> File paths are $filesPaths'); 

//   List<String> dataList = data.values.map((value) => value.toString()).toList();
//   print(dataList); 

//    emit(FormLoadedState(dataList, filesPaths));

//        } else {
//       }
//     } catch (e) {
//       emit(FormErrorState("An error occurred: $Response['body']['error']", error: '', errorMessage: ''));
//     }
//   }

//   @override
//   Future<void> close() {
//     return super.close();
//   }
// }

