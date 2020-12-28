import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection/injection.dart';
import 'view/view.dart';

class AppIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      builder: DevicePreview.appBuilder,
      home: BlocProvider<CategoryBloc>(
        child: CategoryPage(),
        create: (context) => sl<CategoryBloc>()..add(GetCategoryListEvent()),
      ),
    );
  }
}
