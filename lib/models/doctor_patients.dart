class DoctorPatient {
  DoctorPatients? data;
  String? message;
  int? code;
  String? errors;

  DoctorPatient({this.data, this.message, this.code, this.errors});

  DoctorPatient.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DoctorPatients.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
    errors = json['errors'];
  }

}

  class DoctorPatients {
  List<AllPatients>? allPatient;


  DoctorPatients({this.allPatient});

  DoctorPatients.fromJson(Map<String, dynamic> json) {
  if (json['data'] != null) {
    allPatient = <AllPatients>[];
  json['data'].forEach((v) {
    allPatient!.add(AllPatients.fromJson(v));
  });
  }

  }}

  class AllPatients {
  int? id;
  String? name;
  String? dateOfBirth;
  String? diagnosis;
  String? address;
  String? visitTime;
  int? userId;
  String? createdAt;
  String? updatedAt;

  AllPatients(
  {this.id,
  this.name,
  this.dateOfBirth,
  this.diagnosis,
  this.address,
  this.visitTime,
  this.userId,
  this.createdAt,
  this.updatedAt});

  AllPatients.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  name = json['name'];
  dateOfBirth = json['date_of_birth'];
  diagnosis = json['diagnosis'];
  address = json['address'];
  visitTime = json['visit_time'];
  userId = json['user_id'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = id;
  data['name'] = name;
  data['date_of_birth'] = dateOfBirth;
  data['diagnosis'] = diagnosis;
  data['address'] = address;
  data['visit_time'] = visitTime;
  data['user_id'] = userId;
  data['created_at'] = createdAt;
  data['updated_at'] = updatedAt;
  return data;
  }
  }



