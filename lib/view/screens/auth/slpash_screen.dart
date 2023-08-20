import 'package:doctor_app/consts/colors.dart';
import 'package:doctor_app/view/screens/auth/signin_screen.dart';
import 'package:doctor_app/viewModel/cubit/login_cubit/login_cubit.dart';
import 'package:doctor_app/viewModel/cubit/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(builder: (context,state){
      return Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Image.asset("assets/7954518.png",fit: BoxFit.cover,),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 350),
              //   child: CustomPaint(
              //     painter: AppBarPainter(),
              //     size: Size(600, 400),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 480,left: 70),
                child: Column(
                  children: [
                    Text('Your health is\n   safe here.',style:GoogleFonts.amaranth(textStyle: TextStyle(color: green,fontSize: 40,fontWeight: FontWeight.bold,))),
                    SizedBox(height: 60.h,),
                    SizedBox( width: 200.w,height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: green,elevation: 2),
                          onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));
                          }, child: Text(
                        'Get start   >',
                        style:GoogleFonts.amaranth(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp,color: white),),
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
