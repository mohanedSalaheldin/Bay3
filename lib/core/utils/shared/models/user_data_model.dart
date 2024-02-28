
class UserDataModel {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  UserDataModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.points,
      required this.credit,
      required this.token});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      credit: json['credit'].round(),
      token: json['token'],
    );
  }
}
/*
{
 name: gryuhgg, 
 phone: 028568422365, 
 email: dfu1@ef.b,
 id: 62490, 
 image: https://student.valuxapps.com/storage/assets/defaults/user.jpg,
 token: 1P8HDNkknQR2R7JwPlHieV2e6UwNUtyucQolJwkFDBykkXe9YcCfy53q3tlJ1MBAb28K2p
 }
 */
