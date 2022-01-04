class User {
  int id;
  String firstName;
  String lastName;
  String employeeId;
  String password;
  String officialEmail;
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
        firstName = json['firstName'],
        lastName = json['lastName'],
        employeeId = json['employeeId'],
        password = json['password'],
        officialEmail = json['officialEmail'],
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
    'firstName': firstName,
    'lastName': lastName,
    'employeeId': employeeId,
    'password': password,
    'officialEmail': officialEmail,
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
