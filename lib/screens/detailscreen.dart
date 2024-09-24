import 'package:flutter/material.dart';
import 'package:flutter_test_quad/models/home_model.dart' as model;

class DetailScreen extends StatelessWidget {
  final model.Show show;

  DetailScreen({required this.show});
  String stripHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(show.name ?? 'Unknown Show'),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    show.image?.original != null
                        ? Image.network(
                            show.image!.original,
                            fit: BoxFit.contain,
                          )
                        : Container(color: Colors.grey),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Genre', show.genres.join(', ')),
                    _buildInfoRow('Premiered', show.premiered ?? 'Unknown'),
                    _buildInfoRow('Status', show.status ?? 'Unknown'),
                    _buildInfoRow(
                        'Runtime', '${show.runtime ?? 'Unknown'} minutes'),
                    _buildInfoRow(
                        'Rating', '${show.rating?.average ?? 'Unknown'}/10'),
                    _buildInfoRow('Network', show.network?.name ?? 'Unknown'),
                    if (show.externals?.imdb != null)
                      _buildInfoRow('IMDB',
                          'https://www.imdb.com/title/${show.externals!.imdb}'),
                    const SizedBox(height: 16),
                    const Text(
                      'Summary',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      show.summary != null
                          ? stripHtmlTags(show.summary!)
                          : 'No summary available',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
