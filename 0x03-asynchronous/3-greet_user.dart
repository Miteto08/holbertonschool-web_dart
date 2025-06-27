import 'dart:convert';
import '3-util.dart';

Future<String> greetUser() async {
  try {
    final data = await fetchUserData();
    final user = jsonDecode(data);
    return 'Hello ${user['username']}';
  } catch (e) {
    return 'error caught: $e';
  }
}

Future<String> loginUser() async {
  try {
    if (await checkCredentials()) {
      print('There is a user: true');
      return await greetUser();
    } else {
      print('There is a user: false');
      return 'Wrong credentials';
    }
  } catch (e) {
    return 'error caught: $e';
  }
}