import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/feature/book%20details/view/book_details_view.dart';
import '../../../product/service/project_dio.dart';

abstract class BookDetailsViewModel extends State<BookDetailsView>
    with ProjectDioMixin {

  @override
  void initState() {
    super.initState();
  }

  Map<String, dynamic> getJsonFromJWT(String splittedToken) {
    String normalizedSource = base64Url.normalize(splittedToken);
    return jsonDecode(utf8.decode(base64Url.decode(normalizedSource)));
  }

  String getUserId() {
    final Map<String, dynamic> decodedToken =
        getJsonFromJWT(widget.token.split(".")[1]);

    final String userId =
        decodedToken["https://hasura.io/jwt/claims"]["x-hasura-user-id"];

    print(userId);

    return userId;
  }

  Future<void> like({required int productId}) async {
    await service.post("/like",
        data: {
          "user_id": int.parse(getUserId()),
          "product_id": productId,
        },
        options: Options(headers: {"Authorization": "Bearer ${widget.token}"}));
  }

  Future<void> unlike({required int productId}) async {
    service.post("/unlike",
        data: {
          "user_id": int.parse(getUserId()),
          "product_id": productId,
        },
        options: Options(headers: {"Authorization": "Bearer ${widget.token}"}));
  }

  
}
