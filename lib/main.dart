import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/environment.dart';
import 'features/presention/pages/list_screen.dart';

Box? box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.dev,
  );
  Environment().initConfig(environment);
  await Hive.initFlutter();
  // box = await Hive.openBox<Books>("tododata");
  // Hive.registerAdapter(BooksAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.green.shade600,
      ),
      home: const ListScreen(),
      // home: const SignInDemo(),
      // home: HomeView(),
      // home: const MyBooks(),
    );
  }
}
