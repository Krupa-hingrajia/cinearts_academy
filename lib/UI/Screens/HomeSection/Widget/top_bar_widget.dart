import 'package:cinearts_academy_app/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {

  final Color backgroundColor;
  final String image;
  final GestureTapCallback? onTap;

    const TopBarWidget({Key? key, required this.backgroundColor, required this.image, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: displayWidth(context) * .165,
        width: displayWidth(context) * .165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor
        ),
        child: Image.asset(image,scale: 3,),
      ),
    );
  }
}
