class UserModel {
  String? nik;
  String? name;
  String? birthplace;
  String? birthdate;
  String? gender;
  String? province;
  String? rt;
  String? rw;
  String? address;
  String? username;

  UserModel(
      {this.nik,
      this.name,
      this.birthplace,
      this.birthdate,
      this.gender,
      this.province,
      this.rt,
      this.rw,
      this.address,
      this.username});

  UserModel.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    name= json['name'];
    birthplace = json['birthplace'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    province = json['province'];
    rt = json['rt'];
    rw = json['rw'];
    address = json['address'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nik'] = this.nik;
    data['name'] = this.name;
    data['birthplace'] = this.birthplace;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
    data['province'] = this.province;
    data['rt'] = this.rt;
    data['rw'] = this.rw;
    data['address'] = this.address;
    data['username'] = this.username;
    return data;
  }
}
