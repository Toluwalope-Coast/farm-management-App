import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Size deviceSize;
  final Function iconBackIconFunction;
  final Function iconInsertIconFunction;
  final Function iconReportIconFunction;

  const BottomBar(
      {Key key,
      this.deviceSize,
      this.iconBackIconFunction,
      this.iconInsertIconFunction,
      this.iconReportIconFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: NavBarClipper(),
              child: Container(
                height: 50,
                width: deviceSize.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context).primaryColor,
                      Colors.purple
                    ])),
              ),
            )),
        Positioned(
            bottom: 45,
            width: deviceSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(
                    context, Icons.arrow_back_ios, iconBackIconFunction),
                SizedBox(
                  width: 1,
                ),
                _buildNavItem(context, Icons.add, iconInsertIconFunction),
                SizedBox(
                  width: 2,
                ),
                _buildNavItem(
                    context, Icons.chat_sharp, iconReportIconFunction),
              ],
            )),
        Positioned(
            bottom: 6,
            width: deviceSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Back",
                  style: Theme.of(context).textTheme.button,
                ),
                Text(
                  "Insert",
                  style: Theme.of(context).textTheme.button,
                ),
                Text(
                  "Report",
                  style: Theme.of(context).textTheme.button,
                )
              ],
            ))
      ],
    );
  }
}

_buildNavItem(
  BuildContext context,
  IconData icon,
  iconAction,
) {
  return GestureDetector(
    onTap: iconAction,
    child: CircleAvatar(
      radius: 25,
      backgroundColor: Theme.of(context).indicatorColor,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        radius: 18,
        child: Icon(
          icon,
          color: Theme.of(context).indicatorColor,
          size: 30,
        ),
      ),
    ),
  );
}

class NavBarClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
