class SectionModel{
  var id;
  var title;
  var branch;
  var createdAt;
  var updatedAt;
  var v;
  var id2;


  SectionModel(this.id, this.title, this.branch, this.createdAt, this.updatedAt,
      this.v, this.id2);

  SectionModel.fromJson(Map json){
    this.id=json["id"];
    this.title=json["title"];
    this.branch=json["branch"];
    this.createdAt=json["createdAt"];
    this.updatedAt=json["updatedAt"];
    this.v=json["v"];
    this.id2=json["id2"];
  }

  Map toJson(){
    return {
      "id":id,
      "title":title,
      "branch":branch,
      "createdAt":createdAt,
      "updatedAt":updatedAt,
      "v":v,
      "id2":id2,
    };
  }
}
