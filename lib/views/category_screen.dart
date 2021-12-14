import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/add_product.dart';
import 'package:waiter_app_demo/models/category_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/models/table_model.dart';
import 'package:waiter_app_demo/services/in_app_service.dart';
import 'package:waiter_app_demo/views/products_screen.dart';

class CategoryScreen extends StatefulWidget {
  SessionModel sessionModel;
  TableModel tableModel;
  List<Products_AddProduct> productAddProduct;

  CategoryScreen(this.sessionModel, this.tableModel, this.productAddProduct);

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
            crossAxisCount: 3,
            childAspectRatio: (3 / 4),
            children: List.generate(
              categoriesList.length,
              (index) {
                categoryModel = CategoryModel.fromJson(categoriesList[index]);
                return InkWell(
                  onTap: () async {
                    categoryModel =
                        CategoryModel.fromJson(categoriesList[index]);
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsScreen(
                            widget.sessionModel,
                            categoryModel.id,
                            categoryModel.title,
                            widget.tableModel,
                            widget.productAddProduct),
                      ),
                    );

                  },
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(categoryModel.image),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                            border: Border.all(
                                color: Color.fromRGBO(143, 148, 251, 1),
                                width: 0.5),
                            color: Color.fromRGBO(143, 148, 251, 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            categoryModel.title,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(143, 158, 191, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void getAllCategory() async {
    var categoryList = await apiManagerInAppService.getAllCategory(
        widget.sessionModel.refreshToken.toString(),
        widget.sessionModel.accessToken.toString());
    if (categoryList.isEmpty) {
    } else {
      setState(() {
        categoriesList = categoryList;
      });
    }
  }
}
