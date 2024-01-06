import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../functions/check_connectivity.dart';
import '../functions/custom_dialog.dart';
import 'status_request.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      if (await checkConnectivity()) {
        http.Response response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          customDialog(Colors.red, 'Server Failure', 'Please Try Again Later');
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        customDialog(
            Colors.red, 'No Connection', 'Please Check Your Connection');

        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
     // print(e.toString());
      customDialog(Colors.red, 'Server Exception', 'Please Try Again later');
      return const Left(StatusRequest.serverException);
    }
  }
}
