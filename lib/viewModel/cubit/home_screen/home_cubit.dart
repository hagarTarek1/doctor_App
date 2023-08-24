
import 'package:bloc/bloc.dart';
import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart';
import 'package:doctor_app/models/add_patient.dart';
import 'package:doctor_app/models/doctor_patients.dart';
import 'package:doctor_app/models/patient_details.dart';
import 'package:doctor_app/viewModel/cubit/home_screen/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../consts/colors.dart';
import '../../local/shared_keys.dart';
import '../../local/shared_prefrence.dart';
import '../../network/dio_helper.dart';
import '../../network/end_points.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(InitHomeScreen());
  static var formState=GlobalKey<FormState>();

  static HomeCubit get(context)=>BlocProvider.of<HomeCubit>(context);
  TextEditingController name=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController diagnosis=TextEditingController();
  TextEditingController birthday=TextEditingController();
  TextEditingController visitTime=TextEditingController();
  DoctorPatient? doctorPatient;
  clearText (){
    name.clear();
    address.clear();
    diagnosis.clear();
    birthday.clear();
    emit(ClearTextSuccess());
  }
  onSelect (Country country) {
    print('Select country: ${country.displayName}');
    address.text=country.name;
    emit(OnSelectSuccess());
  }
  data() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      print("valid");
      emit(DataSuccess());
    }
    print("invalid");
    emit(DataError());
  }
  getDoctorPatient (){
emit(DoctorPatientLoading());
DioHelper.get(path: doctorPatients,
    token: CacheHelper.getData(SharedKeys.token)).then((value) {
  print(value.data);
  doctorPatient = DoctorPatient.fromJson(value.data);
  emit(DoctorPatientSuccess());
});
  }
  AddPatient? addPatient;
  Future<void> addpatients() async {
    emit(AddPatientLoading());
    DioHelper.post(
        path: addPatients,
        data: {
          'name':name.text,
          'date_of_birth':birthday.text,
          'diagnosis':diagnosis.text,
          'address':address.text,
          'visit_time':visitTime.text
        },
        token: CacheHelper.getData(SharedKeys.token))
        .then((value) {
      if (value.data['code'] == 201) {
        print(value.data);
        addPatient=AddPatient.fromJson(value.data);
        emit(AddPatientSuccess());
          SnackBar(
            backgroundColor: green,
            content: Text("Added Successfully"),
        );
      } else {
        emit(AddPatientError());

          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Error Add  ${value.data['message']}',
          ),
        );
      }
    });
      }
      PatientDetails? patientDetails;
  showPatient (int id){
    emit(ShowPatientLoading());
    DioHelper.get(path: '$showPatients/$id',
        token: CacheHelper.getData(SharedKeys.token)).then((value) {
      print(value.data);
      patientDetails = PatientDetails.fromJson(value.data);
      emit(ShowPatientSuccess());
    });
  }
  deletePatient(int index) {
    emit(DeleteProductLoading());
    DioHelper.delete(
        path: "$doctorPatients/${doctorPatient?.data?.allPatient?[index].id ?? 0}",
        token: CacheHelper.getData(SharedKeys.token))
        .then((value) {
      doctorPatient?.data?.allPatient?[index] = AllPatients.fromJson(value.data['data']);
      emit(DeleteProductSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteProductError());
    });
  }
  updatePatient(int index) {
    emit(UpdatePatientLoading());
    DioHelper.post(
      path: '$doctorPatients/${doctorPatient?.data?.allPatient?[index].id ?? 0}',
      queryParameters: {
        '_method': 'put',
      },
      token: CacheHelper.getData(SharedKeys.token),
    ).then((value) {
      doctorPatient?.data?.allPatient?[index]= AllPatients.fromJson(value.data['data']);
      emit(UpdatePatientSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(UpdatePatientError());
    });
  }

}