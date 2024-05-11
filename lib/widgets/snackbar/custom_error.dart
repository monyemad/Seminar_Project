import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class CustomSnackBarError extends StatelessWidget {
  final String message;

  const CustomSnackBarError({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AwesomeSnackbarContent(
      title: 'Error',
      message: message,
      contentType: ContentType.failure,
      color: const Color(0xffC40C0C),
    );
  }
}
