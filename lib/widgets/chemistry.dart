import 'package:flutter/material.dart';

class Chemistry extends StatelessWidget {
  final size;
  final elementName;
  Chemistry({@required this.size, @required this.elementName});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.3),
        border: Border.all(color: Theme.of(context).primaryColor, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Center(
        child: Text(elementName),
      ),
    );
  }
}
