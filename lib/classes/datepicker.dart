import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/colors.dart';
import '../viewModel/cubit/home_screen/home_cubit.dart';
import '../viewModel/cubit/home_screen/home_state.dart';

class MyDatePicker extends StatelessWidget {
  String hint;
  TextEditingController controller;
  Color color;
  MyDatePicker({required this.hint,required this.controller,required this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return BlocConsumer<HomeCubit,HomeState>(builder:(context,state){
      return TextFormField(
        keyboardType: TextInputType.none,
          onTap: (){
            showDatePicker(builder: (context, child) {
              return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: green, // header background color
                      onPrimary: Colors.white, // header text color
                      onSurface: babyBlue, // body text color
                    ),), child: child! );},
              context: context, initialDate: DateTime.now(), firstDate:DateTime(2023) , lastDate: DateTime(2024),

            ).then((value) {print(value.toString());
            return controller.text=value.toString() ?? "";});
          },
          controller: controller,
          style: TextStyle(color: green),
          cursorColor:Colors.white,
          decoration: InputDecoration(
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