import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefa_dev_app/shared/constants/boxes.dart';
import 'package:tarefa_dev_app/shared/context/update_page.dart';
import 'package:tarefa_dev_app/widgets/period_item_widget.dart';
import 'package:tarefa_dev_app/widgets/popup_detail_widget.dart';
import 'package:tarefa_dev_app/widgets/popup_form_widget.dart';

import '../data/period.dart';
import '../shared/theme/app_colors.dart';
import '../shared/theme/app_text_styles.dart';
import '../widgets/header_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var data = context.watch<UpdatePage>().isUpdated;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const Icon(Icons.keyboard_arrow_left),
        title: Text('Configurações', style: AppTextStyles.heading),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 26),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              const SizedBox(height: 29),
              const Divider(color: AppColors.grey200, height: 2),
              const SizedBox(height: 16),
              Text('Períodos', style: AppTextStyles.subtitle),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.grey100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 23),
                  child: ListView.builder(
                      itemCount: boxPeriods.length,
                      itemBuilder: (context, index) {
                        Period period = boxPeriods.getAt(index);
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return PopupDetailWidget(
                                  index: index,
                                  period: period,
                                );
                              },
                            );
                          },
                          child: PeriodItemWidget(period: period),
                        );
                      }),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 24,
                    constraints:
                        const BoxConstraints(maxWidth: double.infinity),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primary,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const PopupFormWidget();
                          },
                        );
                      },
                      child: Center(
                        child: Text(
                          'Adicionar Período',
                          style: AppTextStyles.buttonTextSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/image-profile.png',
                      width: 51, height: 51),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('João', style: AppTextStyles.userName),
                      Text(
                        'Sair',
                        style: AppTextStyles.link.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
