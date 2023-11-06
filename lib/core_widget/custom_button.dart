import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.min = false,
    this.press,
    this.textColor = Colors.white,
    this.isDestroy = false,
    this.disable = false,
    this.showColor = false,
    this.color,
  }) : super(key: key);
  final String? text;
  final Function()? press;
  final Color textColor;
  final bool min;
  final bool isDestroy;
  final bool disable;
  final bool showColor;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: min ? size.width * 0.4 : size.width * 0.9,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          // color: Theme.of(context).primaryColor,

          onTap: disable ? null : press,
          child: Container(
            height: 50.0,
            decoration: showColor
                ? BoxDecoration(
                    color: color,
                  )
                : BoxDecoration(
                    gradient: disable
                        ? const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.grey,
                              Colors.white,
                            ],
                          )
                        : LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              isDestroy == false
                                  ? Theme.of(context).primaryColor
                                  : Colors.red,
                              isDestroy == false
                                  ? const Color(0xFF8126FD)
                                  : Colors.pinkAccent,
                            ],
                          ),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
            child: Center(
              child: Text(
                '$text',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Theme.of(context).backgroundColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
