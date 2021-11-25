import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/product_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';

class ProductDetailScreen extends StatefulWidget {
  SessionModel sessionModel;
  ProductModel productModel;

  ProductDetailScreen(this.productModel,this.sessionModel);
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildListView(context),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      children: [
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: (MediaQuery.of(context).size.height),
            height: (MediaQuery.of(context).size.height)*0.69,
            child: Text(widget.productModel.title),
        ),
        Image.network(widget.productModel.image),
      ],
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromRGBO(143, 148, 251, 1),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
    );
  }

}