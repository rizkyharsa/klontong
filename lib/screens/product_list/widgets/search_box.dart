import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this.onSearch,
  });

  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Search',
        border: OutlineInputBorder(),
      ),
      onSubmitted: onSearch,
    );
  }
}
