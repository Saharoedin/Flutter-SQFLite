import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/unit_model.dart';
import 'package:flutter_sqflite/app/modules/unit/controllers/unit_controller.dart';
import 'package:flutter_sqflite/app/widgets/dialog_confirm.dart';
import 'package:get/get.dart';

class UnitItem extends StatelessWidget {
  const UnitItem({
    super.key,
    required this.unit,
    required this.controller,
  });

  final Unit unit;
  final UnitController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(
        bottom: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      title: Text('${unit.name}'),
      trailing: GestureDetector(
        onTap: () {
          Get.dialog(
            DialogConfirm(
              name: '${unit.name}',
              onTap: () => controller.deleteData(
                int.parse('${unit.id}'),
              ),
            ),
          );
        },
        child: Icon(
          CupertinoIcons.trash,
          size: 20,
          color: Colors.red,
        ),
      ),
    );
  }
}
