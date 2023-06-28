import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mirror_wall_flutter_app/utils/routes_utils.dart';
import 'package:mirror_wall_flutter_app/views/screens/home_page.dart';
import 'package:mirror_wall_flutter_app/views/screens/web_view_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        AllRoutes.HomePage: (context) => home_page(),
        AllRoutes.WebPage: (context) => web_view_page(),
      },
    );
  }
}
