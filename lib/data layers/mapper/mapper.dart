import 'package:advanced_arabic_mina_course/application layers/extensions.dart';
import 'package:advanced_arabic_mina_course/application%20layers/constants.dart';
import 'package:advanced_arabic_mina_course/data%20layers/responses/responses.dart';
import 'package:advanced_arabic_mina_course/domain%20layers/model/models.dart';

extension CustomerResonseMapper on CustomerResponse? {
  // customerResponse will be customer objects in to domain function
  // this is function to convert this response to  model and this is function will return customer object or customer model and this model in file models and this customerResponse in file respons

  // this word mean you in extension CustomerResponse like you in or used CustomerResponse so this word will get the items or attrebutis in this class
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.nameOfNotifiications.orZero() ?? Constants.zero,
    );
  }
}

extension ContactResponseMapper on ContactResponse? {
  // contactsResponse will be contacts objects in to domain function
  Contacts toDomain() {
    return Contacts(
      phone: this?.phone.orEmpty() ?? Constants.empty,
      email: this?.email.orEmpty() ?? Constants.empty,
      link: this?.link.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthontcationMapper on AuthenticationRespose? {
  Authentication toDomain() {
    return Authentication(
        contacts: this?.contactResponse.toDomain(),
        customer: this?.customerResponse.toDomain());
  }
}
