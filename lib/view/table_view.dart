import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:admin_flutter_web/widget/my/my_table_data.dart' as My;

class TableView extends StatefulWidget {
  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(


          ),
          child: My.DataTable(columns: [
            My.DataColumn(label: Text('ID')),
            My.DataColumn(label: Text('名称')),
            My.DataColumn(label: Text('年龄')),
            My.DataColumn(label: Text('操作')),
          ], rows: [
            My.DataRow(
                cells: [
                  My.DataCell(Text('1')),
                  My.DataCell(Text('测试')),
                  My.DataCell(Text('18')),
                  My.DataCell(Wrap(
                    spacing: 14,
                    children: [

                      InkWell(
                        child: Text('编辑',style: TextStyle(color: Theme.of(context).accentColor),),
                        onTap: (){
                          
                          showDialog(
                    /*          barrierDismissible: true,
                              barrierLabel: '弹框',
                              transitionDuration: Duration(milliseconds: 250),*/
                              context: context,builder: (dialogContext){
                            return SimpleDialog(
                              elevation: 1,
                              children: [
                                Text('sadawd')
                                
                              ],
                            );
                          });
                          
                        },
                      ),
                      InkWell(
                        child: Text('删除',style: TextStyle(color: Colors.red),),
                        onTap: (){
                          print('sssss');
                        },
                      ),

                    ],
                  ))
            ])
          ]),
        )
      ],
    );
  }
}
