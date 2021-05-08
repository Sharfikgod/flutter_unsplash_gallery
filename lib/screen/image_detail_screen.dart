import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_images.dart';

class ImageDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final imageId = ModalRoute.of(context).settings.arguments as String;
    final loadedImage =
        Provider.of<ApiImages>(context, listen: false).findById(imageId);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: loadedImage.id,
                child: Image.network(
                  loadedImage.imageUrlBig,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10),
                Text(
                  'name: ${loadedImage.name}',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'twitter: ${loadedImage.twitterUserName}',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'likes: ${loadedImage.likes}',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  loadedImage.location != null
                      ? 'location: ${loadedImage.location}'
                      : '',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 800,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
