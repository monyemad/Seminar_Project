import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/form_field/custom_button.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/snackbar/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DnaResultScreen extends StatefulWidget {
  const DnaResultScreen({
    super.key,
  });

  @override
  State<DnaResultScreen> createState() => _DnaResultScreenState();
}

class _DnaResultScreenState extends State<DnaResultScreen> {
  TextEditingController matching = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBgColor(),
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomPop(
                      bottom: 30,
                    ),
                    const Image(image: AssetImage('assets/images/result.png')),
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      'Dna Result',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(text: "Matching Score:"),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: "Enter your Matching Score",
                      controller: matching,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.bloodtype_rounded,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Matching Score must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        text: "Match",
                        onPressed: () {
                          if (matching.text =="0.5") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: AwesomeSnackbarContent(
                                  title: 'Success',
                                  message: "Dna Result Found",
                                  contentType: ContentType.success,
                                  // color: const Color(0xffC40C0C),
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                            );
                          } else if(matching.text !="0.5"){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: CustomSnackBarError(
                                  message: "Dna result not Found",
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                            );
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
