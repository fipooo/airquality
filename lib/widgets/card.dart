import 'package:airquality/provider/appProvider.dart';
import 'package:airquality/widgets/chemistry.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatefulWidget {
  final width;
  final height;
  final text;
  final name;
  final AppProvider appProvider;
  final AppProvider appConsumer;

  CustomCardWidget(
      {@required this.width,
      @required this.height,
      @required this.text,
      @required this.appProvider,
      @required this.appConsumer,
      this.name});

  @override
  _CustomCardWidget createState() => _CustomCardWidget();
}

class _CustomCardWidget extends State<CustomCardWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _colorTween = ColorTween(begin: Colors.white, end: Colors.grey[500])
        .animate(_animationController);
    _animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width / 2,
      height: widget.width / 2,
      child: Card(
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        color: Colors.white.withOpacity(0.4),
        child: Center(
          child: widget.appConsumer.city == null
              ? Center(
                  child: Transform.scale(
                      scale: 0.3,
                      child: AnimatedBuilder(
                        animation: _colorTween,
                        builder: (BuildContext context, Widget child) {
                          return Image.asset(
                            'assets/air.png',
                            color: _colorTween.value,
                          );
                        },
                      )))
              : Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Chemistry(size: 70.0, elementName: 'NA',),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom :8.0),
                          child: Text(
                            widget.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Text(
                          widget.text.toString().isEmpty
                              ? 'Brak danych'
                              : widget.text,
                          style: TextStyle(
                              color: widget.text.toString().isEmpty
                                  ? Colors.grey[400]
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    )
                  ),
                ),
        ),
      ),
    );
  }
}
