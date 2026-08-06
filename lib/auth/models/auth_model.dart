
class AuthData {
  final String accessToken;
  final String refreshToken;
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;

  AuthData({
    required this.accessToken,
    required this.email,
    required this.refreshToken,
    required this.image,
    required this.gender,
    required this.lastName,
    required this.firstName,
     required this.username,
     required this.id
  });
   factory AuthData.fromJson(Map<String, dynamic> json){
    return AuthData(
      
      accessToken: json['accessToken'], 
      email: json ['email'],
       refreshToken: json ['refreshToken'],
        image: json['image'],
         gender: json['gender'], 
         lastName: json['lastName'], 
         firstName:json['firstName'] ,
          username: json['username'] ,
          id: json['id'],
    );

   }

}
