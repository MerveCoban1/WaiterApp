class TableModel{
  var id;
  var busy;
  var order_type;
  var waiterId;
  var section;
  var title;
  var branch;
  var orders=[];
  var cancelled_orders=[];
  var paid_orders=[];
  var payments=[];
  var createdAt;
  var updatedAt;
  var v;
  var logs;
  var id2;

  TableModel(
      this.id,
      this.busy,
      this.order_type,
      this.waiterId,
      this.section,
      this.title,
      this.branch,
      this.orders,
      this.cancelled_orders,
      this.paid_orders,
      this.payments,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.logs,
      this.id2);

  TableModel.fromJson(Map json){
    this.id=json["id"];
    this.busy=json["busy"];
    this.order_type=json["order_type"];
    this.waiterId=json["waiterId"];
    this.section=json["section"];
    this.title=json["title"];
    this.branch=json["branch"];
    this.orders=json["orders"];
    this.cancelled_orders=json["cancelled_orders"];
    this.paid_orders=json["paid_orders"];
    this.payments=json["payments"];
    this.createdAt=json["createdAt"];
    this.updatedAt=json["updatedAt"];
    this.v=json["v"];
    this.logs=json["logs"];
    this.id2=json["id2"];
  }

  Map toJson(){
    return {
      "id":id,
      "busy":busy,
      "order_type":order_type,
      "waiterId":waiterId,
      "section":section,
      "title":title,
      "branch":branch,
      "orders":orders,
      "cancelled_orders":cancelled_orders,
      "paid_orders":paid_orders,
      "payments":payments,
      "createdAt":createdAt,
      "updatedAt":updatedAt,
      "v":v,
      "logs":logs,
      "id2":id2,
    };
  }
}
