class register {
  String? name;
  String? email;
  String? mobile;
  String? otp;

  register({this.name, this.email, this.mobile, this.otp});

  register.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['otp'] = this.otp;
    return data;
  }
}
