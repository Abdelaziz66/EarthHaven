import 'package:flutter/material.dart';
import '../../../../core/style/textStyles.dart';

class SelectFrom extends StatelessWidget {
  const SelectFrom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                'Select From !',
                style: Styles.textStyle20,
              ),
            ],
          ),
        ));
  }
}
