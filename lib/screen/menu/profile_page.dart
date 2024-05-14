import 'package:final_project/data/source/source_data.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // @override
  // void initState() {
  //   if (DataSource.isLoadingProfile) {
  //     Future.delayed(Duration.zero, () async {
  //       var data = await DataSource.profileData();
  //       setState(() {
  //         DataSource.userData = data;
  //         DataSource.isLoadingProfile = false;
  //       });
  //     });
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DataSource.isLoadingProfile
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Stack(
                children: [
                  const CustomBgColor(),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                          ),
                          child: ListTile(
                            style: ListTileStyle.list,
                            title: Text(
                              DataSource.userData!.username,
                            ),
                            leading: const Text(
                              'User Name:',
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                          ),
                          child: const ListTile(
                            style: ListTileStyle.list,
                            title: Text(
                              // DataSource.userData!.name,
                              ''
                            ),
                            leading: Text(
                              'Name:',
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                          ),
                          child: const ListTile(
                            style: ListTileStyle.list,
                            title: Text(
                              // DataSource.userData!.phoneNumber,
                              ''
                            ),
                            leading: Text(
                              'Phone Number:',
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                          ),
                          child: const ListTile(
                            style: ListTileStyle.list,
                            title: Text(
                              // DataSource.userData!.age,
                              ''
                            ),
                            leading: Text(
                              'Age:',
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                          ),
                          child: const ListTile(
                            style: ListTileStyle.list,
                            title: Text(
                              // DataSource
                              //     .userData!
                              //     .gender
                              //     .toString(),
                              ''
                            ),
                            leading: Text(
                              'Gender:',
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                          ),
                          child: const ListTile(
                            style: ListTileStyle.list,
                            title: Text(
                              // DataSource.userData!.email,
                              ''
                            ),
                            leading: Text(
                              'Email:',
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     userController.fetchUserData();
                        //       // Navigator.pushReplacement(context,
                        //       //     MaterialPageRoute(builder: (context) {
                        //       //       return const HomeScreen();
                        //       //     }));
                        //   },
                        //   child: const Text('get data'),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
