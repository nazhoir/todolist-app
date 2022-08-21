import 'package:flutter/material.dart';

import '../constant.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({
    Key? key,
    required this.title,
    required this.content,
    required this.date,
    required this.drag,
    required this.edit,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);

  final double? height;
  final double? width;

  final String title;
  final String content;
  final String date;
  final EdgeInsets? padding;

  final VoidCallback drag;
  final VoidCallback edit;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: isChecked ? accentsOneColor : secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          GestureDetector(
            onLongPress: widget.drag,
            child: const Icon(
              Icons.drag_indicator,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onDoubleTap: widget.edit,
            child: SizedBox(
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.content,
                    style: TextStyle(
                      fontSize: 16,
                      decoration: isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.date),
                ],
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Icon(
              isChecked
                  ? Icons.check_box
                  : Icons.check_box_outline_blank_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
