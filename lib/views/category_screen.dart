import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/category_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/services/in_app_service.dart';
import 'package:waiter_app_demo/widgets/category_card.dart';

class CategoryScreen extends StatefulWidget {
  SessionModel sessionModel;

  CategoryScreen(this.sessionModel);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var categoriesList = [];
  InAppService apiManagerInAppService = InAppService();
  late CategoryModel categoryModel;

  @override
  void initState() {
    getAllCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width),
          height: (MediaQuery.of(context).size.height) * 0.15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(65),
              topLeft: Radius.circular(65),
            ),
          ),
          child: Center(
            child: Text(
              "Kategoriler",
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
            height: (MediaQuery.of(context).size.height) * 0.68,
            color: Colors.white,
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: (3 / 4),
              children: List.generate(categoriesList.length, (index) {
                categoryModel = CategoryModel.fromJson(categoriesList[index]);
                return CategoryCard(categoryModel, widget.sessionModel);
              }),
            )),
      ],
    );
  }

  void getAllCategory() async {
    var categoryList = await apiManagerInAppService.getAllCategory(
        widget.sessionModel.refreshToken.toString(),
        widget.sessionModel.accessToken.toString());
    if (categoryList.isEmpty) {
      print("hata");
    } else {
      setState(() {
        categoriesList = categoryList;
      });
    }
  }
}
