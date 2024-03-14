import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';

class RecognitionScreen extends StatelessWidget {
  const RecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomPop(),
              const Image(
                image: AssetImage("assets/images/matching image.png"),
              ),
              const SizedBox(
                height: 120,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  'Please import the photo to predict if the image is matched.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.install_mobile_rounded,size: 60,),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  TextButton(onPressed: (){},
                      child: const Text('Import image',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white70,
                      ),))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
