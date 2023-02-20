// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';

class SelectSeat extends StatefulWidget {
  bool isReserved;
  bool isSelected;

  SelectSeat({Key? key, this.isSelected = false, this.isReserved = false}) : super(key: key);

  @override
  _SelectSeatState createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        width: MediaQuery.of(context).size.width / 15,
        height: MediaQuery.of(context).size.width / 15,
        decoration: BoxDecoration(
            // border: !widget.isSelected && !widget.isReserved ? Border.all(color: Colors.white, width: 1.0) : null,
            borderRadius: BorderRadius.circular(5.0)),
        child: Icon(Icons.event_seat,
            color: widget.isSelected
                ? Colors.yellow.shade700
                : widget.isReserved
                    ? Colors.black
                    : Colors.white,
            size: 30),
      ),
    );
  }
}
