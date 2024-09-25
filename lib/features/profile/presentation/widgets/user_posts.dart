import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earth_haven/core/style/textStyles.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/glass_box.dart';
import '../../../news/domain/entities/post_entity.dart';

class UserPostItem extends StatelessWidget {
  const UserPostItem({super.key, required this.userPostEntity});
  final PostEntity userPostEntity;
  @override
  Widget build(BuildContext context) {
    return GlassBox(
      widget: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ConditionalBuilder(
              condition: userPostEntity.caption != '',
              builder: (context) => Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      userPostEntity.caption!,
                      style: Styles.textStyle12.copyWith(color: Colors.white70),
                    ),
                  ),
                ),
              ),
              fallback: (context) => ConditionalBuilder(
                  condition: userPostEntity.image != '',
                  builder: (context) => Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                userPostEntity.image!,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                  fallback: (context) => const SizedBox(
                        height: 0,
                      )),
            ),
          ],
        ),
      ),
      color: Colors.blueGrey.withOpacity(.2),
      borderRadius: 15,
      x: 0,
      y: 0,
      border: false,
    );
  }
}
