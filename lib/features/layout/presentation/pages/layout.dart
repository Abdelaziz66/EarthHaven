import 'package:flutter/material.dart';
import '../../../../core/constants/constant.dart';
import '../widgets/layout_body.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: layoutScaffoldKey,
      body: const LayoutBody(),
    );
  }
}

