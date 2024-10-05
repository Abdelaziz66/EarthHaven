import 'package:flutter/material.dart';
import '../../../../core/functions/custom_snack_bar_message.dart';

class LayoutAppBar extends StatelessWidget {
  const LayoutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 18,
            ),
            const Text(
              'EarthHaven',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                showFloatingTopBanner(
                    context: context, message: 'Coming Soon :)');
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}







class StyledButton extends StatefulWidget {
  @override
  _StyledButtonState createState() => _StyledButtonState();
}

class _StyledButtonState extends State<StyledButton> {
  bool _isHovered = false;

  void _onEnter(PointerEvent details) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: () {
          // Add your onPressed logic here
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [_isHovered ? Color(0xFF292929) : Color(0xFF171717), Color(0xFF242424)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(9999),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1),
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: Offset(0, 10),
                blurRadius: 20,
              ),
            ],
            border: Border.all(color: Color(0xFF292929)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [_isHovered ? Color(0xFF292929) : Color(0xFF171717), Color(0xFF242424)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(1),
                      offset: Offset(0, 1),
                      blurRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: Offset(0, 5),
                      blurRadius: 10,
                    ),
                  ],
                  border: Border.all(color: Color(0xFF252525)),
                ),
                child: Center(
                  child: CustomPaint(
                    size: Size(30, 30),
                    painter: ArrowIconPainter(isHovered: _isHovered),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArrowIconPainter extends CustomPainter {
  final bool isHovered;

  ArrowIconPainter({required this.isHovered});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.white, Color(0xFFAAAAAA)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(4, 15)
      ..lineTo(23.586, 15)
      ..lineTo(19.293, 19.293)
      ..lineTo(25.293, 25.293)
      ..lineTo(31.293, 19.293)
      ..lineTo(25.293, 13.293)
      ..lineTo(23.586, 15)
      ..lineTo(5, 15)
      ..close();

    canvas.drawPath(path, paint);

    if (isHovered) {
      canvas.save();
      canvas.rotate(-35 * 3.14159 / 180); // Rotate when hovered
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
