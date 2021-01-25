

import 'package:meeting_place_app/models/meeting_place.dart';

import 'api_provider/images_provider.dart';

class Repository{
  ImageProvider _imageProvider = ImageProvider();
  Future<List<Hits>> fetchImages()=> _imageProvider.fetchImages();
}