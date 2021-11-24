import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/models/table_model.dart';

class TableDetailScreen extends StatefulWidget {
  SessionModel sessionModel;
  TableModel tableModel;

  TableDetailScreen(this.tableModel,this.sessionModel);
  @override
  State<TableDetailScreen> createState() => _TableDetailScreenState();
}

class _TableDetailScreenState extends State<TableDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width),
          height: (MediaQuery.of(context).size.height)*0.15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(65),
              topLeft: Radius.circular(65),
            ),
          ),
          child: Center(
            child: Text(
              "Masa Detay",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(143, 158, 191, 1),
              ),
            ),
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width),
          height: (MediaQuery.of(context).size.height)*0.68,
          color: Colors.white,
          child: ListView(
            children: [
              (widget.tableModel.busy) ? buildPadding("Durum","Dolu"): buildPadding("Durum","Boş"),
              buildPadding("Bölüm",widget.tableModel.section.toString()),
              buildPadding("Dal",widget.tableModel.branch.toString()),
              buildPadding("Oluşturma",widget.tableModel.createdAt.toString()),
              buildPadding("Değiştirme",widget.tableModel.updatedAt.toString()),
              buildPadding("Garson",widget.tableModel.waiterId.toString()),
              buildPadding("Ödemeler",widget.tableModel.payments.toString()),
            ],
          ),
        ),
      ],
    );
  }

  Padding buildPadding(String attributeName, String value) {
    return Padding(
              padding: const EdgeInsets.only(left: 40.0,right: 40.0,top: 10.0,bottom: 10.0),
              child: Row(
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width*0.20),
                    child: Text(attributeName,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(143, 158, 191, 1),
                      ),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width*0.55),
                    child: Text(":  "+value,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(105, 105, 105, 1),
                      ),
                    ),
                  ),
                ],
              ),
            );
  }

}