import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
    CustomButton({
        super.key,
        required this.isChecked, 
        required this.onTap,
    });

    bool isChecked;
    VoidCallback onTap;

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: onTap,
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: isChecked ? Colors.blue : Colors.white30,
                    borderRadius: BorderRadius.circular(50),
                ),
                child: SizedBox(
                    height: 10,
                    width: 10,
                    child: isChecked ? Center(child: Icon(Icons.check)) : null,
                ),
            ),
        );
    }
}
