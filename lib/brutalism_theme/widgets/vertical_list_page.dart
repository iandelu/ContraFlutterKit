import 'package:contraflutterkit/brutalism_theme/widgets/chips_filter_widget.dart';
import 'package:contraflutterkit/brutalism_theme/widgets/vertical_list_item_widget.dart';
import 'package:contraflutterkit/model/item_basic_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerticalListPage extends StatefulWidget {

  final Function onTapItem;
  final List<ItemBasicInfo> items;

  const VerticalListPage({Key? key, required this.onTapItem, required this.items}) : super(key: key);

  @override
  _VerticalListPageState createState() => _VerticalListPageState();
}

class _VerticalListPageState extends State<VerticalListPage> {
  List<ItemBasicInfo> _items = <ItemBasicInfo>[];
  List<String> _filters = <String>[];
  late Function _onTapItem;

  @override
  void initState() {
    super.initState();
    _onTapItem = widget.onTapItem;
    _items = widget.items;
    _filters.add("Small");
    _filters.add("Medium");
    _filters.add("Shirt");
    _filters.add("Shirt");
    _filters.add("Shirt");
    _filters.add("Tee");
  }

  @override
  Widget build(BuildContext context) {
    if(_items.isEmpty) {
      return Center(
        child: Column(
          children: [
            Text("No items found", style: Theme.of(context).textTheme.titleLarge,),
            SvgPicture.asset("assets/icons/empty.png", width: 200, height: 200,)
          ],
        ),
      );
    }
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
                    onTap: _onTapItem,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
