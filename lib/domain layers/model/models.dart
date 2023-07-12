// onboarding models
// this is class contains same as object only for all of data title and subtitle and image the main class because you passed the data in this varable
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

class SliderViewObject {
  SliderObject sliderobject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderobject,
    required this.numOfSlides,
    required this.currentIndex,
  });
}

// login models

// this is called customer model
class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(
    this.id,
    this.name,
    this.numOfNotifications,
  );
}

// this is called contacts model
class Contacts {
  String phone;
  String email;
  String link;

  Contacts({
    required this.phone,
    required this.email,
    required this.link,
  });
}

// this is called authentication model
class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication({
    required this.contacts,
    required this.customer,
  });
}
