class CreateUser{
  String? name;
  String? uId;
  String? phone;
  String? password;
  String? email;

  CreateUser({
    this.name,
    this.phone,
    this.uId,
    this.password,
    this.email
});

  CreateUser.fromJson(Map<String, dynamic> json){
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    password = json['password'];
    email = json['email'];
  }
  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'phone' : phone,
      'uId' : uId,
      'password' : password,
      'email' : email,
    };
  }

}