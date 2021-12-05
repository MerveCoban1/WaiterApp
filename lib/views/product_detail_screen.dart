import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/add_product.dart';
import 'package:waiter_app_demo/models/hamper.dart';
import 'package:waiter_app_demo/models/my_branch.dart';
import 'package:waiter_app_demo/models/product_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/models/table_model.dart';
import 'package:waiter_app_demo/views/hamper_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  SessionModel sessionModel;
  ProductModel productModel;
  TableModel tableModel;
  List<Products_AddProduct> productAddProduct;
  List<dynamic> myOptionsList;

  ProductDetailScreen(this.productModel, this.sessionModel, this.tableModel,
      this.myOptionsList, this.productAddProduct);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var _number = 1,
      select = 0,
      totalPrice,
      currency,
      items = <String>[],
      itemsId,
      optionsList = <Options>[],
      product = <Product>[],
      productAddProduct,
      options = <Optionn>[],
      options_ = <Options_AddProduct>[],
      ListItemId = <String>[],
      optionId,
      dropdownvalue = 'Boy Seçiniz',
      dropdownvalue1 = 'Boy Seçiniz',
      priceId = '';

  @override
  void initState() {
    super.initState();
    Options deger;
    widget.productModel.options.forEach((element) {
      deger = getOptions(element)!;
      optionsList.add(deger);
    });
    widget.productModel.prices.forEach((element) {
      items.add(
          '${element.priceName.toString()}*${element.price.toString()}*${element.currency.toString()}*${element.sId.toString()}');
    });
    setState(() {
      productAddProduct = widget.productAddProduct;
      totalPrice = int.parse(items.first.split('*')[1]);
      currency = items.first.split('*')[2];
      priceId = items.first.split('*')[3];
      dropdownvalue = items.first;
      dropdownvalue1 =
          optionsList.isNotEmpty ? optionsList.first.optionSpecialName : 'sa';
      optionsList = optionsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      appBar: buildAppBar(context),
      body: buildView(context, items, dropdownvalue),
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, "Hello world");
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 11.0),
            child: GestureDetector(
              child: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Hamper(widget.sessionModel, productAddProduct)));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 10.0),
            child: Center(
              child: Text(
                productAddProduct.length.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10.0),
          child: Text(
            widget.tableModel.title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildView(
      BuildContext context, List<String> items, String dropdownValue) {
    var width = (MediaQuery.of(context).size.width);
    var height = (MediaQuery.of(context).size.height);
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(65),
              topLeft: Radius.circular(65),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  widget.productModel.title,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(143, 158, 191, 1),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Text(
                    widget.productModel.description,
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromRGBO(143, 158, 191, 1),
                      fontWeight: FontWeight.w400,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0)
                            .copyWith(top: 0),
                        child: Divider(
                            height: 20, thickness: 2, color: Colors.black12),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.0, right: 25.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  '${(totalPrice * _number).toString()} ${currency} ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromRGBO(143, 158, 191, 1),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                        child: FloatingActionButton(
                                            heroTag: '+',
                                            onPressed: () {
                                              add();
                                            },
                                            child: Icon(Icons.add,
                                                color: Colors.black),
                                            backgroundColor: Colors.lightGreen),
                                        width: width * 0.06,
                                        height: height * 0.05),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Text(
                                        _number.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromRGBO(143, 158, 191, 1),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        child: FloatingActionButton(
                                            heroTag: '-',
                                            onPressed: () {
                                              minus();
                                            },
                                            child: Icon(Icons.remove,
                                                color: Colors.black),
                                            backgroundColor: Colors.redAccent),
                                        width: width * 0.06,
                                        height: height * 0.05),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Divider(
                          height: 20,
                          thickness: 2,
                          color: Colors.black12,
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.0, left: 10.0),
                          child: DropdownButton(
                            value: dropdownvalue,
                            isExpanded: true,
                            underline: SizedBox(),
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(143, 158, 191, 1),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                            items: items.map(
                              (String items) {
                                return DropdownMenuItem(
                                  onTap: () {
                                    setState(() {
                                      totalPrice =
                                          int.parse(items.split('*')[1]);
                                      currency = items.split('*')[2];
                                      priceId = items.split('*')[3];
                                    });
                                  },
                                  value: items,
                                  child: Row(
                                    children: [
                                      Text(
                                          '${items.split('*')[0]} ${items.split('*')[1]} ${items.split('*')[2]}'),
                                    ],
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Divider(
                          height: 20,
                          thickness: 2,
                          color: Colors.black12,
                        ),
                      ),
                      optionsList.isNotEmpty
                          ? Container(
                              //burada width verilecek ve options adını falan düzenlemesi var
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8),
                                itemCount: optionsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var itemList = optionsList[index].items;
                                  return Container(
                                    height: 50,
                                    margin: EdgeInsets.all(2),
                                    color: Colors.black38,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.0, left: 10.0),
                                      child: Column(
                                        children: [
                                          DropdownButton(
                                            value: dropdownvalue1,
                                            isExpanded: true,
                                            underline: SizedBox(),
                                            icon: Icon(Icons.arrow_downward),
                                            iconSize: 24,
                                            elevation: 16,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Color.fromRGBO(
                                                  143, 158, 191, 1),
                                            ),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalue1 = newValue!;
                                              });
                                            },
                                            items: itemList.map(
                                              (Items items) {
                                                return DropdownMenuItem(
                                                  onTap: () {
                                                    ListItemId.add(items.sId);
                                                    optionId =
                                                        optionsList[index].sId;
                                                    options_[index] =
                                                        Options_AddProduct(
                                                            id: optionId,
                                                            subOption:
                                                                ListItemId);
                                                    setState(() {
                                                      options_ = options_;
                                                    });
                                                  },
                                                  value: items.itemName,
                                                  child: Row(
                                                    children: [
                                                      Text(''),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 8.0, bottom: 8.0),
                                            child: Divider(
                                              height: 20,
                                              thickness: 2,
                                              color: Colors.black12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                  textStyle:
                      TextStyle(fontSize: 29, fontStyle: FontStyle.italic),
                  primary: Colors.white,
                  minimumSize: Size(95, 45),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                ),
                onPressed: () {
                  //Options_AddProduct(id: element.sId, subOption: element.items[4]);
                  var productAddProductList = Products_AddProduct(
                      product: widget.productModel.sId,
                      quantity: _number,
                      price: priceId,
                      options: options_,
                      description: widget.productModel.description,
                      title: widget.productModel.title);
                  productAddProduct.add(productAddProductList);
                  setState(() {
                    productAddProduct = productAddProduct;
                  });
                },
                child: Text('Sepete Ekle'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void add() {
    _number += 1;
    setState(() {
      _number = _number;
    });
  }

  void minus() {
    if (_number != 1) _number -= 1;
    setState(() {
      _number;
    });
  }

  Options? getOptions(String id) {
    late Options options;
    var i = 0;
    print('/////////////////');
    print(widget.myOptionsList);
    widget.myOptionsList.forEach((element) {
      print('**********************');
      print(element['_id']);
      print(id);
      if (element['_id'] == id) {
        i++;
        options = element;
      }
    });
    if (i != 0) {
      print(options);
      return options;
    } else {
      return null;
    }
  }
}
