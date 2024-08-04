class Meal {
  final String name;
  final int calories;
  final int proteins;
  final int carbs;
  final int fats;
  final DateTime timestamp;
  final String description;
  final MealType mealType;

  Meal({
    required this.name,
    required this.calories,
    required this.proteins,
    required this.carbs,
    required this.fats,
    required this.timestamp,
    required this.description,
    required this.mealType,
  });
}

enum MealType {
  breakfast,
  lunch,
  dinner,
  snack,
}
