import 'package:flutter/material.dart';
import 'package:flutter_test_quad/models/home_model.dart' as model;
import 'package:flutter_test_quad/services/movieservice.dart';
import 'package:flutter_test_quad/widgets/moviecard.dart';
import 'package:flutter_test_quad/screens/detailscreen.dart';
import 'package:flutter_test_quad/screens/searchscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<model.Show> shows = [];

  @override
  void initState() {
    super.initState();
    _fetchShows();
  }

  Future<void> _fetchShows() async {
    final fetchedShows = await MovieService.getFeaturedMovies();
    setState(() {
      shows = fetchedShows;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Image.asset('assets/farmveda.png', height: 50),
        title: Text('Flutter Test Quad'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: shows.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor))
          : ListView(
              children: [
                _buildFeaturedShow(),
                _buildShowList('Trending Now'),
                _buildShowList('Top Picks for You'),
              ],
            ),
    );
  }

  Widget _buildFeaturedShow() {
    final featuredShow = shows.first;
    return Container(
      height: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(featuredShow.image?.original ?? ''),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  featuredShow.name ?? '',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow),
                      label: Text('Play'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.info_outline),
                      label: Text('More Info'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[800],
                        onPrimary: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShowList(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shows.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(show: shows[index]),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 133,
                    child:
                        MovieCard(show: shows[index], showid: shows[index].id),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
