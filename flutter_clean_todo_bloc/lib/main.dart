import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'index.dart';
import 'injection/container_injection.dart' as di;
import 'view/blocs/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (_) => AppIndex(),
    ),
  );
}
