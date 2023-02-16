import 'dart:developer';

import 'package:dio/dio.dart';

class ProjectDioMixin {
  final service =
      Dio(BaseOptions(baseUrl: 'https://assign-api.piton.com.tr/api/rest'));
}
