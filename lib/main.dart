import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'app/get_it/get_it.dart';
import 'core/common/services/shared_prefs/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await SharedPrefs.initialize();

  runApp(const Wasil());
}
