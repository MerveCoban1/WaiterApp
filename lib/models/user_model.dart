class UserModel{
  var _id;
  var email;
  var name;
  var createdAt;
  var updatedAt;
  var __v;


  UserModel(this._id, this.email, this.name, this.createdAt, this.updatedAt,
      this.__v);

  UserModel.fromJson(Map json){
    this._id=json["_id"];
    this.email=json["email"];
    this.name=json["name"];
    this.createdAt=json["createdAt"];
    this.updatedAt=json["updatedAt"];
    this.__v=json["__v"];
  }

  Map toJson(){
    return {
      "_id":_id,
      "email":email,
      "name":name,
      "createdAt":createdAt,
      "updatedAt":updatedAt,
      "__v":__v,
    };
  }
}