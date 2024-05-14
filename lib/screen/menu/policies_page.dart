import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';

class PolicyScreen extends StatefulWidget {
  const  PolicyScreen ({
    super.key,
  });

  @override
  State< PolicyScreen > createState() => _PolicyScreen ();
}

class _PolicyScreen  extends State< PolicyScreen > {
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
                            height: 700,
                            child: Text('Our reporting protocol is the cornerstone'
                                ' of our missing children application, '
                                'ensuring that reported cases are handled efficiently,'
                                ' accurately, and with the utmost sensitivity.'
                                ' Below is a comprehensive overview of our reporting protocol’'
                                'User Reporting: Users are encouraged to report cases of missing '
                                'children through the designated reporting feature within the application. '
                                'This feature is easily accessible from the app main '
                                'interface and guides users through the reporting process step by step'
                                '	Required Information: When submitting a missing child report, '
                                'users are prompted to provide essential information such as the child^s name,'
                                ' age, physical description, last known location, and any relevant '
                                'details that may aid in the search efforts'
                                'Verification Process: Each reported case undergoes a'
                                ' thorough verification process to ensure its accuracy'
                                ' and validity. Our team of trained moderators reviews '
                                'all submitted reports and may request additional '
                                'information or clarification from the user if needed.'
                                'Cross-Referencing: Reported cases are cross-referenced '
                                'with official databases and sources to verify the '
                                'authenticity of the information provided. This may '
                                'include contacting relevant authorities or organizations '
                                'involved in the search for missing children'
                                'Privacy Protection: We prioritize the privacy and '
                                ' of both the missing children and the users reporting '
                                'them. Personal information shared in missing child'
                                ' reports is handled with the utmost confidentiality'
                                ' and is only disclosed to authorized personnel'
                                ' involved in the search and rescue efforts'
                                'Real-Time Updates: Users receive real-time updates '
                                'on the status of reported cases, including any '
                                'developments or sightings related to the missing '
                                'child. This transparency fosters trust and engagement'
                                ' within our community of users and encourages active '
                                'participation in the search efforts.'
                                'Collaboration with Authorities: We collaborate '
                                'closely with law enforcement agencies, child '
                                'welfare organizations, and other relevant stakeholders'
                                ' to facilitate swift and coordinated responses to reported '
                                'cases. This collaborative approach enhances the '
                                'effectiveness of our search and rescue efforts '
                                'and maximizes the chances of reuniting missing '
                                'children with their families.'
                                'Follow-Up Support: After a missing child has been '
                                'located or reunited with their family, we provide '
                                'follow-up support to ensure their well-being and '
                                'recovery. This may include connecting them with '
                                'counseling services, legal assistance, or other resources as needed.'
                                'By adhering to our reporting protocol, we strive'
                                ' to harness the collective power of our '
                                'community to make a meaningful difference in '
                                'the lives of missing children and their families. Together, we can work towards creating a safer and more secure world for all children.'






                              ,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black26),
                            ),
                          ),
                        ),
                        // Container(
                        //   height: MediaQuery
                        //       .of(context)
                        //       .size
                        //       .height / 4,
                        //   child: CustomTextFormField(
                        //     keyboardType: TextInputType.text,
                        //     controller: complain,
                        //     hintText: 'ex: write your complain here',
                        //     prefixIcon: Icons.pending_actions_rounded,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        // BlocConsumer<AppCubitA, AppStateA>(
                        //   listener: (context, state) {
                        //     if (state is SupportErrorState) {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(
                        //           content: CustomSnackBarError(
                        //             message: state.error,
                        //           ),
                        //           behavior: SnackBarBehavior.floating,
                        //           backgroundColor: Colors.transparent,
                        //           elevation: 0,
                        //         ),
                        //       );
                        //     } else if (state is SupportDoneState) {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(
                        //           content: AwesomeSnackbarContent(
                        //             title: 'Success',
                        //             message: state.done,
                        //             contentType: ContentType.success,
                        //             // color: const Color(0xffC40C0C),
                        //           ),
                        //           behavior: SnackBarBehavior.floating,
                        //           backgroundColor: Colors.transparent,
                        //           elevation: 0,
                        //         ),
                        //       );
                        //       Navigator.push(context,
                        //           MaterialPageRoute(builder: (context) {
                        //             return VolunteerHomeScreen(username: '', email: '',);
                        //           }));
                        //     }
                        //   },
                        //   builder: (context, state) {
                        //     return SizedBox(
                        //       width: 220,
                        //       child: MaterialButton(
                        //         elevation: 12,
                        //         padding: const EdgeInsets.all(12),
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(15),
                        //         ),
                        //         color: const Color(0xff0C359E),
                        //         onPressed: () async {
                        //           if (formkey.currentState!.validate()) {
                        //             await context.read<AppCubitA>().supportData(
                        //               complain: complain.text,
                        //             );
                        //           }
                        //         },
                        //         child: state is SupportLoadingState
                        //             ? const Center(
                        //           child: CircularProgressIndicator(
                        //             color: Colors.white,
                        //           ),
                        //         )
                        //             : const Text(
                        //           "Done",
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 20,
                        //           ),
                        //         ),
                        //       ),


                      ] ),
                  // const SizedBox(
                  //   height: 10,
                  // )
                ))],
        ),
      ),
    );
  }}