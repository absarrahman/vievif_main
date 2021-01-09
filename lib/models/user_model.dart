class UserModel {
  UserModel({
    this.token,
    this.id,
    this.email,
    this.nicename,
    this.firstName,
    this.lastName,
    this.displayName,
  });

  String token;
  int id;
  String email;
  String nicename;
  String firstName;
  String lastName;
  String displayName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    token: json["token"],
    id: json["id"],
    email: json["email"],
    nicename: json["nicename"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    displayName: json["displayName"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "id": id,
    "email": email,
    "nicename": nicename,
    "firstName": firstName,
    "lastName": lastName,
    "displayName": displayName,
  };
}