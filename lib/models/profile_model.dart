class ProfileModel {
  final String userId;
  final String location;
  final String phone;
  final String email;
  final String profilePicture;

  ProfileModel({
    required this.userId,
    required this.location,
    required this.phone,
    required this.email,
    required this.profilePicture,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userId: json['user_id'],
      location: json['location'],
      phone: json['phone'],
      email: json['email'],
      profilePicture: json['profile_picture'],
    );
  }
}