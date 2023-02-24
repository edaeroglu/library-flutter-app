import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/feature/best%20seller/view/best_seller.dart';
import 'package:mobile_app/feature/book%20details/view/book_details_view.dart';
import 'package:mobile_app/feature/home/view/home_view.dart';
import 'package:mobile_app/feature/login/view/login_view.dart';
import 'package:mobile_app/feature/register/view/register_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/feature/splash/view/splash.dart';
import 'package:mobile_app/product/components/general_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          onGenerateRoute: (settings) {
          final token =  settings.arguments as String;

            return MaterialPageRoute(builder: (context) => LoginView(token: token));
          },
          routes: {
            '/loginRoute': (context) => const LoginView(token: ""),
            '/registerRoute': (context) => const RegisterView(),
            '/homeRoute': (context) => const HomeView(token: ""),
            '/bestsellerRoute': (context) =>
                BestSellerView(contentList: [], title: "", token: ""),
            // '/bookDetailsRoute': (context) => BookDetailsView(
            //       token: "",
            //       content: null,
            //     ),
          },
          theme: GeneralTheme().generalTheme,
          home: const SplashPage(token: ""),
        );
      },
    );
  }
}
