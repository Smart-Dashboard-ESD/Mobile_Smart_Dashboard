class UserModel {
  int? id;
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
  String? token;

  UserModel(
      {this.id,
      this.nik,
      this.name,
      this.birthplace,
      this.birthdate,
      this.gender,
      this.province,
      this.rt,
      this.rw,
      this.address,
      this.username,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    name = json['name'];
    birthplace = json['birthplace'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    province = json['province'];
    rt = json['rt'];
    rw = json['rw'];
    address = json['address'];
    username = json['username'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['token'] = this.token;
    return data;
  }
}
