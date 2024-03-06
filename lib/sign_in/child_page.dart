import 'package:final_project/layout/home_page.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:flutter/material.dart';

enum ProductTypeEnum { Female, Male }

class ChildScreen extends StatefulWidget {
  const ChildScreen({super.key});

  @override
  State<ChildScreen> createState() => _ChildScreenState();
}

class _ChildScreenState extends State<ChildScreen> {
  TextEditingController picture = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController current = TextEditingController();
  TextEditingController birth = TextEditingController();
  TextEditingController government = TextEditingController();

  ProductTypeEnum? _productTypeEnum;

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
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Fill in the data",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Child information",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Divider(
                thickness: 3,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 35),
                child: const Text(
                  "Child Name:",
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
                    } else if (value.isNotEmpty) {
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
                  "Child Picture:",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo_rounded,
                        size: 35,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Import image',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 35),
                child: const Text(
                  "Birth certificate:",
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
                  controller: birth,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.camera_alt_rounded),
                      hintText: 'Enter your Birth certificate',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                      ),
                      border: InputBorder.none),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Birth certificate must not be empty';
                    } else if (value.isNotEmpty) {
                      return 'Birth certificate is incorrect';
                    }
                    return null;
                  },
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
                          padding: const EdgeInsets.only(left: 30, right: 4),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.shade200),
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
                                color: Colors.grey.shade200),
                            child: RadioListTile<ProductTypeEnum>(
                              contentPadding: const EdgeInsets.all(0.0),
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
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 35),
                child: const Text(
                  "Age:",
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
                      hintText: 'Enter your Child age',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                      ),
                      border: InputBorder.none),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Age must not be empty';
                    } else if (value.isNotEmpty) {
                      return 'Age is incorrect';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 35),
                child: const Text(
                  "Current Age:",
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
                  controller: current,
                  decoration: const InputDecoration(
                      hintText: 'Enter your Child current age',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                      ),
                      border: InputBorder.none),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Current Age must not be empty';
                    } else if (value.isNotEmpty) {
                      return 'Current Age is incorrect';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 35),
                child: const Text(
                  "Government:",
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
                  keyboardType: TextInputType.name,
                  controller: government,
                  decoration: const InputDecoration(
                      hintText: 'Enter your Government',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                      ),
                      border: InputBorder.none),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Government must not be empty';
                    } else if (value.isNotEmpty) {
                      return 'Government is incorrect';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
                text: 'Submit',
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
