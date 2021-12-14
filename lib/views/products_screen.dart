import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/add_product.dart';
import 'package:waiter_app_demo/models/product_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/models/table_model.dart';
import 'package:waiter_app_demo/services/in_app_service.dart';
import 'package:waiter_app_demo/views/product_detail_screen.dart';
import 'package:waiter_app_demo/views/table_screen.dart';
import 'package:waiter_app_demo/widgets/product_card.dart';

class ProductsScreen extends StatefulWidget {
  SessionModel sessionModel;
  TableModel tableModel;
  List<Products_AddProduct> productAddProduct;
  var categoryId;
  var categoryName;

  ProductsScreen(this.sessionModel, this.categoryId, this.categoryName,
      this.tableModel, this.productAddProduct);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var productsList = [];
  InAppService apiManagerInAppService = InAppService();
  late ProductModel productModel;

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

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
          height: (MediaQuery.of(context).size.height) * 0.69,
          child: ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (BuildContext context, int index) {
              productModel = ProductModel.fromJson(productsList[index]);
              return InkWell(
                onTap: () async {
                  List<Products_AddProduct> list = await getMyBranch();
                  list = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(
                          productModel,
                          widget.sessionModel,
                          widget.tableModel,
                          myOptionsList,
                          widget.productAddProduct),
                    ),
                  );
                  setState(() {
                    widget.productAddProduct = list;
                  });
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
                        productModel.title,
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
            },
          ),
        ),
      ],
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromRGBO(143, 148, 251, 1)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TableScreen(
                    widget.tableModel, widget.sessionModel,widget.productAddProduct,1),
              ),
            );
          },
        ),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(143, 148, 251, 1),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10.0),
          child: Text(
            widget.categoryName,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(143, 148, 251, 1),
            ),
          ),
        ),
      ),
    );
  }

  void getAllProducts() async {
    var productList = await apiManagerInAppService.getProductsByCategoryId(
        widget.sessionModel.refreshToken.toString(),
        widget.sessionModel.accessToken.toString(),
        widget.categoryId.toString());
    print(widget.sessionModel.accessToken);
    print(widget.sessionModel.refreshToken);
    print(widget.categoryId);
    if (productList.isEmpty) {
      print("list Boş");
    } else {
      setState(() {
        productsList = productList;
      });
    }
  }
  Future<List<Products_AddProduct>> getMyBranch() async {
    var List = <Products_AddProduct>[];
    var _myOptionsList = await apiManagerInAppService.getOptions(
        widget.sessionModel.refreshToken, widget.sessionModel.accessToken);
    if (_myOptionsList.isEmpty) {
      print("Ahmet");
    } else {
      setState(() {
        myOptionsList = _myOptionsList;
      });
    }
    return List;
  }
}
