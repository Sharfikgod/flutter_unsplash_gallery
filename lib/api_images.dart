import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import './model/list_info_api.dart';

class ApiImages with ChangeNotifier {
  List<ListInfoApi> _items = [];

  List<ListInfoApi> get items {
    return [..._items];
  }

  ListInfoApi findById(String id) {
    return _items.firstWhere((img) => img.id == id);
  }

  Future<void> getImages() async {
    try {
      final url =
          'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';
      final response = await http.get(url);
      final List<ListInfoApi> loadedImages = [];
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((data) {
        loadedImages.add(
          ListInfoApi(
            id: data['user']['id'],
            name: data['user']['name'],
            username: data['user']['username'],
            imageUrlAvatar: data['user']['profile_image']['small'],
            imageUrlBig: data['urls']['regular'],
            twitterUserName: data['user']['twitter_username'],
            location: data['user']['location'],
            likes: data['likes'],
          ),
        );
      });
      _items = loadedImages;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
