import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
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
      priceName,
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
      dropdownvaluelist = <String>[],
      optionsPrice = <int>[],
      optionsPriceTotal = 0.0,
      priceId = '',
      subOption = <String>[];

  @override
  void initState() {
    super.initState();
    late Options? deger;
    widget.productModel.options != null
        ? widget.productModel.options.forEach((element) {
            if (element != null) {
              deger = getOptions(element);
              if (deger != null) {
                optionsList.add(deger!);
                dropdownvaluelist.add(deger!.items.first.itemName.toString());
                optionsPrice.add(deger!.items.first.price);
                subOption.add(deger!.items.first.sId);
                Options_AddProduct oop = Options_AddProduct(
                    id: deger!.sId,
                    subOption: subOption,
                    option_name: deger!.optionName,
                    subOptionReply: deger!.items.first.itemName);
                options_.add(oop);
              }
            }
          })
        : null;
    widget.productModel.prices.forEach((element) {
      items.add(
          '${element.priceName.toString()}*${element.price.toString()}*${element.currency.toString()}*${element.sId.toString()}');
    });
    optionsPrice.forEach((element) {
      optionsPriceTotal += element;
    });
    setState(() {
      productAddProduct = widget.productAddProduct;
      priceName = items.first.split('*')[0];
      totalPrice = double.parse(items.first.split('*')[1]);
      currency = items.first.split('*')[2];
      priceId = items.first.split('*')[3];
      dropdownvalue = items.first;
      dropdownvaluelist = dropdownvaluelist;
      optionsList = optionsList;
      optionsPriceTotal = optionsPriceTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      appBar: buildAppBar(context),
      body: buildView(context, items, dropdownvalue.split('*')[0]),
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, productAddProduct);
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
              onTap: widget.productAddProduct.isNotEmpty
                  ? () async {
                      productAddProduct = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Hamper(widget.sessionModel,
                                  productAddProduct, widget.tableModel)));
                      setState(() {
                        productAddProduct = productAddProduct;
                      });
                    }
                  : null,
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
                                  '${(totalPrice + optionsPriceTotal) * _number} ${currency} ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromRGBO(143, 158, 191, 1),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.1,
                                height: height * 0.05,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xff707070)),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    child: Text(
                                      _number.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(143, 158, 191, 1),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    onTap: () {
                                      var val = _number;
                                      showDialog(
                                        context: context,
                                        builder: (context) => StatefulBuilder(
                                            builder: (BuildContext context,
                                                StateSetter setModalState) {
                                          return AlertDialog(
                                            contentPadding:
                                                EdgeInsetsDirectional.only(
                                                    bottom: 0),
                                            actionsPadding:
                                                EdgeInsetsDirectional.all(0),
                                            title: Center(
                                                child: new Text(
                                              widget.productModel.title,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(
                                                    143, 158, 191, 1),
                                                fontWeight: FontWeight.w900,
                                              ),
                                            )),
                                            content: Container(
                                              height: height * 0.22,
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(height: 7),
                                                  Text(
                                                    'Adet Seçimi',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromRGBO(
                                                          143, 158, 191, 1),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  NumberPicker(
                                                      value: val,
                                                      minValue: 1,
                                                      maxValue: 100,
                                                      step: 1,
                                                      onChanged: (value) =>
                                                          setModalState(() {
                                                            val = value;
                                                          })),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              // usually buttons at the bottom of the dialog
                                              Center(
                                                child: new TextButton(
                                                  child: new Text("Tamam"),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            143, 148, 251, 1),
                                                    textStyle: TextStyle(
                                                        fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                    primary: Colors.white,
                                                    minimumSize: Size(95, 45),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16.0),
                                                    shape:
                                                        const BeveledRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7)),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _number = val;
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                      );
                                    },
                                  ),
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
                            style: TextStyle(
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
                                      dropdownValue = dropdownvalue
                                          .split('*')[0]
                                          .toString();
                                      totalPrice =
                                          double.parse(items.split('*')[1]);
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
                              height: height * 0.5,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: optionsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var itemList = optionsList[index].items;
                                  return Container(
                                    height: height * 0.13,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 10.0, left: 10.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: width,
                                                child: Text(
                                                  optionsList[index]
                                                      .optionSpecialName,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromRGBO(
                                                        143, 158, 191, 1),
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Container(
                                                  width: width,
                                                  child: DropdownButton(
                                                    value:
                                                        dropdownvaluelist[index]
                                                            .toString(),
                                                    isExpanded: true,
                                                    underline: SizedBox(),
                                                    icon: Icon(
                                                        Icons.arrow_downward),
                                                    iconSize: 24,
                                                    elevation: 16,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Color.fromRGBO(
                                                          143, 158, 191, 1),
                                                    ),
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        dropdownvaluelist[
                                                            index] = newValue!;
                                                      });
                                                    },
                                                    items: itemList.map(
                                                      (Items items) {
                                                        return DropdownMenuItem(
                                                          onTap: () {
                                                            var _price = 0.0;
                                                            optionsPrice[
                                                                    index] =
                                                                items.price;
                                                            optionsPrice
                                                                .forEach(
                                                                    (element) {
                                                              _price += element;
                                                            });
                                                            subOption[index] =
                                                                (items.sId);
                                                            Options_AddProduct oop = Options_AddProduct(
                                                                id: optionsList[
                                                                        index]
                                                                    .sId,
                                                                subOption: [
                                                                  subOption[
                                                                      index]
                                                                ],
                                                                option_name:
                                                                    optionsList[
                                                                            index]
                                                                        .optionName,
                                                                subOptionReply:
                                                                    items
                                                                        .itemName);
                                                            options_[index] =
                                                                (oop);
                                                            setState(() {
                                                              options_ =
                                                                  options_;
                                                              optionsPriceTotal =
                                                                  _price;
                                                            });
                                                          },
                                                          value: items.itemName,
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                  '${items.itemName} (${items.price} ${currency} ekle)'),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ).toList(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                  print(
                      'opPrice: ${optionsPriceTotal} totalPrice: $totalPrice number: $_number');
                  var productAddProductList = Products_AddProduct(
                      currency: currency,
                      totalPrice: (totalPrice + optionsPriceTotal),
                      productSelect: dropdownValue,
                      productId: widget.productModel.sId,
                      quantity: _number,
                      priceId: priceId,
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

  Options? getOptions(String id) {
    late Options options;
    var i = 0;
    widget.myOptionsList.forEach((element) {
      if (element['_id'] == id) {
        i++;
        options = Options.fromJson(element);
      }
    });
    if (i != 0) {
      return options;
    } else {
      return null;
    }
  }
}
