import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/snackbar/custom_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DnaResultScreen extends StatefulWidget {
  const DnaResultScreen({
    super.key,
  });

  @override
  State<DnaResultScreen> createState() => _DnaResultScreenState();
}

class _DnaResultScreenState extends State<DnaResultScreen> {
  TextEditingController dna = TextEditingController();
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
                    const CustomText(text: "DNA Code:"),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      hintText: "Enter your DNA Code",
                      controller: dna,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.bloodtype_rounded,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'DNA Code must not be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<AppCubitA, AppStateA>(
                      listener: (context, state) {
                        if (state is DnaResultErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: CustomSnackBarError(
                                message: state.error,
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          );
                        } else if (state is DnaResultDoneState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.done),
                              backgroundColor: Colors.grey.shade50,
                              elevation: 10,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(15),
                                  topStart: Radius.circular(15)
                                )
                              ),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return SizedBox(
                          width: 220,
                          child: MaterialButton(
                            elevation: 12,
                            padding: const EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: const Color(0xff0C359E),
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                await context
                                    .read<AppCubitA>()
                                    .result(child_dna: dna.text);
                              }
                            },
                            child: state is DnaResultLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(
                                    "Result",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
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
