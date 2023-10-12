import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guzogoclone/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: AppColors.yellow),
        child: Center(
          child: Text(
            buttonName,
            style: GoogleFonts.poppins(
                fontSize: 18,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
