class UserModel {
  String? status;
  String? message;
  User? user;
  UserModel(this.status, this.message);

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? category;
  String? country;
  String? dob;
  String? email;
  int? level;
  String? sex;
  int? userid;
  String? username;
  String? welcomeEmailSent;
  String? token;
  int? expires;
  String? isSubscribed;
  String? phpid;
  String? sessSalt;
  bool? isBanned;
  bool? isActive;

  User(
      {this.category,
      this.country,
      this.dob,
      this.email,
      this.level,
      this.sex,
      this.userid,
      this.username,
      this.welcomeEmailSent,
      this.token,
      this.expires,
      this.isSubscribed,
      this.phpid,
      this.sessSalt,
      this.isBanned,
      this.isActive});

  User.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    country = json['country'];
    dob = json['dob'];
    email = json['email'];
    level = json['level'];
    sex = json['sex'];
    userid = json['userid'];
    username = json['username'];
    welcomeEmailSent = json['welcome_email_sent'];
    token = json['token'];
    expires = json['expires'];
    isSubscribed = json['is_subscribed'];
    phpid = json['phpid'];
    sessSalt = json['sess_salt'];
    isBanned = json['is_banned'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['country'] = country;
    data['dob'] = dob;
    data['email'] = email;
    data['level'] = level;
    data['sex'] = sex;
    data['userid'] = userid;
    data['username'] = username;
    data['welcome_email_sent'] = welcomeEmailSent;
    data['token'] = token;
    data['expires'] = expires;
    data['is_subscribed'] = isSubscribed;
    data['phpid'] = phpid;
    data['sess_salt'] = sessSalt;
    data['is_banned'] = isBanned;
    data['is_active'] = isActive;
    return data;
  }
}
