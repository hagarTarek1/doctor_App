import 'package:doctor_app/view/screens/auth/slpash_screen.dart';
import 'package:doctor_app/viewModel/cubit/home_screen/home_cubit.dart';
import 'package:doctor_app/viewModel/cubit/login_cubit/login_cubit.dart';
import 'package:doctor_app/viewModel/local/shared_prefrence.dart';
import 'package:doctor_app/viewModel/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  CacheHelper.clearData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>LoginCubit(),),
      BlocProvider(create: (context)=> HomeCubit()),


    ],
    child:ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context , child) {
    return const MaterialApp(home: SplashScreen(),);}));
  }
}
