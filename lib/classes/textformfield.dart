import 'package:country_picker/country_picker.dart';
import 'package:doctor_app/viewModel/cubit/home_screen/home_cubit.dart';
import 'package:doctor_app/viewModel/cubit/home_screen/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/colors.dart';


class MyTextFormField extends StatelessWidget {
  String hint;
  TextEditingController controller;
  bool obscure;
  Color color;
  MyTextFormField({required this.obscure,required this.hint,required this.controller,required this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(builder:(context,state){
      return TextFormField(

          validator: (value) {
            if (value!.isEmpty) {
              return "fill this field";
            }
            return null;
          },
        controller: controller,
          obscureText: obscure,
          style: TextStyle(color: green),
          cursorColor:Colors.white,
          decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 10.sp
            ),
              fillColor: color,
              filled: true,
              hintText: hint,
              hintStyle: TextStyle(color: green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                      color:babyBlue)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: babyBlue,width: 4)
              )
          )
      );
    }, listener: (context,state){});
  }
}




