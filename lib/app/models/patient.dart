import 'model_export.dart';

class Patient {
  int? id;
  int? userId;
  String? code;
  String? noms;
  String? taille;
  String? poids;
  String? groupeSanguin;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? birthday;
  String? gender;
  String? profession;
  String? nationality;
  String? fatherName;
  String? motherName;
  String? maritalStatus;
  String? phone;
  String? adress;
  String? assuranceMaladie;
  String? contactPersonne;
  String? contactPersonnePhone;
  int? provinceId;
  String? avatar;
  User? user;

  Patient(
      {this.id,
      this.userId,
      this.code,
      this.noms,
      this.taille,
      this.poids,
      this.groupeSanguin,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.birthday,
      this.gender,
      this.profession,
      this.nationality,
      this.fatherName,
      this.motherName,
      this.maritalStatus,
      this.phone,
      this.adress,
      this.assuranceMaladie,
      this.contactPersonne,
      this.contactPersonnePhone,
      this.provinceId,
      this.avatar,
      this.user});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    code = json['code'];
    noms = json['noms'];
    taille = json['taille'];
    poids = json['poids'];
    groupeSanguin = json['groupe_sanguin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    birthday = json['birthday'];
    gender = json['gender'];
    profession = json['profession'];
    nationality = json['nationality'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    maritalStatus = json['marital_status'];
    phone = json['phone'];
    adress = json['adress'];
    assuranceMaladie = json['assurance_maladie'];
    contactPersonne = json['contact_personne'];
    contactPersonnePhone = json['contact_personne_phone'];
    provinceId = json['province_id'];
    avatar = json['avatar'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
}
