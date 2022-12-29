// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names, unused_local_variable
import 'dart:convert';

import 'package:equatable/equatable.dart';

// final authStateRM = RM.injectStream<User?>(() => auth.userChanges());
// User? get authState => authStateRM.state;

// void signUpWithEmail({context, email, password}) async {
//   try {
//     UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
//   } on FirebaseAuthException catch (e) {
//     print(e.message);
//     RM.scaffold.showSnackBar(
//       SnackBar(
//         content: Text(
//           e.message.toString(),
//         ),
//       ),
//     );
//   }
// }

// void signInWithEmail({email, password, context}) async {
//   try {
//     var user = await auth.signInWithEmailAndPassword(email: email, password: password);
//     print('login success');
//     print(user.user!.email);
//     print(user.user!.uid);
//   } on FirebaseAuthException catch (e) {
//     RM.scaffold.showSnackBar(
//       SnackBar(
//         content: Text(
//           e.message.toString(),
//         ),
//       ),
//     );
//   }
// }

// void signOut() async {
//   await auth.signOut();
// }

// final emailController = RM.injectTextEditing();
// final passwordController = RM.injectTextEditing();

class UserModel extends Equatable {
  final String recoveryKey;
  final String user;
  final String name;
  final String password;
  final int age;
  final DateTime dateOfBirth;
  final DateTime? dateOfPuberty;
  const UserModel(
    this.recoveryKey,
    this.user,
    this.name,
    this.password,
    this.age,
    this.dateOfBirth,
    this.dateOfPuberty,
  );

  // static List<UserModel> fromListJson(String source) {
  //   final List result = json.decode(source) as List;
  //   return result.map((e) => UserModel.fromJson(e)).toList();
  // }

  // static String toListJson(List<UserModel> users) {
  //   final List result = users.map((e) => e.toJson()).toList();
  //   return json.encode(result);
  // }

  UserModel copyWith({
    String? recoveryKey,
    String? user,
    String? name,
    String? password,
    int? age,
    DateTime? dateOfBirth,
    DateTime? dateOfPuberty,
  }) {
    return UserModel(
      recoveryKey ?? this.recoveryKey,
      user ?? this.user,
      name ?? this.name,
      password ?? this.password,
      age ?? this.age,
      dateOfBirth ?? this.dateOfBirth,
      dateOfPuberty ?? this.dateOfPuberty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'recoveryKey': recoveryKey,
      'user': user,
      'name': name,
      'password': password,
      'age': age,
      'dateOfBirth': dateOfBirth.millisecondsSinceEpoch,
      'dateOfPuberty': dateOfPuberty?.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['recoveryKey'] as String,
      map['user'] as String,
      map['name'] as String,
      map['password'] as String,
      map['age'] as int,
      DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'] as int),
      map['dateOfPuberty'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dateOfPuberty'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      recoveryKey,
      user,
      name,
      password,
      age,
      dateOfBirth,
    ];
  }
}
