import 'package:flutter/material.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/widgets/glass_box.dart';
import '../../domain/entities/plant_entity.dart';
import '../manager/scan_cubit.dart';

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
          ScanCubit.get(context).scanPlant( context: context);
        },
        child:  Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 20,
                      color: Colors.lightBlueAccent,
                    ),


                    Container(
                      width: 35,
                      height: 20,
                      color: Colors.tealAccent,
                    ),


                    Container(
                      width: 35,
                      height: 20,
                      color: Colors.lightBlueAccent,
                    ),
                  ],
                ),
              ),
            ),
            const Center(
              child: GlassBox(
                  widget: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         Icon(Icons.auto_awesome, color: Colors.white),
                        SizedBox(width: 15,),

                        Text('Get Report',style: Styles.textStyle18,),
                      ],
                    ),
                  ),
                  color: Colors.transparent,
                  borderRadius: 30,
                  x: 30,
                  y: 15,
                  border: true),
            ),
          ],
        ),
      ),
    );
  }
}