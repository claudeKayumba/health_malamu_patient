import 'package:health_malamu_patient/app/utils/app_plugins.dart';

class AppointmentResult {
  int? currentPage;
  List<Appointment>? appointments;
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

  AppointmentResult(
      {this.currentPage,
      this.appointments,
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

  AppointmentResult.fromJson(Map<String, dynamic> json) {
    appointments = List<Appointment>.of([]);
    currentPage = json['current_page'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        appointments!.add(Appointment.fromJson(v));
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

class Appointment {
  int? id;
  int? ownerId;
  int? concerned;
  String? description;
  String? appointmentAt;
  String? appointmentTime;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Appointment(
      {this.id,
      this.ownerId,
      this.concerned,
      this.description,
      this.appointmentAt,
      this.appointmentTime,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    concerned = json['concerned'];
    description = json['description'];
    if (json['appointment_at'] != null) {
      appointmentAt =
          AppUtils.getStringDateFormat(json['appointment_at'].toString());
    }
    if (json['appointment_time'] != null) {
      appointmentTime =
          AppUtils.getStringTimeFormat(json['appointment_time'].toString());
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner_id'] = this.ownerId;
    data['concerned'] = this.concerned;
    data['description'] = this.description;
    data['appointment_at'] = this.appointmentAt;
    data['appointment_time'] = this.appointmentTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
