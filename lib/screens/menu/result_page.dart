import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';

class AiModelResultScreen extends StatelessWidget {
  const AiModelResultScreen(
      {super.key, this.result, this.isMale, this.age, this.name});

  final int? result;
  final String? name;
  final bool? isMale;
  final int? age;

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
                    'Name: $name',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Gender: ',
                    // '${isMale ? 'Male' : 'Female'}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Result: $result',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Age: $age',
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
