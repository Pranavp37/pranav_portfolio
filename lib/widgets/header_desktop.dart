import 'package:flutter/material.dart';
import 'package:pranav_portfolio/data/header_data.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, this.textsBtnPress, this.logoPress});
  final VoidCallback? textsBtnPress;
  final VoidCallback? logoPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          colors: [Colors.transparent, CustomColor.bgLight1],
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: logoPress,
            child: const Text(
              'PP',
              style: TextStyle(
                color: CustomColor.yellowSecondary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          for (int i = 0; i < headerBtn.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: textsBtnPress,
                child: Text(
                  headerBtn[i],
                  style: const TextStyle(
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
