import 'dart:math';

import 'package:animate_you/features/bmi_calculator/controllers/bmi_select_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final evaluateBMIProvider =
    StateNotifierProvider<BMIcalculateController, BMIStates>((ref) {
  final height = ref.watch(heightValProvider);
  final weight = ref.watch(weightValProvider);

  return BMIcalculateController(height, weight);
});

class BMIcalculateController extends StateNotifier<BMIStates> {
  final int height, weight;

  BMIcalculateController(this.height, this.weight) : super(BMIInitialState());

  calculateBMI() {
    try {
      state = BMILoading();
      double bmi = (weight / pow(height / 100, 2));
      OutputString result = OutputString(height, weight, bmi);

      state = BMILoaded(result.calculatedResult(), result.status());
    } catch (e) {
      debugPrint("_____________________________________ $e");
      state = BMIError(e.toString());
    }
  }
}

abstract class BMIStates {}

class BMIInitialState extends BMIStates {}

class BMILoading extends BMIStates {}

class BMILoaded extends BMIStates {
  final String result, status;
  BMILoaded(this.result, this.status);
}

class BMIError extends BMIStates {
  final String error;
  BMIError(this.error);
}

class OutputString {
  final int height, weight;
  final double BMI;

  OutputString(this.height, this.weight, this.BMI);

  calculatedResult() {
    return BMI.toStringAsFixed(1);
  }

  status() {
    if (BMI >= 25) {
      return 'OVERWEIGHT';
    } else if (BMI >= 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }
}
