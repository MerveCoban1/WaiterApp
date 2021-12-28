import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/add_product.dart';
import 'package:waiter_app_demo/models/product_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/models/table_model.dart';
import 'package:waiter_app_demo/services/in_app_service.dart';
import 'package:waiter_app_demo/views/product_detail_screen.dart';

class ProductCard extends StatefulWidget {
  ProductModel productModel;
  SessionModel sessionModel;
  TableModel tableModel;
  List<Products_AddProduct> productAddProduct;

  ProductCard(this.productModel, this.sessionModel, this.tableModel,
      this.productAddProduct);

  @override
  _ProductCardState createState() => _ProductCardState();
}

var myOptionsList = [];
InAppService apiManagerInAppService = InAppService();

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        List<Products_AddProduct> list = await getMyBranch();
        widget.productAddProduct = list;
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
        child: Container(
          height: (MediaQuery.of(context).size.height) * 0.10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
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
              widget.productModel.title,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(143, 158, 191, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Products_AddProduct>> getMyBranch() async {
    var List = <Products_AddProduct>[];
    var _myOptionsList = await apiManagerInAppService.getOptions(
        widget.sessionModel.refreshToken, widget.sessionModel.accessToken);
    if (_myOptionsList.isNotEmpty) {
      setState(() {
        myOptionsList = _myOptionsList;
      });
      print(widget.productModel);
      List = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
              widget.productModel,
              widget.sessionModel,
              widget.tableModel,
              myOptionsList,
              widget.productAddProduct),
        ),
      );
    }
    return List;
  }
}
