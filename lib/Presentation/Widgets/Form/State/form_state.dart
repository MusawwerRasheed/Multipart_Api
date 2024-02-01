
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:multipartapi/Domain/Models/app_form_data.dart';
import 'package:multipartapi/Presentation/Widgets/Form/Controller/form_cubit.dart';

abstract class MultipartFormState {}

class FormInitialState extends MultipartFormState {}

class FormLoadedState extends MultipartFormState {
    
   final AppFormData data ;

FormLoadedState( { required this.data });

} 

class FormLoading extends MultipartFormState {
  FormLoading();
}

class FormErrorState extends MultipartFormState {
  final String error;
  FormErrorState(String s, {required this.error, required String errorMessage});
}


