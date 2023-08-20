import 'package:doctor_app/classes/drawer.dart';
import 'package:doctor_app/consts/colors.dart';
import 'package:doctor_app/view/components/patient_listview.dart';
import 'package:doctor_app/view/screens/add_screen.dart';
import 'package:doctor_app/view/screens/patient_details.dart';
import 'package:doctor_app/viewModel/cubit/home_screen/home_cubit.dart';
import 'package:doctor_app/viewModel/cubit/home_screen/home_state.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/doctor_patients.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: HomeCubit.get(context)..getDoctorPatient(),
      child: BlocConsumer<HomeCubit,HomeState>(builder: (context,state){
        var cubit=HomeCubit.get(context);
        return
        Scaffold(
          endDrawer: MyDrawer(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor:green,
            centerTitle: true,
            title: Text('All patients',style:GoogleFonts.amaranth( textStyle: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold
          )
          ,),
        ),
        ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  EasyDateTimeLine(

                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                    },
                    activeColor: const Color(0xff85A389),
                    dayProps:  EasyDayProps(

                      inactiveBorderRadius: 15.w,
                      borderColor: babyBlue,
                    activeBorderRadius: 20,
                        activeDayDecoration: BoxDecoration(color: green),
                       todayMonthStrStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                       todayNumStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                       todayStrStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      todayHighlightStyle: TodayHighlightStyle.withBackground,
                      todayHighlightColor: green,
                    ),
                  ),
              ],
              ),
              Container( height: 600,
                padding: EdgeInsets.only(top: 210),
                child: ListView.separated(
                  shrinkWrap: true,
                    itemBuilder:
                (context,index){
                return InkWell( onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PatientDetails()));
                },
                    child: PatientListView(allPatients: cubit.doctorPatient?.data?.allPatient?[index] ??AllPatients()));
                }
                    , separatorBuilder:(context,index){return Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: Divider(thickness: 5.h,color: babyBlue,),
                    );}, itemCount: cubit.doctorPatient?.data?.allPatient?.length ?? 0),
              ),


            ],),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 5,right: 15),
            child: FloatingActionButton(
        splashColor: Colors.white,
            focusElevation: 20,
            elevation: 30,
            focusColor: Colors.white,
            heroTag: 'GFG Tag',
            backgroundColor: green,
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> AddScreen()));
            },child: Icon(Icons.add,size: 50,color: white,),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
            ),

          ),
        );
      }, listener: (context,state){}),
    );
  }
}
