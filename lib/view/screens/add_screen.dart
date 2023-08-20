import 'package:doctor_app/classes/drawer.dart';
import 'package:doctor_app/classes/textformfield.dart';
import 'package:doctor_app/consts/colors.dart';
import 'package:doctor_app/view/screens/home_screen.dart';
import 'package:doctor_app/viewModel/cubit/home_screen/home_cubit.dart';
import 'package:doctor_app/viewModel/cubit/home_screen/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../classes/custom_paint.dart';
import '../../classes/datepicker.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
      var cubit=HomeCubit.get(context);
      return Scaffold(
        extendBody: true,
    backgroundColor:white,
        endDrawer: MyDrawer(),
        // appBar: AppBar(
        //   backgroundColor: green,
        //   centerTitle: true,
        //   title: Text('Add patient',style:GoogleFonts.amaranth( textStyle: TextStyle(
        //       color: Colors.white,
        //       fontSize: 25.sp,
        //       fontWeight: FontWeight.bold
        //   ),),),
        // ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              CustomPaint(
                painter: AppBarPainter(),
                size: const Size(550, 200),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,),
                child: Image.asset('assets/279439-P5Y0KR.png',width: 350.w,fit: BoxFit.fitWidth,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 190,top: 90),
                child:

      Text('Add patient',style:GoogleFonts.amaranth( textStyle: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold
          ),),),),

              Padding(
                padding: const EdgeInsets.only(top: 280,left: 20,right: 20),
                child: Form( key: HomeCubit.formState,
                  child: Column(
                    children: [
                    MyTextFormField(obscure: false, hint: 'Name', controller:cubit.name , color: white),
                    SizedBox(height: 20.h,),
                    MyTextFormField(obscure: false, hint: 'Address', controller:cubit.address , color: white),
                    SizedBox(height: 20.h,),
                    MyDatePicker( hint: 'Date of birth', controller:cubit.birthday , color: white),
                    SizedBox(height: 20.h,),
                    MyDatePicker( hint: 'Visit time', controller:cubit.visitTime , color: white),
                    SizedBox(height: 20.h,),
                    MyTextFormField(obscure: false, hint: 'diagnosis', controller:cubit.diagnosis , color: white),
                    SizedBox(height: 30.h,),
                    SizedBox(
                      width: 200.w,
                      height: 50.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              backgroundColor: green,elevation: 2),
                          onPressed: (){
                            cubit.data();
                            cubit.addpatients();
                            cubit.getDoctorPatient();
                          }, child: Text('Add',style: GoogleFonts.amaranth(textStyle: TextStyle(color: white,fontSize: 30.sp,fontWeight: FontWeight.bold)))),
                    )
                  ],),
                ),
              ),
            ],
          ),
        ),
      );
    }, listener: (context,state){
      state is AddPatientLoading?
      Center(child: CircularProgressIndicator(),):
      state is AddPatientSuccess ?
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())):
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          content: Text("Try again",style: TextStyle(color: green,fontWeight: FontWeight.bold),)));

    });
  }
}
