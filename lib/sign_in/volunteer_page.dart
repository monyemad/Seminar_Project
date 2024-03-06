import 'package:final_project/layout/home_page.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:flutter/material.dart';

enum ProductTypeEnum { Female, Male }

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({super.key});

  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {

  TextEditingController address = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController seen = TextEditingController();
  TextEditingController national = TextEditingController();
  TextEditingController age = TextEditingController();

  ProductTypeEnum? _productTypeEnum;

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
                  "Volunteer information",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Divider(
                  thickness: 3,
                  indent: 10,
                  endIndent: 10,
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
                    "Picture:",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.install_mobile_rounded,size: 35,),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      TextButton(onPressed: (){},
                          child: const Text('Import image',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white70,
                            ),))
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 35),
                  child: const Text(
                    "Child Name",
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
                        hintText: 'Enter your Child Name',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Child Name must not be empty';
                      }else if (value.isNotEmpty){
                        return 'Child Name is incorrect';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 35),
                  child: const Text(
                    "Last Seen",
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
                    controller: seen,
                    decoration: const InputDecoration(
                        hintText: 'Enter child last seen',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'child last seen must not be empty';
                      }else if (value.isNotEmpty){
                        return 'child last seen is incorrect';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "Child Age",
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
                    controller: age,
                    decoration: const InputDecoration(
                        hintText: 'Enter child age',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                        border: InputBorder.none),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 35),
                      child: const Text(
                        'Gender :',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30,right: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.shade200
                              ),
                              child: RadioListTile<ProductTypeEnum>(
                                contentPadding: const EdgeInsets.all(0.0),
                                title: Text(ProductTypeEnum.Female.name),
                                value: ProductTypeEnum.Female,
                                groupValue: _productTypeEnum,
                                onChanged: (value) {
                                  setState(() {
                                    _productTypeEnum = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.shade200
                              ),
                              child: RadioListTile<ProductTypeEnum>(
                                contentPadding: const EdgeInsets.all(0.0),
                                // tileColor: Colors.deepPurple.shade100,
                                // dense: true,
                                // shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(15)
                                // ),
                                title: Text(ProductTypeEnum.Male.name),
                                value: ProductTypeEnum.Male,
                                groupValue: _productTypeEnum,
                                onChanged: (value) {
                                  setState(() {
                                    _productTypeEnum = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                CustomButton(
                    text: "Submit",
                    onPressed: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      }));
                }),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
