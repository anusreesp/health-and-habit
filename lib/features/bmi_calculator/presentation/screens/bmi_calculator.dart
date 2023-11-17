import 'package:animate_you/common/oval_text_button.dart';
import 'package:animate_you/features/bmi_calculator/controllers/bmi_calculate_controller.dart';
import 'package:animate_you/features/bmi_calculator/controllers/bmi_select_controller.dart';
import 'package:animate_you/features/bmi_calculator/presentation/widgets/click_cards.dart';
import 'package:animate_you/common/grey_rounded_button.dart';
import 'package:animate_you/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BMICalculator extends ConsumerWidget {
  static const route = '/bmi-calculate';
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    final genderController = ref.watch(genderSelectProvider);
    final ageController = ref.watch(ageValProvider);
    final heightController = ref.watch(heightValProvider);
    final weightController = ref.watch(weightValProvider);

    final evaluteBMIcontroller = ref.watch(evaluateBMIProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Column(
            children: [
              SizedBox(
                height: mediaHeight * 0.04,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Hi, let's calculate BMI first !",
                    style: man24Black,
                  )),
              SizedBox(
                height: mediaHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        ref.read(genderSelectProvider.notifier).state = 'Male';
                      },
                      child: ClickCards(
                          isSelected: genderController == 'Male' ? true : false,
                          child: SizedBox(
                            height: mediaHeight * 0.17,
                            width: mediaWidth * 0.42,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.male,
                                  size: 46,
                                  color: AppTheme.whiteColor,
                                ),
                                Text(
                                  'Male',
                                  style: man20White,
                                )
                              ],
                            ),
                          ))),
                  SizedBox(
                    width: mediaWidth * 0.04,
                  ),
                  GestureDetector(
                      onTap: () {
                        ref.read(genderSelectProvider.notifier).state =
                            'Female';
                      },
                      child: ClickCards(
                          isSelected:
                              genderController == 'Female' ? true : false,
                          child: SizedBox(
                            height: mediaHeight * 0.17,
                            width: mediaWidth * 0.42,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.female,
                                  size: 46,
                                  color: AppTheme.whiteColor,
                                ),
                                Text(
                                  'Female',
                                  style: man20White,
                                )
                              ],
                            ),
                          )))
                ],
              ),
              SizedBox(
                height: mediaHeight * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClickCards(
                    isSelected: true,
                    child: SizedBox(
                      height: mediaHeight * 0.16,
                      // width: mediaWidth * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Height',
                            style: man20White,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                "$heightController",
                                style: man24White.merge(const TextStyle(
                                    fontWeight: FontWeight.w700)),
                              ),
                              SizedBox(
                                width: mediaWidth * 0.005,
                              ),
                              const Text(
                                "cm",
                                style: man20White,
                              ),
                            ],
                          ),
                          Slider(
                              value: heightController.toDouble(),
                              max: 250,
                              min: 50,
                              thumbColor: AppTheme.teal1Color,
                              activeColor: AppTheme.teal1Color,
                              inactiveColor: AppTheme.darkGrey1Color,
                              onChanged: (value) {
                                ref.watch(heightValProvider.notifier).state =
                                    value.round();
                              }),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: mediaHeight * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
                  children: [
                    ClickCards(
                        isSelected: true,
                        child: SizedBox(
                          height: mediaHeight * 0.22,
                          width: mediaWidth * 0.42,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Age",
                                style: man20White,
                              ),
                              Text(
                                "$ageController",
                                style: man26White,
                              ),
                              SizedBox(
                                width: mediaWidth * 0.005,
                              ),
                              SizedBox(
                                height: mediaHeight * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GreyRoundedButton(
                                      onTap: () {
                                        ref
                                            .read(ageValProvider.notifier)
                                            .state = ageController + 1;
                                      },
                                      iconName: Icons.add),
                                  SizedBox(
                                    width: mediaWidth * 0.02,
                                  ),
                                  GreyRoundedButton(
                                      onTap: () {
                                        ref
                                            .read(ageValProvider.notifier)
                                            .state = ageController - 1;
                                      },
                                      iconName: Icons.horizontal_rule),
                                ],
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      width: mediaWidth * 0.04,
                    ),
                    ClickCards(
                        isSelected: true,
                        child: SizedBox(
                          height: mediaHeight * 0.22,
                          width: mediaWidth * 0.42,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Weight",
                                style: man20White,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    "$weightController",
                                    style: man26White,
                                  ),
                                  SizedBox(
                                    width: mediaWidth * 0.005,
                                  ),
                                  const Text(
                                    "kg",
                                    style: man20White,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: mediaHeight * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GreyRoundedButton(
                                      onTap: () {
                                        ref
                                            .read(weightValProvider.notifier)
                                            .state = weightController + 1;
                                      },
                                      iconName: Icons.add),
                                  SizedBox(
                                    width: mediaWidth * 0.02,
                                  ),
                                  GreyRoundedButton(
                                      onTap: () {
                                        ref
                                            .read(weightValProvider.notifier)
                                            .state = weightController - 1;
                                      },
                                      iconName: Icons.horizontal_rule),
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: mediaHeight * 0.03,
              ),
              if (evaluteBMIcontroller is BMILoaded)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClickCards(
                      isSelected: false,
                      child: Container(
                        height: mediaHeight * 0.14,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your BMI",
                              style: man20Blue,
                            ),
                            Text(
                              "${evaluteBMIcontroller.result} ",
                              style: man26White,
                            ),
                          ],
                        ),
                      )),
                ),
              if (evaluteBMIcontroller is BMILoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OvalTextButton(
          onTap: () {
            ref.read(evaluateBMIProvider.notifier).calculateBMI();
          },
          title: 'Calculate',
          height: mediaHeight * 0.07,
          textStyle:
              man24White.merge(const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
