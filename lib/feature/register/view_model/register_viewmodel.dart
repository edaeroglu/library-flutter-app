import 'package:flutter/material.dart';
import 'package:mobile_app/feature/register/view/register_view.dart';
import 'package:mobile_app/product/service/project_dio.dart';
import '../../login/view/login_view.dart';
import '../service/register_service.dart';

abstract class RegisterViewModel extends State<RegisterView>
    with ProjectDioMixin {
  final RegisterService registerService = RegisterService();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    // ignore: avoid_print
    super.dispose();
  }

  bool isRegistering = false;

  Future<void> registers() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isRegistering = true;
      });

      final success = await register(
          emailController.text, nameController.text, passwordController.text);

      setState(() {
        isRegistering = false;
      });

      if (success) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginView(
                  token: "",
                )));
      } else {
        // ignore: use_build_context_synchronously
        await showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Error"),
            contentPadding: EdgeInsets.all(20),
          ),
        );
      }
    }
  }

  Future<bool> register(String email, String name, String password) async {
    return await registerService.register(email, name, password);
  }
}
