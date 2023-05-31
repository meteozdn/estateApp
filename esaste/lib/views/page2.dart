import 'package:esaste/components/paddings.dart';
import 'package:esaste/images/imagePath.dart';
import 'package:esaste/views/page3.dart';
import 'package:flutter/material.dart';
import '../components/buttons.dart';
import '../components/colors.dart';
import '../models/apartmentModel.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final List<Apartment> apartments = Apartments.houses;

  final String _title1 = "Find your";

  final String _title2 = "Apartments";

  final String _textFieldText = "Search properties...";

  final TextEditingController _textEditingController = TextEditingController();

  final List<String> _categories = ["New", "Nearby", "Luxury"];
  final _pageBookController = PageController(viewportFraction: 0.39);
  var selectedCategory = false;
  var selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: deviceSize.width / 8,
        elevation: 0,
        backgroundColor: ProjectColors.flax,
        actions: [
          Padding(
            padding: ProjectPaddings.onlyRight,
            child: Icon(
              Icons.sync_alt_outlined,
              size: deviceSize.width / 15,
              color: ProjectColors.chineseBlack,
            ),
          )
        ],
        leadingWidth: deviceSize.width / 5.5,
        leading: SquareButton(
            size: deviceSize.width,
            icon: Icons.list,
            iconColor: ProjectColors.isabelline,
            color: ProjectColors.chineseBlack),
      ),
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        color: ProjectColors.flax,
        child: SafeArea(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: ProjectPaddings.mainTop,
                    child: ProjectTextField(
                        textFieldText: _textFieldText,
                        textEditingController: _textEditingController),
                  ),
                  Padding(
                    padding: ProjectPaddings.mainPadding,
                    child: _ProjectTitle(title1: _title1, title2: _title2),
                  ),
                ],
              ),
              Padding(
                padding: ProjectPaddings.onlyLeft,
                child: Categories(
                  deviceSize: deviceSize,
                  categories: _categories,
                ),
              ),
              Padding(
                padding: ProjectPaddings.mainTop,
                child: TextButtonWithTile(
                  tile: selectedCategory ? "All" : 'All Properties ',
                  buttonText: 'View all',
                ),
              ),
              Expanded(
                child: Padding(
                  padding: ProjectPaddings.mainPadding,
                  child: SizedBox(
                    //height: deviceSize.height / 1,
                    child: ListView.builder(
                      itemCount: apartments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProjectCard(
                          deviceSize: deviceSize,
                          apartment: apartments[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({
    super.key,
    required this.deviceSize,
    required List<String> categories,
  }) : _categories = categories;

  final Size deviceSize;
  final List<String> _categories;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.deviceSize.width / 7.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget._categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: ProjectPaddings.onlyMiniRight,
            child: Container(
              height: widget.deviceSize.width / 8,
              decoration: BoxDecoration(
                border: Border.all(color: ProjectColors.chineseBlack),
                color: ProjectColors.isabelline,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Padding(
                  padding: ProjectPaddings.textButton,
                  child: Text(
                    widget._categories[index],
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ProjectColors.chineseBlack,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProjectTextField extends StatelessWidget {
  const ProjectTextField({
    super.key,
    required String textFieldText,
    required TextEditingController textEditingController,
  })  : _textFieldText = textFieldText,
        _textEditingController = textEditingController;

  final String _textFieldText;
  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ProjectColors.chineseBlack, width: 2.5),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ProjectColors.chineseBlack, width: 2.5),
        ),
        hintText: _textFieldText,
      ),
      controller: _textEditingController,
    );
  }
}

class _ProjectTitle extends StatelessWidget {
  const _ProjectTitle({
    required String title1,
    required String title2,
  })  : _title1 = title1,
        _title2 = title2;

  final String _title1;
  final String _title2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _title1,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: ProjectColors.chineseBlack,
              ),
        ),
        Text(
          _title2,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: ProjectColors.chineseBlack, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Apartment apartment;
  const ProjectCard({
    super.key,
    required this.deviceSize,
    required this.apartment,
  });
  final Size deviceSize;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: deviceSize.width / 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Page3(apartment: widget.apartment)),
          );
        },
        child: Card(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                width: 3,
                color: ProjectColors.chineseBlack,
              ),
            ),
            color: ProjectColors.isabelline,
            child: Row(
              children: [
                _StartPageImage(
                  path: widget.apartment.path,
                  size: widget.deviceSize,
                ),
                Padding(
                  padding: ProjectPaddings.cardmMinPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        " ${widget.apartment.name}",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ProjectColors.chineseBlack,
                            ),
                      ),
                      Padding(
                        padding: ProjectPaddings.cardVertical,
                        child: Row(
                          children: [
                            const Icon(Icons.location_on),
                            Text(widget.apartment.location,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: ProjectColors.chineseBlack,
                                    )),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.attach_money_rounded),
                          Text('${widget.apartment.price}month',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: ProjectColors.chineseBlack,
                                  )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final double size;
  const SquareButton({
    super.key,
    required this.size,
    required this.icon,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.onlyLeft,
      child: Ink(
        height: size,
        decoration: BoxDecoration(
          color: color,
        ),
        child: InkWell(
          onTap: () {},
          child: Icon(
            icon,
            size: size / 15,
            color: iconColor,
          ),
        ),
      ),
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
    return Padding(
      padding: ProjectPaddings.cardmMinPadding,
      child: SizedBox(
          height: size.height / 8,
          width: size.height / 8,
          child: Image(
            image: AssetImage(
              path,
            ),
            fit: BoxFit.cover,
          )),
    );
  }
}

class ProjectIconButton extends StatelessWidget {
  final Widget widget;
  final Color color;

  const ProjectIconButton(
      {super.key, required this.widget, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
          ),
        ),
        widget
      ],
    );
  }
}
