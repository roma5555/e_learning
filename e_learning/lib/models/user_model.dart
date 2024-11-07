// class UserModel{
//    String? name;
//    String? email;
//    String? phone;
//    String? uId;
//    bool? isEmailVer;
//   UserModel({
//      required this.email,
//     required this.name,
//     required this.phone,
//     required this.uId,
//      this.isEmailVer ,
//
//   });
//
//   UserModel.fromJson(Map<String,dynamic>json){
//   email = json['email'] ?? '';
//   name = json['name'] ?? '';
//
//   phone = json['phone'] ?? '';
//
//   uId = json['uId'] ?? '';
//   isEmailVer = json['isEmailVer'] ?? false;
//
//
//   }
//
//    Map<String,dynamic> toMap(){
//     return {
//       'name' : name,
//       'email' : email,
//
//       'phone' : phone,
//       'uId' : uId,
//       'isEmailVer' : isEmailVer ,
//
//
//     };
//    }
// }