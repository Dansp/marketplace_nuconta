import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

///A widget for take a photo and make hero animation
class PhotoHeroWidget extends StatefulWidget {
  final String? photo;
  final VoidCallback? onTap;

  const PhotoHeroWidget({ Key? key, this.photo = '', this.onTap}) : super(key: key);
  @override
  _PhotoHeroState createState() => _PhotoHeroState();
}

class _PhotoHeroState extends State<PhotoHeroWidget> {

  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Hero(
        tag: widget.photo ?? 'assets/no_img.png',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            child: OctoImage(
              width: MediaQuery.of(context).size.width,
              image: widget.photo != null ? CachedNetworkImageProvider(widget.photo!) : Image.asset('assets/no_img.png', fit: BoxFit.cover).image,
              errorBuilder:  (context, url, error) => Container(child: Image.asset('assets/no_img.png', fit: BoxFit.cover)),
              fit: BoxFit.fitHeight,
            )
          ),
        ),
      ),
    );
  }
}