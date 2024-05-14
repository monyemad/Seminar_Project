import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:final_project/cubit/my_app_cubit.dart';
import 'package:final_project/cubit/my_app_state.dart';
import 'package:final_project/screen/volunteer/volunteer_home_page.dart';
import 'package:final_project/widgets/date_and_time/custom_time.dart';
import 'package:final_project/widgets/snackbar/custom_error.dart';
import 'package:final_project/widgets/select_and_radio/custom_select.dart';
import 'package:final_project/widgets/select_and_radio/custom_radio.dart';
import 'package:final_project/widgets/form_field/custom_text.dart';
import 'package:final_project/widgets/form_field/custom_textformfield.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VolunteerLaboratoryScreen extends StatefulWidget {
  const VolunteerLaboratoryScreen({super.key});

  @override
  State<VolunteerLaboratoryScreen> createState() => _VolunteerLaboratoryScreenState();
}

class _VolunteerLaboratoryScreenState extends State<VolunteerLaboratoryScreen> {
  String? branch;
  String? lab;
  String? gender;
  String? type;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController appointment = TextEditingController();

  TimeOfDay _timeOfDay = const TimeOfDay(hour: 10, minute: 30);

  void _showTimePicker() {
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          const CustomBgColor(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SafeArea(
                        child: Text(
                          "Laboratory Reservation Form",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                        indent: 10,
                        endIndent: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Name:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your name',
                        controller: name,
                        prefixIcon: Icons.person_rounded,
                        keyboardType: TextInputType.name,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Full name must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadio(
                        text: "Gender:",
                        title: "Female",
                        value: 'Female',
                        groupValue: gender,
                        title1: "Male",
                        value1: "Male",
                        onChange: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Age:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your age',
                        controller: age,
                        prefixIcon: Icons.perm_contact_calendar_rounded,
                        keyboardType: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'age must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Address:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your street address',
                        controller: address,
                        prefixIcon: Icons.house_rounded,
                        keyboardType: TextInputType.streetAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'street address must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadio(
                        text: "Type:",
                        title: "Parent",
                        value: 'Parent',
                        groupValue: type,
                        title1: "Child",
                        value1: "Child",
                        onChange: (value) {
                          setState(() {
                            type = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Email:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your email',
                        controller: email,
                        prefixIcon: Icons.email_rounded,
                        keyboardType: TextInputType.emailAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'email must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Phone Number:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your phone number',
                        controller: phone,
                        prefixIcon: Icons.phone_rounded,
                        keyboardType: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'phone number must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Laboratory'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomSelect(
                          onChanged: (val) {
                            setState(() {
                              lab = val;
                            });
                          },
                          items: const ['Alfa', 'ElMokhtabar'],
                          text: 'Select a lab',
                          value: lab),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Location:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomSelect(
                          onChanged: (val) {
                            setState(() {
                              branch = val;
                            });
                          },
                          items: const [
                            'New Cairo',
                            'El Nozha',
                            'Second New Cairo',
                            'Badr City',
                            '10th of Ramadan City',
                            'Heliopolis'
                          ],
                          text: 'Choose a Place',
                          value: branch),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: 'Appointment:'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTime(
                          text: _timeOfDay.format(context).toString(),
                          onPressed: _showTimePicker),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<AppCubitA, AppStateA>(
                        listener: (context, state) {
                          if (state is DnaLabErrorState) {
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
                          } else if (state is DnaLabDoneState) {
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
                            Navigator.pushReplacement(context,
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
                                  await context.read<AppCubitA>().dnaData(
                                    name: name.text,
                                    gender: gender.toString(),
                                    age: age.text,
                                    address: address.text,
                                    type: type.toString(),
                                    email: email.text,
                                    phone: phone.text,
                                    lab: lab.toString(),
                                    branch: branch.toString(),
                                    appointment: _timeOfDay.toString(),
                                  );
                                }
                              },
                              child: state is DnaLabLoadingState
                                  ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                                  : const Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          );
                        },
                      ),
                    ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
