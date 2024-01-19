import 'package:flutter/material.dart';
import 'package:flutter_getx/src/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: true,
      initialRoute: PagesRoutes.signinRoute,
      getPages: Routes.pages,
    );
  }
}
