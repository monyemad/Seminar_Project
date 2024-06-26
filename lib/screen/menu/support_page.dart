import 'package:final_project/screen/layout/forms/therapy_session_page.dart';
import 'package:final_project/widgets/custom_bgcolor.dart';
import 'package:final_project/widgets/custom_pop.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBgColor(),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10,),
                    const CustomPop(bottom: 30),
                    const Text(
                      'How can we help you?',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 18.0, right: 18),
                      child: Text(
                        "At our support center, we believe in personalized service tailored to your specific needs. Our knowledgeable representatives are here to listen, empathize, and guide you through any challenges you may encounter. We understand that every inquiry is unique, and we're dedicated to finding the best solutions for you.Whether you prefer to reach out via email, phone, or in person, we're here to assist you every step of the way. Your feedback is invaluable to us, as it helps us continually improve our products and services to better meet your needs.",
                        style: TextStyle(color: Colors.black26),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white70,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                color: Colors.deepPurple,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.location_on_rounded,
                                  size: 35,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text(
                                'Location',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text(''),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white70,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                color: Colors.deepPurple,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.phone_rounded,
                                  size: 35,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text(
                                'Phone Number',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text(''),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white70,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                color: Colors.deepPurple,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.email_rounded,
                                  size: 35,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Sa3dniteam@gmail.com',
                                    style: TextStyle(
                                        color: Color(0xff0C359E),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.5),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white70,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                color: Colors.deepPurple,
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const TherapyScreen();
                                  }));
                                },
                                icon: const Icon(
                                  Icons.help_rounded,
                                  size: 35,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                child: const Text(
                                  'Therapy Booking',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const TherapyScreen();
                                  }));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
