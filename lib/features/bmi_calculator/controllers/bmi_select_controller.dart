import 'package:flutter_riverpod/flutter_riverpod.dart';

final genderSelectProvider = StateProvider<String>((ref) {
  return '';
});
int ageValue = 10;
final ageValProvider = StateProvider.autoDispose((ref) => ageValue);

int _currentHeightValue = 50;
final heightValProvider = StateProvider<int>((ref) {
  return _currentHeightValue;
});

int _currentWeightValue = 25;
final weightValProvider = StateProvider<int>((ref) {
  return _currentWeightValue;
});
