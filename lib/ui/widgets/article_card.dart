import 'package:flutter/material.dart';

import '../../models/article.dart';
import '../../services/news_service.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          article.urlToImage != null
              ? Image.network(
            article.urlToImage!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                color: Colors.grey,
                child: Center(child: Icon(Icons.broken_image, size: 50)),
              );
            },
          )
              : Container(
            height: 200,
            color: Colors.grey,
            child: Center(child: Icon(Icons.image, size: 50)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.title ?? 'No title',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(article.description ?? 'No description'),
          ),
        ],
      ),
    );
  }
}
