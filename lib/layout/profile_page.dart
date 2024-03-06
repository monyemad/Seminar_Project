import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIraIxLFndsHnK34RQm1q525ZHz77CFY2vCw&usqp=CAU"),
                      backgroundColor: Colors.white70,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                              style: BorderStyle.solid, color: Colors.black26),
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.photo_camera_outlined)),
                      ),
                    )
                  ],
                ),
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
                      style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
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
                      style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
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
                      style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
