import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';

class DnaScreen extends StatelessWidget {
  const DnaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          CustomBgColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPop(),
              Image(
                  image: AssetImage(
                      'assets/images/DNA 1.png'
                  ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Image(
                      image: AssetImage(
                          'assets/images/lab_icon.png'
                      ),
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Alfa\nlaboratories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Image(
                      image: AssetImage(
                          'assets/images/lab_icon.png'
                      ),
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Al Mokhtabar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
