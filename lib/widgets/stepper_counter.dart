import 'package:flutter/material.dart';
import 'package:vievif/utils/colors.dart';

// ignore: must_be_immutable
class StepperCounter extends StatefulWidget {
  StepperCounter({
    @required this.lowerBound,
    @required this.upperBound,
    @required this.stepIncrementValue,
    @required this.value,
    @required this.stepperIconSize,
    this.borderRadius,
    @required this.onChanged,
  });

  final int lowerBound;
  final int upperBound;
  final int stepIncrementValue;
  int value;
  final double stepperIconSize, borderRadius;
  final ValueChanged<dynamic> onChanged;

  @override
  _StepperCounterState createState() => _StepperCounterState();
}

class _StepperCounterState extends State<StepperCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.stepperIconSize * 5,
      decoration: BoxDecoration(
          color: kYellowish,
          borderRadius: BorderRadius.circular(
              widget.borderRadius == null ? 20 : widget.borderRadius)),
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
              style: TextStyle(fontSize: widget.stepperIconSize * 0.7),
              textAlign: TextAlign.center,
            ),
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
