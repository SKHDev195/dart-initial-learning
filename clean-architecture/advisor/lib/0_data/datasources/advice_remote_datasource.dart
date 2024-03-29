// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:advisor/0_data/exceptions/exceptions.dart';
import 'package:advisor/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  /// Requests a random advce from the API.
  /// Returns [AdviceModel] if the request is successful.
  /// Throws a server exception if the request is unsuccessful.
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final http.Client client;
  AdviceRemoteDatasourceImpl({
    required this.client,
  });

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {
        'content-type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
}
