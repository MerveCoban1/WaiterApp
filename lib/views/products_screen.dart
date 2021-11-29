import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/product_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/services/in_app_service.dart';
import 'package:waiter_app_demo/widgets/product_card.dart';

class ProductsScreen extends StatefulWidget {
  SessionModel sessionModel;
  var categoryId;
  var categoryName;
  ProductsScreen(this.sessionModel,this.categoryId,this.categoryName);
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var productsList=[];
  InAppService apiManagerInAppService=InAppService();
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
            height: (MediaQuery.of(context).size.height)*0.69,
            child: ListView.builder(
              itemCount: productsList.length,
              itemBuilder: (BuildContext context, int index) {
                productModel=ProductModel.fromJson(productsList[index]);
                print(productsList);
                return ProductCard(productModel,widget.sessionModel);
              },
            )
        ),
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
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0,top: 10.0),
          child: Text(widget.categoryName,
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

  void getAllProducts() async{
    var productList=await apiManagerInAppService.getProductsByCategoryId(widget.sessionModel.refreshToken.toString(),widget.sessionModel.accessToken.toString(),widget.categoryId.toString());
    if(productList.isEmpty){
      print("hata");
    }else{
      setState(() {
        productsList=productList;
      });
      print(productList);
    }
  }

}