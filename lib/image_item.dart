import 'package:flutter/material.dart';
import './screen/image_detail_screen.dart';

class ImageItem extends StatelessWidget {
  final String id;
  final String name;
  final String userName;
  final String imgUrlAvatar;
  final String imgUrlBig;

  ImageItem(
    this.id,
    this.name,
    this.userName,
    this.imgUrlAvatar,
    this.imgUrlBig,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ImageDetailScreen.routeName,
          arguments: id,
        );
      },
      child: ListTile(
        title: Text(name),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imgUrlAvatar),
        ),
      ),
    );
  }
}
