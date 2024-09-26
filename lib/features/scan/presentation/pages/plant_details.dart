import 'package:earth_haven/core/style/textStyles.dart';
import 'package:earth_haven/core/widgets/glass_box.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/background.dart';
import '../../domain/entities/plant_entity.dart';

class PlantDetails extends StatefulWidget {
  const PlantDetails({super.key, required this.plantInfoEntity});
  final PlantInfoEntity? plantInfoEntity;

  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        widget:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            leading:  Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 10),
              child: IconButton(icon: const FaIcon(FontAwesomeIcons.angleLeft,size: 30,), onPressed: () { GoRouter.of(context).pop(); },),
            ),
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
              background: Hero(
                tag: '',
                transitionOnUserGestures: true,
                child: Image.network(
                  '${widget.plantInfoEntity?.images}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: Transform.translate(
                  offset: const Offset(0, 1),
                  child: GlassBoxWithOnlyTopBorder(widget: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Container(
                        height: 8,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ), color: Colors.black54, borderRadius: 30, x: 5, y: 5, border: false),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUp(
                          delay: const Duration(milliseconds: 200),
                          child: CustomTextHeaderShape(
                            title: '${widget.plantInfoEntity?.name}',
                            subTitle: '${widget.plantInfoEntity?.probability}',
                          ),
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 400),

                          child: CustomTextShape(
                            title: 'Description',
                            subTitle: '${widget.plantInfoEntity?.description}',
                          ),
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 600),

                          child: CustomTextShape(
                            title: 'commonUses',
                            subTitle: '${widget.plantInfoEntity?.commonUses}',
                          ),
                        ),
                        CustomTextShape(
                          title: 'culturalSignificance',
                          subTitle:
                              '${widget.plantInfoEntity?.culturalSignificance}',
                        ),
                        CustomTextShape(
                          title: 'bestWatering',
                          subTitle: '${widget.plantInfoEntity?.bestWatering}',
                        ),
                        CustomTextShape(
                          title: 'bestSoilType',
                          subTitle: '${widget.plantInfoEntity?.bestSoilType}',
                        ),
                        CustomTextShape(
                          title: 'bestLightCondition',
                          subTitle:
                              '${widget.plantInfoEntity?.bestLightCondition}',
                        ),
                        CustomTextShape(
                          title: 'toxicity',
                          subTitle: '${widget.plantInfoEntity?.toxicity}',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class CustomTextShape extends StatelessWidget {
  const CustomTextShape({
    super.key,
    required this.subTitle,
    required this.title,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subTitle,
            style: Styles.textStyle16,
          ),
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
    //   child: GlassBoxWithCustomBorder(
    //       widget: Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               title,
    //               style: Styles.textStyle18,
    //             ),
    //             const SizedBox(
    //               height: 10,
    //             ),
    //             Text(
    //               subTitle,
    //               style: Styles.textStyle16,
    //             ),
    //           ],
    //         ),
    //       ),
    //       color: Colors.white10,
    //       borderRadius: 40,
    //       x: 150,
    //       y: 150,
    //       border: true),
    // );
  }
}

class CustomTextHeaderShape extends StatelessWidget {
  const CustomTextHeaderShape({
    super.key,
    required this.subTitle,
    required this.title,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {

    return FadeInUp(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, bottom: 10,top: 30,right: 15),
        child: GlassBoxWithCustomBorder(
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.seedling,color: Colors.white,size: 20,),
                      const SizedBox(width: 15,),
                      Text(
                        title,
                        style: Styles.textStyle18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.wandMagicSparkles,color: Colors.white70,size: 18,),
                      const SizedBox(width: 15,),
                      Text(
                        subTitle,
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            color: Colors.white10,
            borderRadius: 30,
            x: 150,
            y: 150,
            border: true),
      ),
    );
  }
}
