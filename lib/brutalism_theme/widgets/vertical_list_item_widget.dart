import 'package:contraflutterkit/model/item_basic_info.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalListItemWidget extends StatelessWidget {
  final ItemBasicInfo item;
  final VoidCallback onTap;

  const VerticalListItemWidget({required this.item,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                      color: item.bgColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          side: BorderSide(color: wood_smoke, width: 2))),
                )),
            SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              item.by,
                              style: TextStyle(
                                  color: trout,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                item.name,
                                maxLines: 2,
                                style: TextStyle(
                                    color: wood_smoke,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        item.extra,
                        style: TextStyle(
                            color: wood_smoke,
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      ),
                      //CartAddRemoveButton()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
