import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
    CustomContainer({
        super.key, 
        required this.child,
        this.height,
        this.width,
        this.onTap,
        this.color,
    });

    Widget child;
    double? height;
    double? width;
    VoidCallback? onTap;
    Color? color;

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: onTap,
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                    ),
                    child: child,
                ),
            ),
        );
    }
}