import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/session.dart';
import 'package:waiter_app_demo/services/in_app_service.dart';
import 'package:waiter_app_demo/widgets/floor_card.dart';

class FloorsScreen extends StatefulWidget {
  Session session;
  FloorsScreen(this.session);
  @override
  State<FloorsScreen> createState() => _FloorsScreenState();
}

class _FloorsScreenState extends State<FloorsScreen> {
  var sectionsList=[];
  InAppService apiManagerInAppService=InAppService();

  @override
  void initState() {
    super.initState();
    getAllSections();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: (MediaQuery.of(context).size.height),
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
              "KATLAR",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(143, 158, 191, 1),
              ),
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: (MediaQuery.of(context).size.height),
            height: (MediaQuery.of(context).size.height)*0.69,
            child: ListView.builder(
              itemCount: sectionsList.length,
              itemBuilder: (BuildContext context, int index) {
                return FloorCard(sectionsList[index]["title"],sectionsList[index]["_id"],widget.session);
              },
            )
          ),
      ],
    );
  }

  void getAllSections() async{
    var sectionList=await apiManagerInAppService.fetchDataAllSections(widget.session.refreshToken.toString(),widget.session.accessToken.toString());
    if(sectionList.isEmpty){
      print("hata");
    }else{
      setState(() {
        sectionsList=sectionList;
      });
    }
  }

}