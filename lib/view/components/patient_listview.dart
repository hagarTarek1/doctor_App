import 'package:doctor_app/consts/colors.dart';
import 'package:doctor_app/viewModel/cubit/login_cubit/login_cubit.dart';
import 'package:doctor_app/viewModel/cubit/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/doctor_patients.dart';

class PatientListView extends StatelessWidget {
  AllPatients? allPatients;
   PatientListView({required this.allPatients,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(builder: (context,state){
      return Container(
        height: 80,
        margin: EdgeInsets.all(20),
         padding: EdgeInsets.only(left: 20,right: 20,top: 10),
        decoration: BoxDecoration(color: white,
        // borderRadius: BorderRadius.circular(25),
            border: Border( left: BorderSide(color: babyBlue,width: 6.w),
            )
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(allPatients?.name?? "Patient : hagar",style: GoogleFonts.amaranth(textStyle: TextStyle(color: green,fontSize: 20.sp,fontWeight: FontWeight.bold))),
                SizedBox(height: 10,),
                Text(allPatients?.diagnosis ?? "diagsis : hagar",style: GoogleFonts.amaranth(textStyle: TextStyle(color: green,fontSize: 20.sp,fontWeight: FontWeight.bold))),

              ],
            ),
            Spacer(),
            // Text(allPatients?.visitTime?? "24/56",style: GoogleFonts.amaranth(textStyle: TextStyle(color: green,fontSize: 20.sp,fontWeight: FontWeight.bold))),
        CircleAvatar(
          backgroundColor: babyBlue,
            child: Icon(Icons.mode_edit_outlined,color: Colors.white,))
          ],
        )
      );
    }, listener: (context,state){});
  }
}
