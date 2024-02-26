import 'package:flutter/material.dart';

class DnaScreen extends StatelessWidget {
  const DnaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffCDFFD8), Color(0xff94B9FF)],
            stops: [0.2, 0.6],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            // transform: GradientRotation(13)
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
      ),
    );
  }
}
