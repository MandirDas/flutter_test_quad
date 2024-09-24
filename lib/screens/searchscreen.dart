import 'package:flutter/material.dart';
import 'package:flutter_test_quad/models/home_model.dart';
import 'package:flutter_test_quad/screens/detailscreen.dart';
import 'package:flutter_test_quad/services/movieservice.dart';
import 'package:flutter_test_quad/widgets/moviecard.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Show> searchResults = [];
  TextEditingController _searchController = TextEditingController();

  void _searchShows(String query) async {
    if (query.isNotEmpty) {
      final results = await MovieService.searchMovies(query);
      setState(() {
        searchResults = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Search for shows',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
          ),
          onChanged: _searchShows,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(show: searchResults[index]),
                ),
              );
            },
            child: MovieCard(
                show: searchResults[index], showid: searchResults[index].id),
          );
        },
      ),
    );
  }
}
