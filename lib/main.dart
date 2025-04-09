import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:wasil_flutter_task/firebase_options.dart';

import 'app/app.dart';
import 'app/get_it/get_it.dart';
import 'core/common/services/shared_prefs/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await SharedPrefs.initialize();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions
            .currentPlatform, // Firebase configuration generated automatically
  );
  runApp(const Wasil());
}
