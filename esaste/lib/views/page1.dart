import 'package:esaste/components/buttons.dart';
import 'package:esaste/components/colors.dart';
import 'package:esaste/components/paddings.dart';
import 'package:esaste/images/imagePath.dart';
import 'package:esaste/views/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String _title = "Find your \nthe perfect";
  final String _propertyText = "property";
  final String _subtitle =
      "Post your requirements and \nget highly relevant matches easily";
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      height: deviceSize.height,
      color: ProjectColors.chineseBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Tittles(
              title: _title, propertyText: _propertyText, subtitle: _subtitle),
          _Image(deviceSize: deviceSize)
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.deviceSize,
  });

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _StartPageImage(path: ImagesPath.startPageApartment, size: deviceSize),
        ProjectCircleButton(
          page: Page2(),
          icon: const Icon(
            Icons.navigate_next_sharp,
          ),
          color: ProjectColors.isabelline,
        )
      ],
    );
  }
}

class _Tittles extends StatelessWidget {
  const _Tittles({
    required String title,
    required String propertyText,
    required String subtitle,
  })  : _title = title,
        _propertyText = propertyText,
        _subtitle = subtitle;

  final String _title;
  final String _propertyText;
  final String _subtitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: ProjectPaddings.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectTextW(
              title: _title,
              color: ProjectColors.isabelline,
            ),
            ProjectTextW(
              title: _propertyText,
              color: ProjectColors.flax,
            ),
            Padding(
              padding: ProjectPaddings.onlyTop,
              child: Text(
                _subtitle,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ProjectColors.isabelline),
              ),
            )
            //   ProjectTextW(title: _subtitle),
          ],
        ),
      ),
    );
  }
}

class ProjectTextW extends StatelessWidget {
  final String title;
  final Color color;
  const ProjectTextW({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(color: color),
    );
  }
}

class _StartPageImage extends StatelessWidget {
  final String path;
  final Size size;

  const _StartPageImage({
    required this.path,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height / 2,
        width: size.width,
        child: Image(
          image: AssetImage(
            path,
          ),
          fit: BoxFit.cover,
        ));
  }
}
