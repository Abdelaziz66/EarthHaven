import 'package:flutter/material.dart';

import '../../../../core/functions/get_report.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/widgets/glass_box.dart';
import '../../domain/entities/plant_entity.dart';

class GetReport extends StatelessWidget {
  const GetReport({
    super.key,
    required this.plantInfoEntity,
  });

  final PlantInfoEntity? plantInfoEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          clickOnGetReport(context,plantInfoEntity);
        },
        child: const GlassBox(
            widget: Center(
              child:Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Get Report',style: Styles.textStyle18,),
              ),
            ),
            color: Colors.white10,
            borderRadius: 20,
            x: 100,
            y: 100,
            border: true),
      ),
    );
  }
}