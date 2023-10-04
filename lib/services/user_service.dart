import 'dart:convert';
import 'dart:async';
<<<<<<< HEAD
import 'dart:io';
import 'package:app/models/api_response.dart';
import 'package:app/models/car.dart';
=======
import 'package:app/models/api_response.dart';
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
import 'package:app/models/user.dart';
import 'package:app/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//login

Future<ApiResponse> login(String email, String password) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'Application/json'},
        body: {'email': email, 'password': password});
<<<<<<< HEAD

    print(jsonDecode(response.body));

    switch (response.statusCode) {
      case 200:
        print(response.statusCode);
=======
    var resp = jsonDecode(response.body);
   print(resp['meta']['code']);

    switch (response.statusCode) {
      case 200:
    print(response.statusCode);
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e);
    apiResponse.error = serverError;
  }

  return apiResponse;
}

//register

Future<ApiResponse> register(String name, String pseudo, String tel,
<<<<<<< HEAD
  String email, String password) async {
=======
    String email, String password) async {
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(Uri.parse(registerURL), headers: {
      'Accept': 'Application/json'
    }, body: {
<<<<<<< HEAD
      'name': name,
      'pseudo': pseudo,
      'tel': tel,
=======
      'lastName': name,
      'firstName': pseudo,
      'phone': tel,
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
      'email': email,
      'password': password,
      'password_confirmation': password,
    });

<<<<<<< HEAD
    print(jsonDecode(response.body));
    print(response.statusCode);

    switch (response.statusCode) {
      case 200:
=======
    switch (response.statusCode) {
      case 201:
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e);
    apiResponse.error = serverError;
  }

  return apiResponse;
}

//User

Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(userURL), headers: {
      'Accept': 'Application/json',
      'Authorization': 'Bearer $token'
    });
<<<<<<< HEAD

    print(jsonDecode(response.body));
=======
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e);
    apiResponse.error = serverError;
  }

  return apiResponse;
}

// get token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
<<<<<<< HEAD
  return pref.getString('token') ?? '';
=======
  return pref.getString('accessToken') ?? '';
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
}

// get user id

<<<<<<< HEAD
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('id') ?? 0;
=======
Future<String> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('userId') ?? '';
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
}

// logout

Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
<<<<<<< HEAD
  return await pref.remove('token');
}

//get base64 encoded image
String? getStringImage(File? file) {
  if (file == null) return null;
  return base64Encode(file.readAsBytesSync());
=======
  return await pref.remove('accessToken');
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
}
