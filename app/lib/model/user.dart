class User {
  int user_id;
  String user_name;
  String user_email;
  String user_password;
  String user_phone_number;

  User(this.user_id, this.user_name, this.user_email, this.user_password,
      this.user_phone_number);

  factory User.fromJson(Map<String, dynamic> json) => User(
      int.parse(json['user_id']),
      json['user_name'],
      json['user_email'],
      json['user_password'],
      json['user_phone_number']);

  Map<String, dynamic> toJson() => {
        'user_id': user_id.toString(),
        'user_name': user_name,
        'user_email': user_email,
        'user_password': user_password,
        'user_phone_number': user_phone_number
      };
}
