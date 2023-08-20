import 'package:country_picker/country_picker.dart';
import 'package:doctor_app/consts/colors.dart';
import 'package:doctor_app/view/screens/home_screen.dart';
import 'package:doctor_app/viewModel/cubit/login_cubit/login_cubit.dart';
import 'package:doctor_app/viewModel/cubit/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(builder: (context,state){
      var cubit=LoginCubit.get(context);
      return Scaffold(
        backgroundColor: green,
        body: Padding(
          padding: const EdgeInsets.all(23),
          child: SingleChildScrollView(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset('assets/OP2P0Gt.png',height: 300,width: 550,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 350,left: 120),
                child: Text('Signup',style: GoogleFonts.amaranth(textStyle: TextStyle(color: white,fontSize: 35.sp,fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),),
              ),
              Form(
                key: LoginCubit.formState2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 430),
                  child: Column(children: [
                    TextFormField(
                        style: TextStyle(color: green),
                        cursorColor:Colors.white,
                        controller: cubit.usernameController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'user name',
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
                                borderSide: BorderSide(color: babyBlue,width: 2)
                            )
                        )
                    ),
                    SizedBox(height: 20.h,),
                    TextFormField(
                        style: TextStyle(color: green),
                        cursorColor:Colors.white,
                        controller: cubit.emailController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'E-mail',
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
                                borderSide: BorderSide(color: babyBlue,width: 2)
                            )
                        )
                    ),
                    SizedBox(height: 20.h,),
                    TextFormField(
                      onTap: (){
                        showCountryPicker(
                            context: context, // optional. Shows phone code before the country name.
                            onSelect: cubit.onSelect
                        );
                      },
                      keyboardType: TextInputType.none,
                        style: TextStyle(color: green),
                        cursorColor: babyBlue,
                        controller: cubit.addressController,
                        decoration: InputDecoration(
                            fillColor: white,
                            filled: true,
                            hintText: 'address',
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
                                borderSide: BorderSide(color: babyBlue,width: 2)
                            )
                        )
                    ),
                    SizedBox(height: 20.h,),
                    TextFormField(
                        style: TextStyle(color: green),
                        cursorColor: babyBlue,
                        controller: cubit.typeController,
                        decoration: InputDecoration(
                            fillColor: white,
                            filled: true,
                            hintText: 'doctor or admin',
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
                                borderSide: BorderSide(color: babyBlue,width: 2)
                            )
                        )
                    ),

                    SizedBox(height: 30.h,),
                    SizedBox(
                      width: 200.w,
                      height: 30.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              backgroundColor: white,elevation: 2),
                          onPressed: (){
                            cubit.checkSignup();
                          }, child: Text('signup',style: GoogleFonts.amaranth(textStyle: TextStyle(color: green,fontSize: 25.sp,fontWeight: FontWeight.bold)))),
                    )
                  ],),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 900),
                child: Row(children: [
                  Text('Already have an account?',style: GoogleFonts.amaranth(textStyle: TextStyle(color: white,fontSize: 18.sp,fontWeight: FontWeight.w500))),
                  TextButton(onPressed: (){}, child: Text('Login',style: GoogleFonts.amaranth(textStyle: TextStyle(color: white,fontSize: 18.sp,fontWeight: FontWeight.w500,decoration: TextDecoration.underline)))
                  )
                ],),
              )
            ],),
          ),
        ),

      );
    }, listener: (context,state){
      state is CheckSignupLoading?
      const Center(child: CircularProgressIndicator(),):
   state is CheckSignupSuccess?
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()))
    :
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text("Try again",style: TextStyle(color: green,fontWeight: FontWeight.bold),)));
    });
  }
}
