// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:multipartapi/Presentation/Widgets/Form/Controller/form_cubit.dart';

// class ShowData extends StatefulWidget {
//   const ShowData({Key? key}) : super(key: key);

//   @override
//   _ShowDataState createState() => _ShowDataState();
// }

// class _ShowDataState extends State<ShowData> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<FormCubit, FormState>(
//         builder: (BuildContext context, FormState state) {
//           // Build your UI based on the current state
//           if (state is YourLoadedState) {
//             return Text("Data Loaded: ${state.data}");
//           } else if (state is YourErrorState) {
//             return Text("Error: ${state.errorMessage}");
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//         listener: (BuildContext context, YourState state) {
//           // Respond to state changes
//           if (state is YourLoadedState) {
//             // Do something when data is loaded
//           } else if (state is YourErrorState) {
//             // Handle errors
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("Error: ${state.errorMessage}")),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
