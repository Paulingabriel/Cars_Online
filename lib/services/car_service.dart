import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:app/models/api_response.dart';
import 'package:app/models/car.dart';
import 'package:app/models/carUpdate.dart';
import 'package:app/models/user.dart';
import 'package:app/constant.dart';
import 'package:app/services/user_service.dart';
import 'package:app/utils/ListCars.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//create Car

Future<ApiResponse> createCar(
  String? nom,
  List<String?> images,
  int? categoryId,
  String? type,
  String? year,
  String? marque,
  int? pfisc,
  int? pdin,
  String? desc,
  int? cyl,
  int? prix,
  String? portiere,
  String? place,
  String? boite,
  int? km,
  String? sellerie,
  String? couleur,
  int? cylindrees,
  String? ville,
  String? pays,
) async {
  ApiResponse apiResponse = ApiResponse();
  int id = await getUserId();
  // print(images[0]);
  // print(id);

  try {
    String token = await getToken();
    final response = await http.post(Uri.parse(carURL),
        headers: {
          'Accept': 'Application/json',
          'Authorization': 'Bearer $token'
        },
        body: images != []
            ? {
                'id': id.toString(),
                'nom': nom,
                'images': jsonEncode({'images': images}),
                'category_id': categoryId.toString(),
                'type': type.toString(),
                'annee': year.toString(),
                'marque': marque.toString(),
                'pfisc': pfisc.toString(),
                'pdin': pdin.toString(),
                'desc': desc.toString(),
                'cyl': cyl.toString(),
                'prix': prix.toString(),
                'portiere': portiere.toString(),
                'place': place.toString(),
                'boite': boite.toString(),
                'km': km.toString(),
                'sellerie': sellerie.toString(),
                'couleur': couleur.toString(),
                'cylindrees': cylindrees.toString(),
                'ville': ville.toString(),
                'pays': pays.toString()
              }
            : {
                'id': id.toString(),
                'nom': nom,
                'category_id': categoryId,
                'type': type,
                'annee': year,
                'marque': marque,
                'pfisc': pfisc,
                'pdin': pdin,
                'desc': desc,
                'cyl': cyl,
                'prix': prix,
                'portiere': portiere,
                'place': place,
                'boite': boite.toString(),
                'km': km.toString(),
                'sellerie': sellerie.toString(),
                'couleur': couleur.toString(),
                'cylindrees': cylindrees.toString(),
                'ville': ville.toString(),
                'pays': pays.toString()
              });
    print('bonjour');
    print(response.statusCode);
    print(response);

    switch (response.statusCode) {
      case 200:
        print("erreur");
        apiResponse.data = Car.fromJson(jsonDecode(response.body));
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
  // print(apiResponse.data);
  return apiResponse;
}

// Edit post

Future<ApiResponse> editCar(
  int carId,
  String? nom,
  List<String?> images,
  int? categoryId,
  String? type,
  String? year,
  String? marque,
  int? pfisc,
  int? pdin,
  String? desc,
  int? cyl,
  int? prix,
  String? portiere,
  String? place,
  String? boite,
  int? km,
  String? sellerie,
  String? couleur,
  int? cylindrees,
  String? ville,
  String? pays,
) async {
  ApiResponse apiResponse = ApiResponse();
  int id = await getUserId();

  try {
    String token = await getToken();
    final response = await http.put(Uri.parse('$carURL/$carId'),
        headers: {
          'Accept': 'Application/json',
          'Authorization': 'Bearer $token'
        },
        body: images != []
            ? {
                'id': id.toString(),
                'nom': nom,
                'images': jsonEncode({'images': images}),
                'category_id': categoryId.toString(),
                'type': type.toString(),
                'annee': year.toString(),
                'marque': marque.toString(),
                'pfisc': pfisc.toString(),
                'pdin': pdin.toString(),
                'desc': desc.toString(),
                'cyl': cyl.toString(),
                'prix': prix.toString(),
                'portiere': portiere.toString(),
                'place': place.toString(),
                'boite': boite.toString(),
                'km': km.toString(),
                'sellerie': sellerie.toString(),
                'couleur': couleur.toString(),
                'cylindrees': cylindrees.toString(),
                'ville': ville.toString(),
                'pays': pays.toString()
              }
            : {
                'id': id.toString(),
                'nom': nom,
                'category_id': categoryId,
                'type': type,
                'annee': year,
                'marque': marque,
                'pfisc': pfisc,
                'pdin': pdin,
                'desc': desc,
                'cyl': cyl,
                'prix': prix,
                'portiere': portiere,
                'place': place,
                'boite': boite.toString(),
                'km': km.toString(),
                'sellerie': sellerie.toString(),
                'couleur': couleur.toString(),
                'cylindrees': cylindrees.toString(),
                'ville': ville.toString(),
                'pays': pays.toString()
              });

    // print(jsonDecode(response.body));
    print(response.body);
    print(response.statusCode);

    switch (response.statusCode) {
      case 200:
        apiResponse.data = CarUpdate.fromJson(jsonDecode(response.body));
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

//delete car

Future<ApiResponse> deleteCar(int carId) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getToken();
    final response = await http.delete(Uri.parse('$carURL/$carId'), headers: {
      'Accept': 'Application/json',
      'Authorization': 'Bearer $token'
    });

    // print(jsonDecode(response.body));

    print(response.statusCode);

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
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

//get all cars

Future<ApiResponse> getCars() async {
  ApiResponse apiResponse = ApiResponse();
  print('salut');
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(carURL), headers: {
      'Accept': 'Application/json',
      'Authorization': 'Bearer $token'
    });
    print(response.body);

    switch (response.statusCode) {
      case 200:
        // var replace =
        // jsonDecode(response.body)['cars'][0]['images'].replaceAll('[', '');

        // images![0].replaceAll('"', '').replaceAll('\\', '')
        // var replace2 = replace.replaceAll(']', '');
        // var array = replace2.split(',');
        // jsonDecode(response.body)['cars'][0]['images'].replaceAll(']', '');
        // print( jsonDecode(response.body)['cars'][0]['images'].replaceAll('"', '').replaceAll('\\', ''));
        apiResponse.data = jsonDecode(response.body)['cars']
            .map((p) => ListCars.fromJson(p))
            .toList();
        apiResponse.data as List<dynamic>;
        break;
      case 401:
        apiResponse.error = unauthorized;
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
