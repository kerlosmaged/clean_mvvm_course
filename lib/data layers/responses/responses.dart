import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BasedResponse {
  @JsonKey(name: "statues") // this is Jsonkey Must write like in api
  int?
      satutes; // but this is named anything don't need to name any Name will be true

  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id") // this is Jsonkey Must write like in api
  String?
      id; // but this is named anything don't need to name any Name will be true

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "nameOfNotifiications")
  int? nameOfNotifiications;

  CustomerResponse(this.id, this.name, this.nameOfNotifiications);

  // form json
  factory CustomerResponse.fromJson(json) => _$CustomerResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactResponse {
  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "link")
  String? link;

  ContactResponse(this.email, this.phone, this.link);

  // from json

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);
}

@JsonSerializable()
class AuthenticationRespose extends BasedResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customerResponse;

  @JsonKey(name: "contacts")
  ContactResponse? contactResponse;

  AuthenticationRespose(this.contactResponse, this.customerResponse);

  // from json => this is mean you have an api and need to convert from api to response
  factory AuthenticationRespose.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResposeFromJson(json);

  //to json => this is mean you have response and need to convert from response to api
  Map<String, dynamic> toJson() => _$BasedResponseToJson(this);
}
