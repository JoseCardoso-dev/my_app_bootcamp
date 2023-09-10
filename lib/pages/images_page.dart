import 'package:flutter/material.dart';
import 'package:myappbootcamp/shared/app_images.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({Key? key}) : super(key: key);

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.user1,
          height: 80,
        ),
        Image.asset(
          AppImages.user2,
          height: 80,
        ),
        Image.asset(
          AppImages.user3,
          height: 80,
        ),
        Image.asset(
          AppImages.paisagem1,
          height: 80,
        ),
        Image.asset(
          AppImages.paisagem2,
          height: 80,
        ),
        Image.asset(
          AppImages.paisagem3,
          height: 80,
        )
      ],
    );
  }
}
