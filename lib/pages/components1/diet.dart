import 'package:flutter/material.dart';
import 'food.dart';

class DietPage extends StatelessWidget {
  final List<List<Food>> _foods = [
    [
      Food(name: 'Apple', calories: 95, nutritionBenefits: 'Rich in fiber and vitamin C'),
      Food(name: 'Almonds', calories: 161, nutritionBenefits: 'Good source of healthy fats and vitamin E'),
      Food(name: 'Tofu', calories: 165, nutritionBenefits: 'High in protein and low in fat'),
    ],
    [
      Food(name: 'Banana', calories: 105, nutritionBenefits: 'Contains potassium and vitamin B6'),
      Food(name: 'Quinoa', calories: 222, nutritionBenefits: 'High in protein and fiber'),
      Food(name: 'Salmon', calories: 206, nutritionBenefits: 'Rich in omega-3 fatty acids and protein'),
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
                                  Text(
                                    '${food.calories} cal',
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
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
}
