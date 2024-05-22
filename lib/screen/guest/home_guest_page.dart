
import 'package:final_project/screen/signin/login_page.dart';
import 'package:final_project/widgets/Custom_bgColor.dart';
import 'package:final_project/widgets/snackbar/custom_guest_home.dart';
import 'package:final_project/widgets/home/custom_home(ltr).dart';
import 'package:final_project/widgets/home/custom_home(rtl).dart';
import 'package:flutter/material.dart';

class HomeGuestScreen extends StatefulWidget {
  const HomeGuestScreen({super.key});

  @override
  State<HomeGuestScreen> createState() => _HomeGuestScreenState();
}

class _HomeGuestScreenState extends State<HomeGuestScreen> {
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
                  child: Image.asset(
                    'assets/images/profile 2.jpg',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg image.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: CustomGuestHome(
                    title: 'Oh Snap!',
                    message: 'Please, Login first',
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: CustomGuestHome(
                    title: 'Oh Snap!',
                    message: 'Please, Login first',
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.support_agent_rounded),
              title: const Text('Support'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: CustomGuestHome(
                    title: 'Oh Snap!',
                    message: 'Please, Login first',
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ));
              },
              // trailing: ClipOval(
              //   child: Container(
              //     color: Colors.red,
              //     width: 20,
              //     height: 20,
              //     child: const Center(
              //       child: Text(
              //         '0',
              //         style: TextStyle(fontSize: 12, color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.bloodtype_rounded),
              title: const Text('Test_Results'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: CustomGuestHome(
                    title: 'Oh Snap!',
                    message: 'Please, Login first',
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.report_rounded),
              title: const Text('Complain'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: CustomGuestHome(
                    title: 'Oh Snap!',
                    message: 'Please, Login first',
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ));
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
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }));
                          },
                          icon: const Icon(
                            Icons.logout_rounded,
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
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: CustomGuestHome(
                                            title: 'Oh Snap!',
                                            message: 'Please, Login first',
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                        ));
                                      },
                                      child: const Text("FOUND")),
                                  TextButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: CustomGuestHome(
                                            title: 'Oh Snap!',
                                            message: 'Please, Login first',
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                        ));
                                      },
                                      child: const Text("MISSING")),
                                ],
                              );
                            });
                      },
                      image: "assets/images/form.gif",
                      text: "Report Cases"),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomHome(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: CustomGuestHome(
                            title: 'Oh Snap!',
                            message: 'Please, Login first',
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ));
                      },
                      image: "assets/images/dna-image.gif",
                      text: 'DNA\nMatching'),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomHome2(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: CustomGuestHome(
                            title: 'Oh Snap!',
                            message: 'Please, Login first',
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ));
                      },
                      image: "assets/images/fea evo.gif",
                      text: 'Features\nEvolution'),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomHome(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: CustomGuestHome(
                          title: 'Oh Snap!',
                          message: 'Please, Login first',
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ));
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
