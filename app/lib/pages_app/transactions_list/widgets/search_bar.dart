import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(10.0),
        elevation: 0.0,
        shadowColor: Colors.black38,
        child: TextField(
          // controller: _searchController,
          decoration: InputDecoration(
            fillColor: Colors.black.withOpacity(0.04),
            filled: true,
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'Cerca',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
