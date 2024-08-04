import 'meal.dart';

class DietPlan {
  final String name;
  final String description;
  final Meal breakfast;
  final Meal lunch;
  final Meal dinner;

  DietPlan({
    required this.name,
    required this.description,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
  });
}
