import 'package:flutter/material.dart';

const Color premiumGreen = Color(0xFF006400);

final List<Map<String, dynamic>> categories = [
  {
    'name': 'Offers',
    'icon': const Icon(Icons.local_offer, color: premiumGreen),
  },
  {
    'name': 'Chicken',
    'icon': const Icon(Icons.local_dining, color: premiumGreen),
  },
  {
    'name': 'Rice',
    'iconPath': 'assets/icons/rice.png',
  },
  {
    'name': 'Burger',
    'iconPath': 'assets/icons/burger.png',
  },
  {
    'name': 'Pizza',
    'iconPath': 'assets/icons/pizza.png',
  },
  {
    'name': 'Coffee',
    'iconPath': 'assets/icons/coffee.png',
  },
  {
    'name': 'Salad',
    'iconPath': 'assets/icons/salad.png',
  },
  {
    'name': 'Cake',
    'iconPath': 'assets/icons/cake.png',
  },
];

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Adjusted number of columns
        childAspectRatio: 1.5, // Adjusted aspect ratio for taller items
        mainAxisSpacing: 12, // Adjusted vertical spacing
        crossAxisSpacing: 12, // Adjusted horizontal spacing
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              category.containsKey('icon')
                  ? category['icon'] as Icon
                  : Image.asset(
                      category['iconPath'],
                      width: 50, // Adjusted icon size
                      height: 50, // Adjusted icon size
                    ),
              const SizedBox(height: 8),
              Text(
                category['name'],
                style: const TextStyle(fontSize: 14), // Adjusted font size
              ),
            ],
          ),
        );
      },
    );
  }
}
