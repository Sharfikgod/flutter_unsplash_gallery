import 'package:flutter/foundation.dart';

class ListInfoApi with ChangeNotifier {
  final String id;
  final String name;
  final String username;
  final String imageUrlAvatar;
  final String imageUrlBig;
  final String twitterUserName;
  final String location;
  final int likes;

  ListInfoApi({
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.imageUrlAvatar,
    @required this.imageUrlBig,
    @required this.twitterUserName,
    @required this.location,
    @required this.likes,
  });
}
