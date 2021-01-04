class CustomerModel {
  String email, firstName, lastName, password;

  CustomerModel(this.email, this.firstName, this.lastName, this.password);

  Map<String, dynamic> toJson(){
    Map<String,dynamic> map = Map();
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['password'] = password;
    return map;
  }

}