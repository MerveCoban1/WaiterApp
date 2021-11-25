class ProductModel{
  var id;
  var active_list=[];
  var options=[];
  var prices=[];
  var end_time;
  var start_time;
  var image;
  var branch;
  var category;
  var description;
  var title;
  var createdAt;
  var updatedAt;
  var slug;
  var v;
  var id2;

  ProductModel(
      this.id,
      this.active_list,
      this.options,
      this.prices,
      this.end_time,
      this.start_time,
      this.image,
      this.branch,
      this.category,
      this.description,
      this.title,
      this.createdAt,
      this.updatedAt,
      this.slug,
      this.v,
      this.id2);

  ProductModel.fromJson(Map json){
    this.id=json["id"];
    this.active_list=json["active_list"];
    this.options=json["options"];
    this.prices=json["prices"];
    this.end_time=json["end_time"];
    this.start_time=json["start_time"];
    this.image=json["image"];
    this.branch=json["branch"];
    this.category=json["category"];
    this.description=json["description"];
    this.title=json["title"];
    this.createdAt=json["createdAt"];
    this.updatedAt=json["updatedAt"];
    this.slug=json["slug"];
    this.v=json["v"];
    this.id2=json["id2"];
  }

  Map toJson(){
    return {
      "id":id,
      "active_list":active_list,
      "options":options,
      "prices":prices,
      "end_time":end_time,
      "start_time":start_time,
      "image":image,
      "branch":branch,
      "category":category,
      "description":description,
      "title":title,
      "createdAt":createdAt,
      "updatedAt":updatedAt,
      "slug":slug,
      "v":v,
      "id2":id2,
    };
  }
}
