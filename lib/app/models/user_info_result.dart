class UserInfoResult {
  User? user;

  UserInfoResult({user});

  UserInfoResult.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
}

class User {
  int? id;
  String? name;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? countryCode;
  bool? active;
  dynamic avatarId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? avatar;
  List<dynamic>? media;
  List<String>? permissions;
  String? role;

  User(
      {id,
      name,
      username,
      firstName,
      lastName,
      email,
      emailVerifiedAt,
      phone,
      countryCode,
      active,
      avatarId,
      createdAt,
      updatedAt,
      deletedAt,
      avatar,
      media,
      permissions,
      role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    countryCode = json['country_code'];
    active = json['active'];
    avatarId = json['avatar_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    avatar = json['avatar'];
    media = new List<dynamic>.of([]);
    role = json['role'];
  }

  String get fullName => '$name';
}
