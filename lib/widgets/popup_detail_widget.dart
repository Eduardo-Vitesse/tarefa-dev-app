import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/period.dart';
import '../shared/constants/boxes.dart';
import '../shared/context/update_page.dart';
import '../shared/theme/app_colors.dart';
import '../shared/theme/app_text_styles.dart';
import '../shared/utils/my_date.dart';
import 'popup_form_widget.dart';

class PopupDetailWidget extends StatefulWidget {
  final Period period;
  final int index;

  const PopupDetailWidget({
    super.key,
    required this.index,
    required this.period,
  });

  @override
  State<PopupDetailWidget> createState() => _PopupDetailWidgetState();
}

class _PopupDetailWidgetState extends State<PopupDetailWidget> {
  void refreshPage() {
    Provider.of<UpdatePage>(context, listen: false).getUpdatePage();
    Navigator.of(context).pop();
  }

  void handleDelete(index) {
    boxPeriods.deleteAt(index);
    refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(width: 50),
                    const Spacer(),
                    Text(
                      'Detalhes do Período',
                      style: AppTextStyles.popupTitle,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: AppColors.grey200),
                    ),
                  ],
                ),
                Container(
                  height: 39,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 17),
                  decoration: BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Text(
                        widget.period.name,
                        style: AppTextStyles.popupTitle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: size.width,
                  height: 160,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(17),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Começa', style: AppTextStyles.popupTitle),
                            Text(dateFormatter(widget.period.start),
                                style: AppTextStyles.description),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: AppColors.grey200, height: 1),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Termina', style: AppTextStyles.popupTitle),
                            Text(dateFormatter(widget.period.finished),
                                style: AppTextStyles.description),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: AppColors.grey200, height: 1),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Categoria', style: AppTextStyles.popupTitle),
                            Text(widget.period.category,
                                style: AppTextStyles.description),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Meta 1', style: AppTextStyles.popupTitle),
                          Text(widget.period.goalOne,
                              style: AppTextStyles.description),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Meta 2', style: AppTextStyles.popupTitle),
                          Text(widget.period.goalTwo,
                              style: AppTextStyles.description),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => handleDelete(widget.index),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.delete,
                      ),
                      child: Text(
                        'Excluir',
                        style: AppTextStyles.buttonTextRegular,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PopupFormWidget(
                              index: widget.index,
                              period: widget.period,
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: Text(
                        'Editar',
                        style: AppTextStyles.buttonTextRegular,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 42),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
