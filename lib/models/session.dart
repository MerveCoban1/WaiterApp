class Session{
  var accessToken;
  var refreshToken;

  Session(
      this.accessToken,
      this.refreshToken,
      );

  Session.fromJson(Map json){
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