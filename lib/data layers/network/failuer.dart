// this is file for if will happend an error response from api to user we need return only code error and message error
class Failuer {
  int code; //200 , 201, 400 ,303 , 500 and so on
  String message;
  Failuer(this.code, this.message);
}
