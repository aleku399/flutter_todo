import 'package:flutter/material.dart';
import 'package:todo/widgets/custom_container.dart';
import 'package:todo/widgets/custom_button.dart';


class TodoItem extends StatelessWidget {
    TodoItem({
        super.key,
        required this.item,
        required this.onChecked,
        required this.onRemove,
    });

    final dynamic item;
    final Function(dynamic) onChecked;
    final Function(dynamic) onRemove;

    @override
    Widget build(BuildContext context) {
        return  CustomContainer(
            color: Colors.white30,
            height: 50,
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        CustomButton(
                            isChecked: item.isChecked,
                            onTap: () => onChecked(item),
                        ),
                        SizedBox(
                            width: 20,
                        ),
                        Text(
                            item.title,
                            style: TextStyle(
                                fontSize: 16,
                            ),
                        ),
                        SizedBox(
                            width: 50,
                        ),
                        Expanded(                           
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: FloatingActionButton(
                                    onPressed: () => onRemove(item),
                                    backgroundColor:  Colors.white30,
                                    child: Icon(
                                        Icons.close
                                    ),
                                ),
                            ),
                        ),
                    ],
                ),
            )
        );
    }
}
