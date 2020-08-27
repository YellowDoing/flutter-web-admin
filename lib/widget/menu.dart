/*
class Menu extends StatefulWidget {
  final double width;

  final double height;

  List<MenuItem> children;

  int defaultSelect;

  Color selectColor;

  Menu(
      {this.width = 220,
      this.height = double.infinity,
      this.defaultSelect = 0,
      this.children = const [],
      this.selectColor = const Color(0xffe6f7ff)});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  int _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.defaultSelect;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          child: Wrap(
            children: widget.children,
          ),
        ),
        Container(
          height: double.infinity,
          width: 1,
          color: Colors.grey[200],
        )
      ],
    );
  }

  List<Widget> _buildItemList() {
    return widget.children.map((element) {
      int index = widget.children.indexOf(element);
//            return InkWell(
//              child: Container(
//                color: _currentIndex == index ? widget.selectColor : Colors.transparent,
//                child: element,
//              ),
//              onTap: () {
//                setState(() {
//                  _currentIndex = index ;
//                });
//              },
//            );
      return ExpansionTile(
        title: Text('asdawdaw'),
        children: [
          Text('asdaw'),
          Text('asdaw'),
        ],
      );
    }).toList();
  }
}*/

/*
class MenuItem extends StatefulWidget {

  final Widget icon;

  final String text;

  final List<Widget> children;

  MenuItem({this.icon, this.text, this.children = const []});

  @override
  _MenuItemState createState() => _MenuItemState();
}
*/

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
  final List<MenuItem> items;

  final double width;

  final double height;

  Menu(
      {this.items = const [], this.width = 230, this.height = double.infinity});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Wrap(
              children: [
                My.ExpansionPanelList(
                  // dividerColor: Colors.transparent,
                  expansionCallback: (index, isExpanded) {
                    debugPrint(index.toString());
                    setState(() {
                      widget.items[index].isExpanded =
                          !widget.items[index].isExpanded;
                    });
                  },
                  children: widget.items.map((menuItem) {
                    return My.ExpansionPanel(
                        showRightIcon: menuItem.subItems.isNotEmpty,
                        isExpanded: menuItem.isExpanded,
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
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: menuItem.subItems.map((subTitle) {
                              return InkWell(
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.fromLTRB(42, 12, 0, 12),
                                  child: Text(
                                    subTitle,
                                  ),
                                ),
                                onTap: () {},
                              );
                            }).toList(),
                          ),
                        ),
                        canTapOnHeader: true);
                  }).toList(),
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
}
