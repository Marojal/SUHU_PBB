// header.dart

import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> cities;
  final String selectedCity;
  final ValueChanged<String> onCityChanged;
  final VoidCallback onMenuPressed;

  const CustomHeader({
    Key? key,
    required this.title,
    required this.cities,
    required this.selectedCity,
    required this.onCityChanged,
    required this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: onMenuPressed,
      ),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (String newCity) {
            onCityChanged(newCity);
          },
          itemBuilder: (BuildContext context) {
            return cities.map((String city) {
              return PopupMenuItem<String>(
                value: city,
                child: Text(city),
              );
            }).toList();
          },
          icon: const Icon(Icons.location_city),
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // Handle notifications button press
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
