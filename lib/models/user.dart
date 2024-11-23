class User {
  String? uid;
  String? fullName;
  String? firstName;
  String? lastName;
  String? nic;
  String? gender;
  String? dateOfBirth;
  String? age;
  String? slAddress;
  String? emergencyContact;
  String? passportNo;
  String? uaeAddress;
  String? uaeMobileNo;
  String? empAddress;
  String? empContact;
  String? salary;
  String? slContactName;
  String? slContactNo;
  String? uaeContactName;
  String? uaeContactNo;
  String? createDate;
  String? updateDate;

  User(
      {this.uid,
        this.fullName,
        this.firstName,
        this.lastName,
        this.nic,
        this.gender,
        this.dateOfBirth,
        this.age,
        this.slAddress,
        this.emergencyContact,
        this.passportNo,
        this.uaeAddress,
        this.uaeMobileNo,
        this.empAddress,
        this.empContact,
        this.salary,
        this.slContactName,
        this.slContactNo,
        this.uaeContactName,
        this.uaeContactNo,
        this.createDate,
        this.updateDate});

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    fullName = json['fullName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    nic = json['nic'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    age = json['age'];
    slAddress = json['slAddress'];
    emergencyContact = json['emergencyContact'];
    passportNo = json['passportNo'];
    uaeAddress = json['uaeAddress'];
    uaeMobileNo = json['uaeMobileNo'];
    empAddress = json['empAddress'];
    empContact = json['empContact'];
    salary = json['salary'];
    slContactName = json['slContactName'];
    slContactNo = json['slContactNo'];
    uaeContactName = json['uaeContactName'];
    uaeContactNo = json['uaeContactNo'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['fullName'] = this.fullName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['nic'] = this.nic;
    data['gender'] = this.gender;
    data['dateOfBirth'] = this.dateOfBirth;
    data['age'] = this.age;
    data['slAddress'] = this.slAddress;
    data['emergencyContact'] = this.emergencyContact;
    data['passportNo'] = this.passportNo;
    data['uaeAddress'] = this.uaeAddress;
    data['uaeMobileNo'] = this.uaeMobileNo;
    data['empAddress'] = this.empAddress;
    data['empContact'] = this.empContact;
    data['salary'] = this.salary;
    data['slContactName'] = this.slContactName;
    data['slContactNo'] = this.slContactNo;
    data['uaeContactName'] = this.uaeContactName;
    data['uaeContactNo'] = this.uaeContactNo;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    return data;
  }
}
