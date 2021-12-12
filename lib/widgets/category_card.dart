import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/add_product.dart';
import 'package:waiter_app_demo/models/category_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/models/table_model.dart';
import 'package:waiter_app_demo/views/products_screen.dart';

class CategoryCard extends StatefulWidget {
  CategoryModel categoryModel;
  SessionModel sessionModel;
  TableModel tableModel;
  List<Products_AddProduct> productAddProduct;

  CategoryCard(this.categoryModel, this.sessionModel, this.tableModel, this.productAddProduct);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  var List=<Products_AddProduct>[];
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
       List= await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductsScreen(
                    widget.sessionModel,
                    widget.categoryModel.id,
                    widget.categoryModel.title,
                    widget.tableModel, widget.productAddProduct)));
       setState(() {
         widget.productAddProduct=List;
       });
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
                  image: NetworkImage(widget.categoryModel.image),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
                border: Border.all(
                    color: Color.fromRGBO(143, 148, 251, 1), width: 0.5),
                color: Color.fromRGBO(143, 148, 251, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                widget.categoryModel.title,
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
  }
}
