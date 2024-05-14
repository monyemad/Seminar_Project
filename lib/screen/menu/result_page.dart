import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';

class AiModelResultScreen extends StatelessWidget {
  const AiModelResultScreen(
      {super.key, this.result,});

  final int? result;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomPop(bottom: 30,),
                  const Image(image: AssetImage(
                      'assets/images/result.png')),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    'AI Model Result',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Result: $result',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
