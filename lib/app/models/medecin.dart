class Medecin {
  int? id;
  int? userId;
  String? matricule;
  String? noms;
  String? refFonction;
  int? refSpecialite;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? hospitalId;
  String? avatar;
  String? thumbURL;

  Medecin({
    this.id,
    this.userId,
    this.matricule,
    this.noms,
    this.refFonction,
    this.refSpecialite,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.hospitalId,
    this.avatar,
    this.thumbURL,
  });

  Medecin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    matricule = json['matricule'];
    noms = json['noms'];
    refFonction = json['ref_fonction'];
    refSpecialite = json['ref_specialite'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    hospitalId = json['hospital_id'];
    avatar = json['avatar'];
    thumbURL = json['thumbURL'];
  }
}
