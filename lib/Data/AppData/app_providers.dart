
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multipartapi/Presentation/Widgets/Form/Controller/form_cubit.dart';


List<BlocProvider> appProviders = [
BlocProvider<FormCubit>(create: (context) => FormCubit()),

];

