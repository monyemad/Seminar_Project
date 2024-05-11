import 'package:final_project/screen/layout/dna/laboratory_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';

class DnaScreen extends StatelessWidget {
  const DnaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomPop(bottom: 40,),
                  const Image(
                      image: AssetImage(
                          'assets/images/DNA 1.png'
                      ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: const Image(
                            image: AssetImage(
                                'assets/images/lab_icon.png'
                            ),
                          height: 160,
                          width: 160,
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const LaboratoryScreen();
                          }));
                        },
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        child: const Text(
                          'Alfa\nlaboratories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const LaboratoryScreen();
                          }));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: const Image(
                            image: AssetImage(
                                'assets/images/lab_icon.png'
                            ),
                          height: 160,
                          width: 160,
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const LaboratoryScreen();
                          }));
                        },
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        child: const Text(
                          'Al Mokhtabar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const LaboratoryScreen();
                          }));
                        },
                      ),
                    ],
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
