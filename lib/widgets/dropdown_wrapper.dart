import 'package:flutter/material.dart';

class DropdownWrapper extends StatelessWidget {
  final String acLabel;
  final int flexValue1;
  final int flexValueChild;
  final Widget wrapperChild;

  DropdownWrapper({@required this.acLabel, this.flexValue1, this.flexValueChild, this.wrapperChild});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 8.0),
      child: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: flexValue1 ?? 1,
              child: Text(
                acLabel,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Expanded(
              flex: flexValueChild ?? 1,
              child: wrapperChild,
            ),
          ],
        ),
      ),
    );
  }
}
