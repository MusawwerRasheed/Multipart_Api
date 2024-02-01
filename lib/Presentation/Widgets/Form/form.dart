 
 
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:multipartapi/Application/Services/NavigationServices/navigation.dart';
import 'package:multipartapi/Application/Services/PickerServices/picker_services.dart';
import 'package:multipartapi/Data/DataSource/Resources/color.dart';
import 'package:multipartapi/Domain/Models/app_form_data.dart';
import 'package:multipartapi/Presentation/Widgets/Form/Controller/form_cubit.dart';
import 'package:multipartapi/Presentation/Widgets/Form/State/form_state.dart';
import 'package:multipartapi/Presentation/Widgets/Form/VideoPlayer/video_player.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';  
 import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';  
import 'package:video_player/video_player.dart';
 
 




class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);
 
  @override
  State<FormScreen> createState() => _FormScreenState();
}
 
class _FormScreenState extends State<FormScreen> {


  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  List<PlatformFile> imagepaths = [];
  List<PlatformFile> videopaths = []; 
  List<PlatformFile> docpaths   = []; 
  List<List<String>>? allpaths  = []; 
  bool? option = true;
  int? age;
  String? name;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(0.94),
      body: SingleChildScrollView(
        child: BlocConsumer<FormCubit, MultipartFormState>(

          
          listener: (context, state) {

              if (state is FormLoadedState){ 
                  // allfiles!.addAll(state.data.files! ?? []);
                  // Data alldata = state.data.data!;
                          }
          },
          builder: (context, state) {
            print("State in form isis $state");
            VideoPlayerController controller;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0, left: 30, right: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text('Name'),
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Text('Age'),
                        TextFormField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an age';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            PickFile.pickFiles().then((value) {
                              if (value != null) {
                                setState(() {
                                  imagepaths.addAll(value);
                                });
                              }
                            });
                          },
                          child: Text('Pick Images'),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 500,
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (PlatformFile imagepath in imagepaths)
                                SizedBox(
                                  width: 120,
                                  height: 10,
                                  child: imagepath != null
                                      ? Image.file(File(imagepath.path!))
                                      : Center(child: Text('No file picked')),
                                ),
                            ],
                          ),
                        ),
                        ElevatedButton(onPressed: (){

PickFile.pickFiles().then((value) {
                              if (value != null) {
                                setState(() {
                                  videopaths.addAll(value);
                                });
                              }
                            });
                        }, child: Text('Pick Video')), 

                        Container(
                          width: 500,
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (PlatformFile videopath in videopaths)
                                SizedBox(
                                  width: 220,
                                  height: 20,
                                  child: videopath != null
                                      ? 

                                       CustomVideoPlayer(videopath: videopath.path!)

                                      : Center(child: Text('No file picked')),
                                ),
                            ],
                          ),
                        ),

                        ElevatedButton(onPressed: (){
                          // Navigate.to(context,CustomVideoPlayer(videopath: '',));
                            PickFile.pickFiles().then((value) {
                              if (value != null) {
                                setState(() {
                                  docpaths.addAll(value);
                                });
                              }
                            });


                        }, child:Text('pick doc')),

                             Container(
                          width: 500,
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (PlatformFile docpath in docpaths)
                                SizedBox(
                                  width: 120,
                                  height: 10,
                                  child: docpath != null
                                      ? 
                                      // FileIcon(docpath.path!)
                                      Text('')
                                      // Image.file(File(docpath.path!))
                                      : Center(child: Text('No file picked')),
                                ),
                            ],
                          ),
                        ),


                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              name = nameController.text;
                              age = int.tryParse(ageController.text);
                              List<String?>? paths = imagepaths.map((e) => e.path).toList();

                              Map<String, dynamic> formdata = {
                                'age': age,
                                'option': option,
                                'name': name,
                                'imagepaths': imagepaths,
                                'videopaths': videopaths, 
                                'docpaths': docpaths, 
                              };

                              context.read<FormCubit>().getCubitFormData(cubitData: formdata);
 
                            }
                          },
                          child: Text('Post Data'),
                        ),
                      ],
                    ),
                  ),
                ),
            
            if(state is FormLoadedState)
                  Column(
                    children: [
                      Text( state.data.data?.nameStr ?? 'no name'), 
                          SizedBox(height: 20,), 
                  
                      Container(child: Column(
                        children: [ 
                            if(state.data.files != null)
                         for(String imagePath in state.data!.files![0] )
                      
                        Container(

                          width: 50, height: 50, 
                          child: Card(child: Image.network('http://192.168.1.18:8008'+imagePath))), 
                            
                        ],
                      ),),

                       SizedBox(height: 20,), 

                        
 for(String videoPath in state.data!.files![1])
 Container(
                        width: 50, height: 50,
                        child: Card(child: CustomVideoPlayer(videopath: videoPath),),
                       ),  
                         
                        SizedBox(height: 20,), 


for(String doc in state.data!.files![2])

                       
 Container(
                          width: 50, height: 50, 
                          child: Card(child: Image.network('http://192.168.1.18:8008'+doc))), 

                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }


   
}
