import 'package:flutter/material.dart';
import 'package:piScreen/providers/timetable_provider.dart';
import 'package:provider/provider.dart';

import 'piScreenApp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TimeTableProvider>(
        create: (context) => TimeTableProvider())
  ], child: PiScreenApp()));
}
