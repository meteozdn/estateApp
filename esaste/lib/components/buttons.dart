import 'package:esaste/components/paddings.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ProjectCircleButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final page;

  const ProjectCircleButton({
    required this.icon,
    super.key,
    required this.color,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: color),
      ),
      child: IconButton(
        icon: icon,
        color: color,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}

class ProjectSquareButton extends StatelessWidget {
  final onTap;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final double size;
  const ProjectSquareButton({
    super.key,
    required this.size,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size / 10,
      width: size / 10,
      decoration: BoxDecoration(
        border: Border.all(color: iconColor),
        color: color,
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          size: size / 15,
          color: iconColor,
        ),
      ),
    );
  }
}

class TextButtonWithTile extends StatelessWidget {
  final String tile;
  final String buttonText;

  const TextButtonWithTile({
    super.key,
    required this.tile,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tile,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: ProjectColors.chineseBlack, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        Text(buttonText,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ProjectColors.chineseBlack,
                  decoration: TextDecoration.underline,
                )),
      ],
    );
  }
}
