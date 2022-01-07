import 'package:health_malamu_patient/app/models/model_export.dart';

class PatientResult {
  int? currentPage;
  List<Patient>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  PatientResult(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  PatientResult.fromJson(Map<String, dynamic> json) {
    data = new List<Patient>.of([]);
    currentPage = json['current_page'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add(new Patient.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

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
    avatar = json['avatar'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
}
