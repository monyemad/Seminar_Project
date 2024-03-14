import 'package:final_project/screens/layout/aging_page.dart';
import 'package:final_project/screens/layout/dna_page.dart';
import 'package:final_project/screens/layout/matching_page.dart';
import 'package:final_project/screens/layout/profile_page.dart';
import 'package:final_project/screens/layout/setting_page.dart';
import 'package:final_project/screens/sign_in/parent_page.dart';
import 'package:final_project/screens/sign_in/volunteer_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_home(ltr).dart';
import 'package:final_project/widgets/custom_home(rtl).dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('UserName'),
              accountEmail: const Text('Example@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://img.freepik.com/premium-photo/beautiful-cute-anime-girl-innocent-anime-teenage_744422-6819.jpg',
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(
                      'https://piktochart.com/wp-content/uploads/2023/05/large-157-600x330.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfileScreen();
                }));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SettingScreen();
                }));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.support_agent_rounded),
              title: const Text('Support'),
              trailing: ClipOval(
                child: Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child: const Center(
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.bloodtype_rounded),
              title: Text('Test_Results'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            _globalKey.currentState?.openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu_rounded,
                            color: Colors.grey,
                            size: 30,
                          )),
                      const Text(
                        'Sa3dni',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_rounded,
                            color: Colors.grey,
                            size: 30,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomHome2(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: const Text(
                                  "Register as....",
                                  style: TextStyle(fontSize: 20),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return const VolunteerScreen();
                                            }));
                                      }, child: Text("FOUND")),
                                  TextButton(
                                      onPressed: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return const ParentScreen();
                                            }));
                                      }, child: Text("MISSING")),
                                ],
                              );
                            });
                      },
                      image: "assets/images/form.gif",
                      text: "Form"),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomHome(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const DnaScreen();
                            }));
                      },
                      image: "assets/images/dna-image.gif",
                      text: 'DNA\nMatching'),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomHome2(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const EvolutionScreen();
                            }));
                      },
                      image: "assets/images/fea evo.gif",
                      text: 'Features\nEvolution'),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomHome(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const RecognitionScreen();
                          }));
                    },
                    image: 'assets/images/face reco.gif',
                    text: 'Image\nRecognition',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
