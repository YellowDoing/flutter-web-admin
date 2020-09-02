import 'package:flutter/material.dart';

import 'my/my_expansion_pane.dart' as My;


class MenuItem {
  int id;

  final String text;

  final List<String> subItems;

  bool isExpanded;

  Widget icon;


  MenuItem({
    @required this.text,
    this.subItems = const [],
    this.icon,
    bool defaultExpanded = false,
  }):isExpanded = defaultExpanded;
}

class Menu extends StatefulWidget {

  final Color color;

  final Color expandColor;

  final Color selectColor;

  final Color selectItemColor;

  final List<MenuItem> items;

  final double width;

  final double height;

  final ValueChanged<String> onMenuSelected;

  final String selectId;

  Menu(
      {@required this.items,
      this.width = 230,
      this.height = double.infinity,
      this.color = Colors.white,
      this.selectColor = const Color(0xFFEEEEEE),
      this.selectItemColor = const Color(0xFFEEEEEE),
      this.expandColor = const Color(0xdcfafafa),
      this.selectId = '',
      @required this.onMenuSelected})
      : assert(onMenuSelected != null),
        assert(items != null);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  String _selectId;

  @override
  void initState() {
    //widget.items.forEach((element)=>element.isExpanded = element.defaultExpanded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.color,
        height: widget.height,
        width: widget.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Wrap(
              children: [_buildExpansionPanelList()],
            )),
            _buildRightVerticalLine()
          ],
        ));
  }

  My.ExpansionPanelList _buildExpansionPanelList() {
    return My.ExpansionPanelList(
      expansionCallback: (index, isExpanded) {

        var item = widget.items[index];

        setState(() {
          item.isExpanded = !item.isExpanded;
        });

        if (item.isExpanded && item.subItems.isEmpty) {
         // setState(() {
            _selectId = (index + 1).toString();
          //});
          widget.onMenuSelected?.call(_selectId);
        }
      },
      children: _buildMenuItems(),
    );
  }

  ///右侧分割线
  Container _buildRightVerticalLine() {
    return Container(
      height: double.infinity,
      width: 1,
      color: Colors.grey[200],
    );
  }

  List<My.ExpansionPanel> _buildMenuItems() {
    return widget.items.map((menuItem) {
      var id = (widget.items.indexOf(menuItem) + 1).toString();

      return My.ExpansionPanel(
          showRightIcon: menuItem.subItems.isNotEmpty,
          isExpanded: menuItem.isExpanded,
          headerColor: (_selectId == id && menuItem.subItems.isEmpty)
              ? widget.selectColor
              : null,
          headerBuilder: (_, expand) {
            return Container(
              padding: EdgeInsets.only(left: 14),
              child: Row(
                children: [
                  menuItem.icon ?? Container(),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(menuItem.text),
                  )
                ],
              ),
            );
          },
          body: Container(
            color: widget.expandColor,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: menuItem.subItems.map((subTitle) {
                return _buildMenSubItem(menuItem, subTitle);
              }).toList(),
            ),
          ),
          canTapOnHeader: true);
    }).toList();
  }

  RawMaterialButton _buildMenSubItem(MenuItem menuItem, String subTitle) {
    var itemId =
        '${widget.items.indexOf(menuItem) + 1}-${menuItem.subItems.indexOf(subTitle) + 1}';

    return RawMaterialButton(
      child: Container(
        color: _selectId == itemId ? widget.selectItemColor : null,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(42, 12, 0, 12),
        child: Text(
          subTitle,
        ),
      ),
      onPressed: () {
        //setState(() {
          _selectId = itemId;
        //});
        widget.onMenuSelected?.call(_selectId);
      },
    );
  }
}
