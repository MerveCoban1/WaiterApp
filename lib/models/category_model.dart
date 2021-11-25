class CategoryModel{
  var is_sub_category;
  var id;
  var image;
  var title;
  var branch;
  var createdAt;
  var updatedAt;
  var slug;
  var v;

  CategoryModel(this.is_sub_category, this.id, this.image, this.title,
      this.branch, this.createdAt, this.updatedAt, this.slug, this.v);

  CategoryModel.fromJson(Map json){
    this.is_sub_category=json["is_sub_category"];
    this.id=json["id"];
    this.image=json["image"];
    this.title=json["title"];
    this.branch=json["branch"];
    this.createdAt=json["createdAt"];
    this.updatedAt=json["updatedAt"];
    this.slug=json["slug"];
    this.v=json["v"];
  }

  Map toJson(){
    return {
      "is_sub_category":is_sub_category,
      "id":id,
      "image":image,
      "title":title,
      "branch":branch,
      "createdAt":createdAt,
      "updatedAt":updatedAt,
      "slug":slug,
      "v":v,
    };
  }
}
