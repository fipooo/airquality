import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuButton extends StatelessWidget {
  final double size;
  final bool dark;
  final GestureTapCallback onPressed;

  MenuButton({@required this.size,@required this.dark, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: size,
        height: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: size,
              height: size/8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: dark ? Theme.of(context).primaryColor : Colors.white
              ),
            ),
            Row(
              children: [
                Container(
                  width: size/1.5,
                  height: size/8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: dark ? Theme.of(context).primaryColor : Colors.white
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: size/2,
                  height: size/8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: dark ? Theme.of(context).primaryColor : Colors.white
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
