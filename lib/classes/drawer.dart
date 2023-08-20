import 'package:doctor_app/consts/colors.dart';
import 'package:doctor_app/viewModel/cubit/login_cubit/login_cubit.dart';
import 'package:doctor_app/viewModel/cubit/login_cubit/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(builder: (context,state){
      return
      Drawer(
    width: 200.w,
        backgroundColor: babyBlue,
      );
    }, listener: (context,state){});
  }
}