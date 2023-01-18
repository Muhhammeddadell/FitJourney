class users {
  String? key;
  UsersData? usersData;

  users({this.key, this.usersData});
}

class UsersData {
  String? name;
  String? age;
  String? email;
  String? weight;

  UsersData({this.name, this.age, this.email, this.weight});

  UsersData.fromJson(Map<dynamic, dynamic> json) {
    name = json["user_name"];
    age = json["user_age"];
    email = json["user_email"];
    weight = json["user_weight"];
  }
}
