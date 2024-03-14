import 'package:flutter/material.dart';
import 'package:tarefa_dev_app/data/period.dart';

import '../shared/theme/app_colors.dart';
import '../shared/theme/app_text_styles.dart';

class PeriodItemWidget extends StatelessWidget {
  final Period period;

  const PeriodItemWidget({super.key, required this.period});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(period.name, style: AppTextStyles.subtitle),
              Text('${period.start} à ${period.finished}',
                  style: AppTextStyles.description),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
