import 'package:amdb/routes/go_router.dart';
import 'package:amdb/services/restful/api_executor_service.dart';
import 'package:flutter/material.dart';

void main() {
  ///Init restful services
  ApiExecutorService().initService();
  ///

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}
