
import 'package:admin_flutter_web/common/my_data_table_source.dart';
import 'package:admin_flutter_web/entry/role_entity.dart';
import 'package:admin_flutter_web/util/http_util.dart';
import 'package:admin_flutter_web/util/my_util.dart';
import 'package:admin_flutter_web/util/view_util.dart';
import 'package:flutter/material.dart';


class RoleView extends StatefulWidget {
  @override
  _RoleViewState createState() => _RoleViewState();
}

class _RoleViewState extends State<RoleView> {

  final List<RoleEntity> _data = new List();

  @override
  void initState() {
    _getRoles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        
        header: new Text('角色列表'),

        columns: [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('头像')),
          DataColumn(label: Text('名称')),
          DataColumn(label: Text('等级')),
          DataColumn(label: Text('职业')),
          DataColumn(label: Text('副职')),
        ],

        source: MyDataTableSource(data: _data, cellsBuilder: (RoleEntity role) {
          return [
            DataCell(Text(role.id.toString())),
            DataCell(ClipOval(child: Image.network(role.avatar, width: 32))),
            DataCell(Text(role.name)),
            DataCell(Text(role.level.toString())),
            DataCell(Text(getProfessionName(role.main))),
            DataCell(Text(getProfessionName(role.sub))),
          ];
        }
        ),
        
        actions: [
          refreshButton((){
            toast(context, '测试');
          })
        ],
      ),
    );
  }



  void _getRoles() {
    HttpUtil<List<RoleEntity>>.post(
      '/admin/roles',
      success: (data, message) {
        setState(() {
          _data.addAll(data);
        });
      },
    );
  }

}



