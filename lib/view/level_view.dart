import 'dart:convert';

import 'package:admin_flutter_web/common/my_data_table_source.dart';
import 'package:admin_flutter_web/entry/level_entity.dart';
import 'package:admin_flutter_web/util/http_util.dart';
import 'package:admin_flutter_web/util/view_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LevelView extends StatefulWidget {
  @override
  _LevelViewState createState() => _LevelViewState();
}

class _LevelViewState extends State<LevelView> {
  final List<LevelEntity> _data = new List();

  @override
  void initState() {
    _getLevels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
          header: new Text('等级配置'),
          columns: [
            DataColumn(label: Text('等级')),
            DataColumn(label: Text('升级所需经验')),
            DataColumn(label: Text('操作')),
          ],
          source: MyDataTableSource(
              data: _data,
              cellsBuilder: (LevelEntity levelEntity) {
                return [
                  DataCell(Text(levelEntity.level.toString())),
                  DataCell(Text(levelEntity.experience.toString())),
                  DataCell(operateButton('修改', () {
                    showEditDialog(context, levelEntity);
                  })),
                ];
              })),
    );
  }

  void showEditDialog(BuildContext context, LevelEntity levelEntity) {
    var editValue = '';
    showDialog(
      context: context,
      builder: (dialogContext) {
        return SimpleDialog(
          title: Text('${levelEntity.level}级所需经验'),
          children: [
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 36,
                child: TextField(
                    keyboardType: TextInputType.number,
                    scrollPadding: EdgeInsets.all(0),
                    controller: TextEditingController(
                        text: levelEntity.experience.toString()),
                    onChanged: (value) {
                      editValue = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(left: 8),
                    ))),
            Container(
              height: 34,
              margin: EdgeInsets.only(left: 20, right: 20, top: 18),
              child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text(
                    '保存',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {

                    if (editValue.isNotEmpty) {
                      _updateLevel(levelEntity, int.tryParse(editValue)??levelEntity.experience);
                    }
                  }),
            )
          ],
        );
      },
    );
  }

  void _updateLevel(LevelEntity levelEntity, int experience) {
    levelEntity.experience = experience;
    HttpUtil.post(
      '/admin/editLevel',
      isJson: true,
      body: jsonEncode(levelEntity),
      success: (data, message) {
        setState(() {
          levelEntity.experience = experience;
        });
        Navigator.pop(context);
        toast(context, message);
      },
    );
  }

  void _getLevels() {
    HttpUtil<List<LevelEntity>>.post(
      '/admin/levelConfig',
      success: (data, message) {
        setState(() {
          _data.addAll(data);
        });
      },
    );
  }
}
