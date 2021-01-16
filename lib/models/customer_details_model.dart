class CustomerDetailsModel {
  int id;
  String firstName;
  String lastName;
  Billing billing;
  Shipping shipping;

  CustomerDetailsModel(
      {this.id, this.firstName, this.lastName, this.billing, this.shipping});

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) =>
      CustomerDetailsModel(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        billing: Billing.fromJson(json["billing"]),
        shipping: Shipping.fromJson(json["shipping"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    'first_name': firstName,
    'last_name': lastName,
    "billing": billing.toJson(),
    "shipping": shipping.toJson(),
  };

}

class Billing {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String postCode;
  String country;
  String city;
  String email;
  String phone;
  String state;

  Billing({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.postCode,
    this.country,
    this.city,
    this.email,
    this.phone,
    this.state,
  });

  factory Billing.fromJson(Map<String, dynamic> json) => Billing(
        firstName: json['first_name'],
        lastName: json['last_name'],
        company: json['company'],
        address1: json['address_1'],
        address2: json['address_2'],
        postCode: json['postcode'],
        city: json['city'],
        country: json['country'],
        email: json['email'],
        state: json['state'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'company': company,
        'address_1': address1,
        'address_2': address2,
        'postcode': postCode,
        'city': city,
        'country': country,
        'phone': phone,
        'email': email,
        'state': state
      };
}

class Shipping {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String postCode;
  String country;
  String city;
  String email;
  String phone;
  String state;

  Shipping(
      {this.firstName,
      this.lastName,
      this.company,
      this.address1,
      this.address2,
      this.postCode,
      this.country,
      this.city,
      this.email,
      this.phone,
      this.state});

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        firstName: json['first_name'],
        lastName: json['last_name'],
        company: json['company'],
        address1: json['address_1'],
        address2: json['address_2'],
        postCode: json['postcode'],
        city: json['city'],
        country: json['country'],
        email: json['email'],
        state: json['state'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'company': company,
        'address_1': address1,
        'address_2': address2,
        'postcode': postCode,
        'city': city,
        'country': country,
        'phone': phone,
        'email': email,
        'state': state
      };
}
