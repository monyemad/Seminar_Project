import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class CustomGuestHome extends StatelessWidget {
  final String message;
  final String title;

  const CustomGuestHome({
    super.key,
    required this.message,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: ContentType.failure,
      color: const Color(0xff2C4E80),
    );
  }
}
