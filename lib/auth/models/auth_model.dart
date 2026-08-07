class AuthData {
  final String? accessToken;
  final String? refreshToken;
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;

  AuthData({
    this.accessToken,
    this.refreshToken,
    required this.email,
    required this.image,
    required this.gender,
    required this.lastName,
    required this.firstName,
    required this.username,
    required this.id,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      email: json['email'],
      image: json['image'],
      gender: json['gender'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      username: json['username'],
      id: json['id'],
    );
  }
}