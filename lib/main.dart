import 'package:final_project/bloc.dart';
import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/screen/layout/matching_page.dart';
import 'package:final_project/screen/signin/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  Bloc.observer = AppBlocObserver();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubitA(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FirstScreen(),
        ));
  }
}
