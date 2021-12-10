class User {
  int id;
  String firstname;
  String lastname;
  String username;
  String password;
  String email;
  int phoneNumber;
  int addressId;
  String role;
  int createdByUserId;
  int modifiedByUserId;
  DateTime createdDate;
  DateTime modifiedDate;
  int statusId;

  User();

  User.formJson(Map<String, dynamic> json)
      : id = json['id'],
        firstname = json['firstname'],
        lastname = json['lastname'],
        username = json['username'],
        password = json['password'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        addressId = json['addressId'],
        role = json['role'],
        createdByUserId = json['createdByUserId'],
        modifiedByUserId = json['modifiedByUserId'],
        createdDate = (json['createdDate'] != null
            ? DateTime.parse(json['createdDate'])
            : null),
        modifiedDate = (json['modifiedDate'] != null
            ? DateTime.parse(json['modifiedDate'])
            : null),
        statusId = json['statusId'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstname': firstname,
    'lastname': lastname,
    'username': username,
    'password': password,
    'email': email,
    'phoneNumber': phoneNumber,
    'addressId': addressId,
    'role': role,
    if (createdDate != null) 'createdDate': createdDate.toString(),
    if (modifiedDate != null) 'modifiedDate': modifiedDate.toString(),
    'createdByUserId': createdByUserId,
    'modifiedByUserId': modifiedByUserId,
    if (statusId != null) 'statusId': statusId,
  };
}
