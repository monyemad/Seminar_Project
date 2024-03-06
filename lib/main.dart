import 'package:final_project/bloc.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/sign_in/first_page.dart';
import 'package:final_project/sign_in/parent_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      // BlocProvider(
      //   create:(context) => AppCubit()..getDataFromFirebase(),
      //   child:
        const MyApp(),
      // )
  );
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
