import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/screen/volunteer/volunteer_home_page.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:final_project/widgets/snackbar/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VolunteerComplainScreen extends StatefulWidget {
  const VolunteerComplainScreen({
    super.key,
  });

  @override
  State<VolunteerComplainScreen> createState() => _VolunteerComplainScreenState();
}

class _VolunteerComplainScreenState extends State<VolunteerComplainScreen> {
  TextEditingController complain = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 4,
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
                    BlocConsumer<AppCubitA, AppStateA>(
                      listener: (context, state) {
                        if (state is SupportErrorState) {
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
                        } else if (state is SupportDoneState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: AwesomeSnackbarContent(
                                title: 'Success',
                                message: state.done,
                                contentType: ContentType.success,
                                // color: const Color(0xffC40C0C),
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          );
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return const VolunteerHomeScreen(username: '', email: '',);
                              }));
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
                                await context.read<AppCubitA>().supportData(
                                  complain: complain.text,
                                );
                              }
                            },
                            child: state is SupportLoadingState
                                ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                                : const Text(
                              "Submit",
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
