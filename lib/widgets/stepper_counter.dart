import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StepperCounter extends StatefulWidget {
  StepperCounter({
    @required this.lowerBound,
    @required this.upperBound,
    @required this.stepIncrementValue,
    @required this.value,
    @required this.stepperIconSize,
    @required this.onChanged,
  });

  final int lowerBound;
  final int upperBound;
  final int stepIncrementValue;
  int value;
  final double stepperIconSize;
  final ValueChanged<dynamic> onChanged;

  @override
  _StepperCounterState createState() => _StepperCounterState();
}

class _StepperCounterState extends State<StepperCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.remove_outlined),
              onPressed: () {
                setState(() {
                  widget.value = widget.value == widget.lowerBound
                      ? widget.lowerBound
                      : widget.value -= widget.stepIncrementValue;
                  widget.onChanged(widget.value);
                });
              },
            ),
          ),
          Container(
            child: Text(
              widget.value.toString(),
              style: TextStyle(
                fontSize: widget.stepperIconSize * 0.7
              ),
              textAlign: TextAlign.center,
            ),
            width: widget.stepperIconSize,
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.add_outlined),
              onPressed: () {
                setState(() {
                  widget.value = widget.value == widget.upperBound
                      ? widget.upperBound
                      : widget.value += widget.stepIncrementValue;
                  widget.onChanged(widget.value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
