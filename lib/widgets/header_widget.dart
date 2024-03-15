import 'package:flutter/material.dart';

import '../shared/theme/app_colors.dart';
import '../shared/theme/app_text_styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: AppColors.grey200,
        style: BorderStyle.solid,
        width: 2,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: screenWidth * 0.55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Apelido', style: AppTextStyles.headerText),
              const SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                height: 31,
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 6, right: 7, bottom: 6),
          decoration: BoxDecoration(
            color: AppColors.grey50,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            children: [
              Image.asset('assets/images/image-profile.png',
                  width: 44, height: 44),
              const SizedBox(width: 12),
              Text('Editar Foto', style: AppTextStyles.headerText),
            ],
          ),
        ),
      ],
    );
  }
}
