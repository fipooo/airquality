import 'package:airquality/components/card.dart';
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class CardCustomList extends StatefulWidget {
  final List<CustomCardWidget> list;
  CardCustomList(this.list);
  @override
  _CardCustomListState createState() => _CardCustomListState();
}

class _CardCustomListState extends State<CardCustomList> {
  @override
  Widget build(BuildContext context) {
    return ReorderableWrap(
      spacing: 0.0,
      runSpacing: 4.0,
      needsLongPressDraggable: false,
      buildDraggableFeedback: (context, box, widget){
        return widget;
      },
      //padding: const EdgeInsets.all(8),
        children: widget.list,
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            widget.list.insert(newIndex, widget.list.removeAt(oldIndex));
          });
        }
    );
  }
}
