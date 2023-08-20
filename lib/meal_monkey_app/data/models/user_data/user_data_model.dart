class UserDataModel {
  String? name;
  String ?email;
  String? mobileNo;
  String? address;
  String? uId;

  UserDataModel({
     this.name,
     this.email,
      this.mobileNo,
     this.address,
     this.uId,
  });


  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json["name"],
      email: json["email"],
      mobileNo: json["mobileNo"],
      address: json["address"],
      uId: json["uId"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email":email,
      "mobileNo":mobileNo,
      "address":address,
      "uId":uId,
    };
  }
}
