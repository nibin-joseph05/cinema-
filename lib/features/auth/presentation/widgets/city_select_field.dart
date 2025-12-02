import 'package:flutter/material.dart';

class CitySelectField extends StatelessWidget {
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;

  const CitySelectField({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF55951),
            Color(0xFFE3006F),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          dropdownColor: const Color(0xFF120B44),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
          ),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          hint: const Text(
            "Choose your city",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          isExpanded: true,
          items: items
              .map(
                (city) => DropdownMenuItem(
              value: city,
              child: Text(city),
            ),
          )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
