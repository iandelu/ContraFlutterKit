import 'package:contraflutterkit/brutalism_theme/widgets/chips_filter_widget.dart';
import 'package:contraflutterkit/brutalism_theme/widgets/vertical_list_item_widget.dart';
import 'package:contraflutterkit/model/item_basic_info.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ShoppingListPageOne extends StatefulWidget {

  final VoidCallback onTapItem;

  const ShoppingListPageOne({Key? key, required this.onTapItem}) : super(key: key);

  @override
  _ShoppingListPageOneState createState() => _ShoppingListPageOneState();
}

class _ShoppingListPageOneState extends State<ShoppingListPageOne> {
  List<ItemBasicInfo> _items = <ItemBasicInfo>[];
  List<String> _filters = <String>[];
  VoidCallback? _onTapItem;

  @override
  void initState() {
    super.initState();
    _onTapItem = widget.onTapItem;
    _filters.add("Small");
    _filters.add("Medium");
    _filters.add("Shirt");
    _filters.add("Shirt");
    _filters.add("Shirt");
    _filters.add("Tee");
    _items.add(ItemBasicInfo(
        name: "Rebousa - White striped tee",
        extra: "189",
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ItemBasicInfo(
        name: "Rebousa - White striped tee",
        extra: "189",
        bgColor: carribean_green,
        by: "Company name"));
    _items.add(ItemBasicInfo(
        name: "Rebousa - White striped tee",
        extra: "189",
        bgColor: lightening_yellow,
        by: "Company name"));
    _items.add(ItemBasicInfo(
        name: "Rebousa - White striped tee",
        extra: "189",
        bgColor: pink_salomn,
        by: "Company name"));
    _items.add(ItemBasicInfo(
        name: "Rebousa - White striped tee",
        extra: "189",
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ItemBasicInfo(
        name: "Rebousa - White striped tee",
        extra: "189",
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ItemBasicInfo(
        name: "Rebousa - White striped tee",
        extra: "189",
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ItemBasicInfo(
        name: "Rebousa - White striped tee",
        extra: "189",
        bgColor: flamingo,
        by: "Company name"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: ChipsFilterWidget(
                filters: _filters,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                reverse: false,
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  return VerticalListItemWidget(
                    item: _items[index],
                    onTap: () => _onTapItem,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
