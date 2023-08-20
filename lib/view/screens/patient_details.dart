import 'package:doctor_app/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewModel/cubit/home_screen/home_cubit.dart';
import '../../viewModel/cubit/home_screen/home_state.dart';
class PatientDetails extends StatelessWidget {
   PatientDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      return Scaffold(
        backgroundColor: green,

      );
    }, listener: (context,state){});
  }
}
