import 'package:doctor_app/consts/colors.dart';
import 'package:doctor_app/view/screens/auth/signup_screen.dart';
import 'package:doctor_app/view/screens/home_screen.dart';
import 'package:doctor_app/viewModel/cubit/login_cubit/login_cubit.dart';
import 'package:doctor_app/viewModel/cubit/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../classes/custom_paint.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(builder: (context,state){
      var cubit=LoginCubit.get(context);
      return Scaffold(
        backgroundColor: green,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Stack(children: [
            // CustomPaint(
            //     painter: AppBarPainter(),
            //     size: const Size(550, 400),
            //   ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset('assets/OP2P0Gt.png',height: 320,width: 550,),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 390,left: 130),
            child: Text('Login',style: GoogleFonts.amaranth(textStyle: TextStyle(color: Colors.white,fontSize: 35.sp,fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),),
          ),
          Form(
            key: LoginCubit.formState,
            child: Padding(
              padding: const EdgeInsets.only(top: 460),
              child: Column(children: [
                  TextFormField(
                    style: TextStyle(color: green),
                    cursorColor: babyBlue,
                    controller: cubit.emailController,
                    decoration: InputDecoration(
                      fillColor: white,
                      filled: true,
                     hintText: 'E-mail',
                      hintStyle: GoogleFonts.amaranth(textStyle:TextStyle(color: green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp
                      ),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(
                              color:babyBlue)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: babyBlue,width: 2)
                      )
                      )
                    ),
                SizedBox(height: 20.h,),
                TextFormField(
                  obscureText: cubit.isObscure,
                    style: TextStyle(color: green),
                    cursorColor: babyBlue,
                    controller: cubit.passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        cubit.showPassword();
                      }, icon: Icon(
                          cubit.isObscure ?
                          Icons.remove_red_eye_outlined:
                          Icons.visibility_off_rounded
                      ),),
                        suffixIconColor: green,
                        fillColor: white,
                        filled: true,
                        hintText: 'password',
                        hintStyle: GoogleFonts.amaranth(textStyle:TextStyle(color: green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp
                        ),),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                                color:babyBlue)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: babyBlue,width: 2)
                        )
                    )
                ),
              SizedBox(height: 30.h,),
              SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      backgroundColor: white,elevation: 2),
                    onPressed: (){
                    cubit.checkLogin();
                    }, child: Text('Login',style: GoogleFonts.amaranth(textStyle: TextStyle(color: green,fontSize: 20.sp,fontWeight: FontWeight.bold)))),
              )
              ],),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(top: 700),
              child: Row(children: [
                  Text('Don\'t have an account?',style: GoogleFonts.amaranth(textStyle: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w500))),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
              }, child: Text('Signup',style: GoogleFonts.amaranth(textStyle: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w500,decoration: TextDecoration.underline)))
              )
      ],),
            )
          ],),
        ),
      ),

      );
    }, listener: (context,state){
      state is CheckLoginLoading?
      const Center(child: CircularProgressIndicator(),):
      state is CheckLoginSuccess?
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen())):
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor: white,
          content: Text("Try again",style: TextStyle(fontWeight: FontWeight.bold,color: green),)));


    });
  }
}
