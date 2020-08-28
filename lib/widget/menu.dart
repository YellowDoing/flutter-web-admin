import 'package:flutter/material.dart';

import 'my/my_expansion_pane.dart' as My;

class MenuItem {
  int id;

  final String text;

  final List<String> subItems;

  bool isExpanded = false;

  Widget icon;

  MenuItem({
    @required this.text,
    this.subItems = const [],
    this.icon,
    bool defaultExpanded = false,
  }) : isExpanded = defaultExpanded;
}

class Menu extends StatefulWidget {
  final Color color;

  final Color expandColor;

  final Color selectColor;

  final Color selectItemColor;

  final List<MenuItem> items;

  final double width;

  final double height;

  Menu({
    this.items = const [],
    this.width = 230,
    this.height = double.infinity,
    this.color = Colors.white,
    this.selectColor = const Color(0xFFEEEEEE),
    this.selectItemColor = const Color(0xFFEEEEEE),
    this.expandColor = const Color(0xdcfafafa),
  });

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String _selectId = '';

  @override
  Widget build(BuildContext context) {
    // Colors.grey
    return Container(
        color: widget.color,
        height: widget.height,
        width: widget.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Wrap(
              children: [
                My.ExpansionPanelList(
                  expansionCallback: (index, isExpanded) {
                    var item =  widget.items[index];
                    setState(() {
                      item.isExpanded = !item.isExpanded;
                    });

                    if( item.isExpanded && item.subItems.isEmpty){
                      setState(() {
                        _selectId = (index +1).toString();
                      });
                    }
                  },
                  children: _buildMenu(),
                )
              ],
            )),
            Container(
              height: double.infinity,
              width: 1,
              color: Colors.grey[200],
            )
          ],
        ));
  }

  List<My.ExpansionPanel> _buildMenu() {
    return widget.items.map((menuItem) {
      var id = (widget.items.indexOf(menuItem) + 1).toString();

      return My.ExpansionPanel(
          showRightIcon: menuItem.subItems.isNotEmpty,
          isExpanded: menuItem.isExpanded,
          headerColor: (_selectId == id && menuItem.subItems.isEmpty) ? widget.selectColor : null,
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
                var itemId =
                    '${widget.items.indexOf(menuItem) + 1}-${menuItem.subItems.indexOf(subTitle) +1}';
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
                    setState(() {
                      _selectId = itemId;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          canTapOnHeader: true);
    }).toList();
  }
}

// class _SubMenuItems extends StatefulWidget {
//   final List<String> subItems;
//
//   _SubMenuItems(this.subItems);
//
//   @override
//   _SubMenuItemsState createState() => _SubMenuItemsState();
// }
//
// class _SubMenuItemsState extends State<_SubMenuItems> {
//
//   int _tapIndex = -1;
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
