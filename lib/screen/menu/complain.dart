import 'package:final_project/screen/layout/dna/laboratory_page.dart';
import 'package:final_project/widgets/form_field/custom_button.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({
    super.key,
  });

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  TextEditingController complain = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomPop(
                bottom: 40,
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Hello! ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: const SizedBox(
                  height: 150,
                  child: Text(
                    'Welcome to our complaint page. We understand that sometimes '
                    'things do not go as expected'
                    'and your feedback is invaluable in helping us '
                    'improve our products and services. Whether it is a minor'
                    ' inconvenience or a significant issue '
                    'we are here to listen and address your concerns promptly '
                    'Please use this platform to voice any complaints you may have ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black26),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: CustomTextFormField(
                  keyboardType: TextInputType.text,
                  controller: complain,
                  hintText: 'ex: write your complain here',
                  prefixIcon: Icons.pending_actions_rounded,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'submit',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LaboratoryScreen();
                    }));
                  })
            ],
          ),
        ],
      ),
    );
  }
}
