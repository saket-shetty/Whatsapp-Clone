import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget profileImageWidget(
    String profileImageUrl, {double radius}) {
  return CircleAvatar(
    radius: radius ?? 20,
    backgroundImage: CachedNetworkImageProvider(profileImageUrl),
  );
}