import 'package:health_malamu_patient/app/models/medecin.dart';
import 'package:health_malamu_patient/app/models/patient.dart';

class ConsultingResult {
  int? currentPage;
  List<Consulting>? data;
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

  ConsultingResult(
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

  ConsultingResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Consulting>[];
      json['data'].forEach((v) {
        data!.add(Consulting.fromJson(v));
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

class Consulting {
  int? id;
  String? code;
  int? medecinId;
  int? patienId;
  String? poids;
  String? taille;
  String? perimetreCranienPc;
  String? perimetreThoraciquePt;
  String? perimetreBrachialPb;
  String? groupeSangiunFacteurRhesus;
  String? etatNutritionnel;
  String? signeVitauxTA;
  String? signeVitauxFC;
  String? signeTemperatureDegreC;
  String? signeTemperatureFR;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Patient? patient;
  Medecin? medecin;

  Consulting(
      {this.id,
      this.code,
      this.medecinId,
      this.patienId,
      this.poids,
      this.taille,
      this.perimetreCranienPc,
      this.perimetreThoraciquePt,
      this.perimetreBrachialPb,
      this.groupeSangiunFacteurRhesus,
      this.etatNutritionnel,
      this.signeVitauxTA,
      this.signeVitauxFC,
      this.signeTemperatureDegreC,
      this.signeTemperatureFR,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.patient,
      this.medecin});

  Consulting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    medecinId = json['medecin_id'];
    patienId = json['patien_id'];
    poids = json['poids'];
    taille = json['taille'];
    perimetreCranienPc = json['perimetre_cranien_pc'];
    perimetreThoraciquePt = json['perimetre_thoracique_pt'];
    perimetreBrachialPb = json['perimetre_brachial_pb'];
    groupeSangiunFacteurRhesus = json['groupe_sangiun_facteur_rhesus'];
    etatNutritionnel = json['etat_nutritionnel'];
    signeVitauxTA = json['signe_vitaux_t_a'];
    signeVitauxFC = json['signe_vitaux_f_c'];
    signeTemperatureDegreC = json['signe_temperature_degre_c'];
    signeTemperatureFR = json['signe_temperature_f_r'];
    createdAt = json['created_at'];

    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    medecin =
        json['medecin'] != null ? Medecin.fromJson(json['medecin']) : null;
  }
}
