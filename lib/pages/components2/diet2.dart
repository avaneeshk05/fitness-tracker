import 'package:flutter/material.dart';
import 'food2.dart';

class DietPage2 extends StatelessWidget {
  final List<List<Food>> _foods = [
    [
      Food(name: 'Avocado', calories: 160, fat: 15, protein: 2, carbs: 9, nutritionBenefits: 'Rich in healthy fats and potassium'),
      Food(name: 'Walnuts', calories: 185, fat: 18, protein: 4, carbs: 4, nutritionBenefits: 'Good source of omega-3 fatty acids'),
      Food(name: 'Spinach', calories: 250, fat: 3, protein: 5, carbs: 5, nutritionBenefits: 'High in protein and iron'),
    ],
    [
      Food(name: 'Blueberries', calories: 85, fat: 1, protein: 1, carbs: 21, nutritionBenefits: 'Rich in antioxidants and vitamins'),
      Food(name: 'Sweet Potato', calories: 112, fat: 0, protein: 2, carbs: 26, nutritionBenefits: 'Great source of fiber and vitamins'),
      Food(name: 'Tuna', calories: 179, fat: 1, protein: 39, carbs: 0, nutritionBenefits: 'High in protein and omega-3 fatty acids'),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Plan'),
      ),
      body: ListView.builder(
        itemCount: _foods.length,
        itemBuilder: (context, index) {
          final dayFoods = _foods[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Day ${index + 1}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dayFoods.length,
                itemBuilder: (context, index) {
                  final food = dayFoods[index];
                  return GestureDetector(
                    onTap: () {
                      // Handle tapping on food item
                    },
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    food.name,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _buildNutrientIndicator('Fat', food.fat),
                                      _buildNutrientIndicator('Protein', food.protein),
                                      _buildNutrientIndicator('Carbs', food.carbs),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    food.nutritionBenefits,
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNutrientIndicator(String nutrient, int value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          nutrient,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getColorForNutrient(value),
          ),
          child: Center(
            child: Text(
              value.toString(),
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Color _getColorForNutrient(int value) {
    if (value <= 5) {
      return Colors.green;
    } else if (value <= 10) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
