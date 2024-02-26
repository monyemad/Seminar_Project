import 'package:final_project/aging_page.dart';
import 'package:final_project/dna_page.dart';
import 'package:final_project/matching_page.dart';
import 'package:final_project/profile_page.dart';
import 'package:final_project/setting_page.dart';
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
                      'https://piktochart.com/wp-content/uploads/2023/05/large-157-600x338.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return const ProfileScreen();
                    }));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
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
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffCDFFD8), Color(0xff94B9FF)],
              stops: [0.2, 0.6],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              // transform: GradientRotation(13)
            ),
          ),
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
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/dna-image.gif"),
                    backgroundColor: Colors.white38,
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const DnaScreen();
                          }));
                    },
                    child: const Text(
                      'DNA\nMatching',
                      style: TextStyle(fontSize: 20,color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const EvolutionScreen();
                          }));
                    },
                    child: const Text(
                      'Features\nEvolution',
                      style: TextStyle(fontSize: 20,color: Colors.black),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage("assets/images/fea evo.gif"),
                    backgroundColor: Colors.white38,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage("assets/images/face reco.gif"),
                    backgroundColor: Colors.white38,
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const RecognitionScreen();
                          }));
                    },
                    child: const Text(
                      'Image\nRecognition',
                      style: TextStyle(fontSize: 20,color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
