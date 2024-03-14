import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/custom_stack.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // BlocBuilder<AppCubitA, AppStateA>(
      //   builder: (context, state) {
      //     if (context.read<AppCubitA>().userData != null) {
      //       return
              Stack(
              children: [
                const CustomBgColor(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomPop(),
                      const CustomStack(),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.black45,
                          ),
                        ),
                        child: const ListTile(
                          style: ListTileStyle.list,
                          // title: Text(
                          //   context.read<AppCubitA>().userData!.name,
                          // ),
                          leading: Text(
                            'User Name:',
                            style: TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.black45,
                          ),
                        ),
                        child: const ListTile(
                          style: ListTileStyle.list,
                          // title: Text(
                          //   context.read<AppCubitA>().userData!.email,
                          // ),
                          leading: Text(
                            'Email:',
                            style: TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.black45,
                          ),
                        ),
                        child: const ListTile(
                          style: ListTileStyle.list,
                          // title: Text(
                          //   context.read<AppCubitA>().userData!.phone,
                          // ),
                          leading: Text(
                            'Phone Number:',
                            style: TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            // );
          // } else {
          //   return const Text(
          //     'ERROR',
          //     style: TextStyle(fontSize: 60),
          //   );
          // }
        // },
      ),
    );
  }
}
