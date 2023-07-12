import 'package:advanced_arabic_mina_course/application%20layers/di.dart';
import 'package:flutter/material.dart';

import 'application layers/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppMoudle();
  runApp(MyApp());
}
