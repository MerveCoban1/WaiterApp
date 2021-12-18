import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/section_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/models/table_model.dart';
import 'package:waiter_app_demo/services/in_app_service.dart';

import 'floor_detail_screen.dart';

class TableTransferSelect extends StatefulWidget {
  TableModel tableModel;
  SessionModel sessionModel;
  var emptyTableList = [];
  SectionModel sectionModel;

  TableTransferSelect(this.emptyTableList, this.tableModel, this.sessionModel,
      this.sectionModel);

  @override
  _TableTransferSelectState createState() => _TableTransferSelectState();
}

class _TableTransferSelectState extends State<TableTransferSelect> {
  Color color = Color.fromRGBO(143, 148, 251, 1);
  InAppService apiManagerInAppService = InAppService();
  var tableList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildContainer(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Lütfen Masa Seçiniz",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(143, 148, 251, 1),
        ),
      ),
      iconTheme: IconThemeData(
        color: Color.fromRGBO(143, 148, 251, 1),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: InkWell(
        child: Icon(Icons.arrow_back),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  buildContainer(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: (MediaQuery.of(context).size.width),
          height: (MediaQuery.of(context).size.height) * 0.80,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.emptyTableList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    if (await apiManagerInAppService.transferTable(
                        widget.sessionModel.refreshToken,
                        widget.sessionModel.accessToken,
                        widget.tableModel,
                        widget.emptyTableList[index]['_id'])) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FloorDetailScreen(
                                  widget.sectionModel, widget.sessionModel)));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Masa ${widget.tableModel.title} Masa ${widget.emptyTableList[index]['title']} Taşındı",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Masa Taşınmadı",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ));
                    }
                  },
                  child: Container(
                    height: (MediaQuery.of(context).size.height) * 0.10,
                    width: (MediaQuery.of(context).size.width) * 0.90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, 100),
                          blurRadius: 10.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            10.0, // Move to bottom 10 Vertically
                          ),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        widget.emptyTableList[index]['title'],
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
