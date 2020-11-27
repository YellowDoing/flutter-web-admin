import 'package:flutter/material.dart';


typedef CellsBuilder<T> = List<DataCell> Function(T value);

class MyDataTableSource<T> extends DataTableSource {

  final List<T> data;

  final CellsBuilder<T> cellsBuilder;

  MyDataTableSource({this.data,this.cellsBuilder});

  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: cellsBuilder(data[index])
    );
  }

  //[
  //         DataCell(Text('${data[index]}')),
  //         DataCell(Text('${data[index]}')),
  //         DataCell(Text('${data[index]}')),
  //         DataCell(Text('${data[index]}')),
  //       ],

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}