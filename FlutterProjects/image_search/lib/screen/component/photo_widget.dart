import 'package:flutter/material.dart';
import 'package:image_search/model/photo_model.dart';

class PhotoWidget extends StatelessWidget {
  final PhotoModel photo;

  const PhotoWidget({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        photo.previewURL,
        fit: BoxFit.cover,
      ),
    );
  }
}
