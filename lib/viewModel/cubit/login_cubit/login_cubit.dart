import 'package:country_picker/country_picker.dart';
import 'package:doctor_app/viewModel/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../local/shared_keys.dart';
import '../../local/shared_prefrence.dart';
import '../../network/dio_helper.dart';
import 'login_state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(InitLogin());
  static LoginCubit get(context)=>BlocProvider.of<LoginCubit>(context);
  static var formState=GlobalKey<FormState>();
  static var formState2=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController typeController=TextEditingController();
  bool isObscure=true;
  List types=['doctor','admin'];
  changeType (int index){
    types[index]=typeController;
  }
  showPassword(){
    isObscure =! isObscure;
    emit(ShowPasswordSuccess());
  }

  onSelect (Country country) {
    print('Select country: ${country.displayName}');
    addressController.text=country.name;
    emit(OnSelectSuccess());
  }
checkSignup (){
  emit(CheckSignupLoading());
  DioHelper.post(path: '$auth/$signup',
      data:{
        'name':usernameController.text,
        'email':emailController.text,
        'password':passwordController.text,
        'title': typeController.text,
        'address':addressController.text
      }).then((value) {
    if (value.data['code']==200 || value.data['code'] == 201){
      print(value.data);
      CacheHelper.setValue(SharedKeys.token, value.data['token'] ?? '');
      emit(CheckSignupSuccess());}
    else{
      print("error");
      emit(CheckSignupError());
    }
  });
}
  checkLogin (){
    emit(CheckLoginLoading());
    DioHelper.post(path: '$auth/$login',
        data:{
          'email':emailController.text,
          'password':passwordController.text
        }).then((value) {
      if (value.data['code']==200 || value.data['code'] == 201){
        print(value.data);
        CacheHelper.setValue(SharedKeys.token, value.data['token'] ?? '');
        emit(CheckLoginSuccess());}
      else {
        print("error");
        emit(CheckLoginError());
      }
    });
  }
  checkLogout (){
    emit(LogoutLoading());
    DioHelper.post(path: logout,
    ).then((value) {
      print(value.data);
      emit(LogoutSuccess());
    }).catchError((onError){
      emit(LogoutError());
    });
}
}

