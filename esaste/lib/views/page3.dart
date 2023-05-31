import 'package:esaste/components/buttons.dart';
import 'package:esaste/images/imagePath.dart';
import 'package:esaste/models/apartmentModel.dart';
import 'package:flutter/material.dart';

import '../components/colors.dart';
import '../components/paddings.dart';

class Page3 extends StatefulWidget {
  final Apartment apartment;
  const Page3({super.key, required this.apartment});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final String _price = "Price:";
  final String _loaction = "Location:";

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ProjectColors.isabelline,
      body: SafeArea(
        child: Container(
          color: ProjectColors.isabelline,
          child: Column(
            children: [
              Padding(
                padding: ProjectPaddings.miniMainPadding,
                child: ApartmentPageImage(
                    apartment: widget.apartment, deviceSize: deviceSize),
              ),
              Padding(
                padding: ProjectPaddings.mainPadding,
                child: TextButtonWithTile(
                    tile: widget.apartment.name, buttonText: "Contact us"),
              ),
              Padding(
                padding: ProjectPaddings.mainPadding,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(_price,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: ProjectColors.chineseBlack,
                                    fontWeight: FontWeight.bold)),
                        Text(" ${widget.apartment.price}/month",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: ProjectColors.chineseBlack,
                                ))
                      ],
                    ),
                    Row(
                      children: [
                        Text(_loaction,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: ProjectColors.chineseBlack,
                                    fontWeight: FontWeight.bold)),
                        Text(" ${widget.apartment.location}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: ProjectColors.chineseBlack,
                                ))
                      ],
                    ),
                    const Divider(
                      color: ProjectColors.chineseBlack,
                    ),
                    SizedBox(
                      height: deviceSize.height / 3.5,
                      child: SingleChildScrollView(
                        // scrollDirection: Axis.horizontal,
                        child: Text(widget.apartment.description,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: ProjectColors.chineseBlack)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApartmentPageImage extends StatelessWidget {
  const ApartmentPageImage({
    super.key,
    required Apartment apartment,
    required this.deviceSize,
  }) : _apartment = apartment;

  final Apartment _apartment;
  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _StartPageImage(path: _apartment.path, size: deviceSize),
        Padding(
          padding: ProjectPaddings.mainTop,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProjectSquareButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  size: deviceSize.width,
                  icon: Icons.arrow_back_rounded,
                  iconColor: ProjectColors.isabelline,
                  color: ProjectColors.transparent),
              const Icon(
                Icons.favorite,
                color: ProjectColors.isabelline,
              )
            ],
          ),
        ),
      ],
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
        height: size.height / 2.5,
        width: size.width,
        child: Image(
          image: AssetImage(
            path,
          ),
          fit: BoxFit.fill,
        ));
  }
}
