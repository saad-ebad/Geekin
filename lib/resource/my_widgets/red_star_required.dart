import 'package:flutter/material.dart';

import '../app_colors.dart';

class RequiredStar extends StatelessWidget {
  const RequiredStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("*", style: TextStyle(color: AppColors.requiredField),);
  }
}