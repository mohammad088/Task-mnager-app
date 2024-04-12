import 'package:equatable/equatable.dart';

class User extends Equatable {
  final num id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  const User({required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token});

  const User.empty()
      :
        id = 1,
        email = "email",
        firstName = 'firstName',
        gender = "gender",
        image = 'image',
        lastName = 'laseName',
        token = "token",
        username = 'username';

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
