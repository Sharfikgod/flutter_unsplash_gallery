import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_images.dart';
import '../image_item.dart';

class Galery extends StatelessWidget {
  Future<void> _refreshImages(BuildContext context) async {
    await Provider.of<ApiImages>(context, listen: false).getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galery'),
      ),
      body: FutureBuilder(
          future: _refreshImages(context),
          builder: (ctx, res) => res.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => _refreshImages(context),
                  child: Consumer<ApiImages>(
                    builder: (ctx, imagesData, _) => Padding(
                      padding: EdgeInsets.all(8),
                      child: ListView.builder(
                        itemCount: imagesData.items.length,
                        itemBuilder: (_, i) => Column(
                          children: [
                            ImageItem(
                              imagesData.items[i].id,
                              imagesData.items[i].name,
                              imagesData.items[i].username,
                              imagesData.items[i].imageUrlAvatar,
                              imagesData.items[i].imageUrlBig,
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
