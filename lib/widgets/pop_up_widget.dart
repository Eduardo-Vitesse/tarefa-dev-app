import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefa_dev_app/data/period.dart';
import 'package:tarefa_dev_app/pages/settings_page.dart';
import 'package:tarefa_dev_app/shared/constants/boxes.dart';
import 'package:tarefa_dev_app/shared/context/update_page.dart';

import '../shared/constants/categories_list.dart';
import '../shared/mixins/popup_fields_mixin.dart';
import '../shared/theme/app_colors.dart';
import '../shared/theme/app_text_styles.dart';

class PopUpWidget extends StatefulWidget {
  final Period? period;
  final int? index;

  const PopUpWidget({super.key, this.period, this.index});

  @override
  State<PopUpWidget> createState() => _PopUpWidgetState();
}

class _PopUpWidgetState extends State<PopUpWidget> with PopupFieldsMixin {
  final InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      color: AppColors.grey250,
      style: BorderStyle.solid,
      width: 1,
    ),
  );
  late String _categoryValue;

  void refreshPage() {
    Provider.of<UpdatePage>(context, listen: false).getUpdatePage();
    Navigator.of(context).pop();
  }

  void navigate() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const SettingsPage();
    }));
  }

  void handleSave() {
    boxPeriods.put(
      'key_${DateTime.now().toIso8601String()}',
      Period(
        name: periodNameValue.text,
        start: periodStartValue.text,
        finished: periodFinishedValue.text,
        category: _categoryValue,
        goalOne: periodGoalOneValue.text,
        goalTwo: periodGoalTwoValue.text,
      ),
    );
    refreshPage();
  }

  void handleUpdate(index) {
    boxPeriods.putAt(
      index,
      Period(
        name: periodNameValue.text,
        start: periodStartValue.text,
        finished: periodFinishedValue.text,
        category: _categoryValue,
        goalOne: periodGoalOneValue.text,
        goalTwo: periodGoalTwoValue.text,
      ),
    );
    refreshPage();
  }

  void handleDelete() {
    if (widget.index != null) {
      var ableToDelete = widget.index;
      boxPeriods.deleteAt(ableToDelete!);
      refreshPage();
    }
  }

  @override
  void initState() {
    periodNameValue.text = widget.index == null ? '' : widget.period!.name;
    periodStartValue.text = widget.index == null ? '' : widget.period!.start;
    periodFinishedValue.text =
        widget.index == null ? '' : widget.period!.finished;
    _categoryValue = widget.index == null
        ? CategoriesList.list.first
        : widget.period!.category;
    periodGoalOneValue.text =
        widget.index == null ? '' : widget.period!.goalOne;
    periodGoalTwoValue.text =
        widget.index == null ? '' : widget.period!.goalTwo;

    super.initState();
  }

  @override
  void dispose() {
    disposeTec();
    super.dispose();
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
                      'Novo Período',
                      style: AppTextStyles.popupTitle,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: AppColors.grey200),
                    ),
                  ],
                ),
                SizedBox(
                  height: 39,
                  child: TextField(
                    controller: periodNameValue,
                    autofocus: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      label: Text('Nomeie seu período',
                          style: AppTextStyles.inputLabelText),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors.grey100,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: size.width,
                  height: 160,
                  decoration: BoxDecoration(
                    color: widget.index == null
                        ? AppColors.grey100
                        : AppColors.background,
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
                            SizedBox(
                              width: 120,
                              height: 29,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: periodStartValue,
                                autofocus: false,
                                decoration: InputDecoration(
                                  enabledBorder: border,
                                  focusedBorder: border,
                                  filled: true,
                                  fillColor: AppColors.background,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: AppColors.grey200, height: 1),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Termina', style: AppTextStyles.popupTitle),
                            SizedBox(
                              width: 120,
                              height: 29,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: periodFinishedValue,
                                autofocus: false,
                                decoration: InputDecoration(
                                  enabledBorder: border,
                                  focusedBorder: border,
                                  filled: true,
                                  fillColor: AppColors.background,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: AppColors.grey200, height: 1),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Categoria', style: AppTextStyles.popupTitle),
                            Container(
                              width: 120,
                              height: 29,
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    color: AppColors.grey250, width: 1),
                              ),
                              child: Center(
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  style: AppTextStyles.popupDropDown,
                                  items:
                                      CategoriesList.list.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  value: _categoryValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _categoryValue = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
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
                          SizedBox(
                            width: 64,
                            height: 29,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: periodGoalOneValue,
                              autofocus: false,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: border,
                                focusedBorder: border,
                                label: Text(
                                  'Un',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.inputLabelText,
                                ),
                                filled: true,
                                fillColor: AppColors.background,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Meta 2', style: AppTextStyles.popupTitle),
                          SizedBox(
                            width: 64,
                            height: 29,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: periodGoalTwoValue,
                              autofocus: false,
                              decoration: InputDecoration(
                                enabledBorder: border,
                                focusedBorder: border,
                                label: Text(
                                  'Un',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.inputLabelText,
                                ),
                                filled: true,
                                fillColor: AppColors.background,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                widget.index == null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: handleSave,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            child: Text(
                              'Concluir',
                              style: AppTextStyles.buttonTextRegular,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: handleDelete,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.delete,
                            ),
                            child: Text(
                              'Excluir',
                              style: AppTextStyles.buttonTextRegular,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => handleUpdate(widget.index),
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
