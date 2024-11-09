import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onSubmitted;
  const SearchField({super.key, required this.controller, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        isDense: true,
        fillColor: const Color(0xFFF5F5F5),
        filled: true,
        prefixIcon: Image.asset('images/search.png'),
        hintText: 'Search...',
        hintStyle: const TextStyle(color: Color(0xFFA39B97)),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
