import 'package:flutter/material.dart';
import 'package:mobile_app/feature/splash/view/splash.dart';
import 'package:mobile_app/product/service/project_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/view/home_view.dart';
import '../../login/view/login_view.dart';
import '../../login/view_model/login_viewmodel.dart';

abstract class SplashViewModel extends State<SplashPage> with ProjectDioMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(EnumValue.token.name);

    if (token != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => HomeView(token: widget.token)),
          (route) => route.isFirst);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginView(
            token: widget.token,
          ),
        ),
      );
    }
  }
}
