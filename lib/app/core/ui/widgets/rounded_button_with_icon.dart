import 'package:cuidapet_mobile_2/app/core/ui/extensions/size_screen_extension.dart';
import 'package:flutter/material.dart';

class RoundedButtonWithIcon extends StatelessWidget {
  final GestureTapCallback onTap;
  final double width;
  final Color color;
  final IconData icon;
  final String label;

  const RoundedButtonWithIcon({
    required this.onTap,
    required this.width,
    required this.color,
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: 45.h,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 2),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20.w,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: VerticalDivider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
