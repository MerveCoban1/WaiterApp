class SessionModel{
  var accessToken;
  var refreshToken;

  SessionModel(
      this.accessToken,
      this.refreshToken,
      );

  SessionModel.fromJson(Map json){
    this.accessToken=json["accessToken"];
    this.refreshToken=json["refreshToken"];
  }

  Map toJson(){
    return {
      "accessToken":accessToken,
      "refreshToken":refreshToken,
    };
  }
}