import 'package:flutter/material.dart';

import '../widgets/glass_box.dart';

void customDialog({required context,required Widget widget }){
  showDialog<String>(
    context: context,
    barrierColor: Colors.black.withOpacity(.3),
    useSafeArea: true,
    builder: (BuildContext context) =>  AlertDialog(
      insetPadding: const EdgeInsets.all(0.0),
      scrollable: false,
      shadowColor: Colors.transparent,
      content:DialogTemplate(widget:widget ,),
      elevation: 0,
      clipBehavior: Clip.none,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,

    ),
  );
}


class DialogTemplate extends StatelessWidget{
  const DialogTemplate({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: GlassBox(
            widget: Stack(
              children: [
                Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GlassBox(
                        widget: widget,
                        color: Colors.white.withOpacity(.5),
                        borderRadius: 30,
                        x: 20,
                        y: 20,
                        border: false,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ],
            ),
            color: Colors.transparent,
            borderRadius: 0,
            x: 3,
            y: 3,
            border: false,
          ),
        ),
      ),
    );
  }


}