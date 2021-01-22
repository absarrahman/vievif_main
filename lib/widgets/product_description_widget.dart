import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DescriptionWidget extends StatefulWidget {
  final description;

  DescriptionWidget({@required this.description});

  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    print('Description is '+widget.description);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: width - (width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Html(
                data: widget.description,
                style: {
                  "div":Style(
                    fontSize: FontSize.large,
                  ),
                },
              ),*/
              HtmlWidget(widget.description,
                webView: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
