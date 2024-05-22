import 'package:final_project/screen/layout/aging_page.dart';
import 'package:final_project/screen/layout/dna/dna_page.dart';
import 'package:final_project/screen/layout/forms/parent_form_page.dart';
import 'package:final_project/screen/layout/matching_page.dart';
import 'package:final_project/screen/menu/complain.dart';
import 'package:final_project/screen/menu/result_page.dart';
import 'package:final_project/screen/menu/setting/setting_page.dart';
import 'package:final_project/screen/menu/support_page.dart';
import 'package:final_project/widgets/home/custom_home(ltr).dart';
import 'package:final_project/widgets/home/custom_home(rtl).dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  final String email;
  const HomeScreen({super.key, required this.username, required this.email});

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
              accountName: Text(widget.username),
              accountEmail: Text(widget.email),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile 2.jpg',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                // color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg image.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SupportScreen();
                }));
              },
            ),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.bloodtype_rounded),
                title: const Text('Test_Results'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DnaResultScreen();
                  }));
                }),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.report_rounded),
              title: const Text('Complain'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ComplainScreen();
                }));
              },
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
                    height: 20,
                  ),
                  CustomHome2(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: const Text(
                                  "Report as....",
                                  style: TextStyle(fontSize: 20),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const ParentScreen();
                                        }));
                                      },
                                      child: const Text("MISSING")),
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
                      text: 'Laboratory\nReservation'),
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
