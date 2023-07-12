// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasedResponse _$BasedResponseFromJson(Map<String, dynamic> json) =>
    BasedResponse()
      ..satutes = json['statues'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BasedResponseToJson(BasedResponse instance) =>
    <String, dynamic>{
      'statues': instance.satutes,
      'message': instance.message,
    };

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      json['id'] as String?,
      json['name'] as String?,
      json['nameOfNotifiications'] as int?,
    );

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameOfNotifiications': instance.nameOfNotifiications,
    };

ContactResponse _$ContactResponseFromJson(Map<String, dynamic> json) =>
    ContactResponse(
      json['email'] as String?,
      json['phone'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$ContactResponseToJson(ContactResponse instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthenticationRespose _$AuthenticationResposeFromJson(
        Map<String, dynamic> json) =>
    AuthenticationRespose(
      json['contacts'] == null
          ? null
          : ContactResponse.fromJson(json['contacts'] as Map<String, dynamic>),
      json['customer'] == null
          ? null
          : CustomerResponse.fromJson(json['customer']),
    )
      ..satutes = json['statues'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResposeToJson(
        AuthenticationRespose instance) =>
    <String, dynamic>{
      'statues': instance.satutes,
      'message': instance.message,
      'customer': instance.customerResponse,
      'contacts': instance.contactResponse,
    };
