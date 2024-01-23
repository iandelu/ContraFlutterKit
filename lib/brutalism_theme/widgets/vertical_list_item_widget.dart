import 'package:contraflutterkit/brutalims_theme.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/material.dart';

class VerticalListItemWidget extends StatelessWidget {
  final ItemBasicInfo item;
  final Function onTap;

  const VerticalListItemWidget({required this.item,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context, item.id),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  decoration: BoxDecoration(
                      border:  Border.all(
                        color: Colors.black, // Color del borde
                        width: 2.0,
                      ),
                      color: item.bgColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(BrutDimensions.brutBorderRadious)
                      ),
                      //boxShadow: const [shadowSmallBrut],
                      image: DecorationImage(
                        image: MemoryImage(item.image),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
            ),
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
                              child: ExpandableTextWidget(
                                text: item.name,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.extra,
                        style: TextStyle(
                            color: wood_smoke,
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      ),
                      const Text(
                        '/10',
                        style: TextStyle(
                            color: wood_smoke,
                            fontSize: 26,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox( width: 3 ),
                      Center(
                        child: item.extraWidget,
                      )
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
