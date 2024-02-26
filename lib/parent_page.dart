import 'package:final_project/child_page.dart';
import 'package:flutter/material.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {

  TextEditingController address = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController relation = TextEditingController();
  TextEditingController national = TextEditingController();
  TextEditingController record = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffCDFFD8), Color(0xff94B9FF)],
                stops: [0.2, 0.6],
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                // transform: GradientRotation(13)
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Fill in the data",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Parent information",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Divider(
                  thickness: 3,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 35),
                  child: const Text(
                    "First_Name",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.grey.shade300)),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: name,
                    decoration: const InputDecoration(
                        hintText: 'Enter your First_Name',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'First_Name must not be empty';
                      }else if (value.isNotEmpty){
                        return 'First_Name is incorrect';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 35),
                  child: const Text(
                    "Last_Name",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.grey.shade300)),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: name,
                    decoration: const InputDecoration(
                        hintText: 'Enter your Last_Name',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Last_Name must not be empty';
                      }else if (value.isNotEmpty){
                        return 'Last_Name is incorrect';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 35),
                  child: const Text(
                    "Phone Number",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.grey.shade300)),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phone,
                    decoration: const InputDecoration(
                        hintText: 'Enter your phone Number',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'phone Number must not be empty';
                      }else if (value.isNotEmpty){
                        return 'phone Number is incorrect';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 35),
                  child: const Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.grey.shade300)),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: address,
                    decoration: const InputDecoration(
                        hintText: 'Enter your Address',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Address must not be empty';
                      }else if (value.isNotEmpty){
                        return 'Address is incorrect';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 35),
                  child: const Text(
                    "National number",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.grey.shade300)),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: national,
                    decoration: const InputDecoration(
                        hintText: 'Enter your National number',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'National number must not be empty';
                      }else if (value.isNotEmpty){
                        return 'National Number is incorrect';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 35),
                  child: const Text(
                    "Relative Relation",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.grey.shade300)),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: relation,
                    decoration: const InputDecoration(
                        hintText: 'Enter your Relative Relation',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Relation must not be empty';
                      }else if (value.isNotEmpty){
                        return 'Relation is incorrect';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "Record Number",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.grey.shade300)),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: record,
                    decoration: const InputDecoration(
                        hintText: 'Enter your Record number',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                        border: InputBorder.none),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    minimumSize: const Size(200, 50),
                    padding: const EdgeInsets.all(12),
                    side: const BorderSide(
                        style: BorderStyle.solid, color: Colors.black12),
                    backgroundColor: Colors.orange.shade300,
                  ),
                  onPressed: () {
                    // if (formkey.currentState!.validate())
                    // {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const ChildScreen();
                          }));
                    // }
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
