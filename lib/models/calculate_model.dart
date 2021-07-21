class UserBody{
  double? height;
  double? weight;
  String? status;
  var time;
  UserBody({
    this.height,
    this.weight,
    this.status,
    this.time,
  });

  UserBody.fromJson(Map<String, dynamic> json){
    height = json['height'];
    weight = json['weight'];
    status = json['status'];
    time = json['time'];
  }
  Map<String, dynamic> toMap(){
    return {
      'height' : height,
      'weight' : weight,
      'status' : status,
      'time' : time,
    };
  }

}