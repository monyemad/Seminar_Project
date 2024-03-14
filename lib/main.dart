import 'package:final_project/bloc.dart';
import 'package:final_project/cubit/my_app_cubit.dart';
// import 'package:final_project/firebase_options.dart';
import 'package:final_project/screens/sign_in/first_page.dart';
import 'package:final_project/screens/sign_in/login_page.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(
    //   BlocProvider(
    // create: (context) => AppCubitA()..getDataFromFirebase(),
    // child:
    const MyApp(),
  // )
  );
}

// void main(){
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
