import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/payment_method_model.dart';
import 'package:flutter_sqflite/app/modules/payment_method/controllers/payment_method_controller.dart';
import 'package:flutter_sqflite/app/widgets/dialog_confirm.dart';
import 'package:get/get.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.paymentMethod,
    required this.controller,
  });

  final PaymentMethod paymentMethod;
  final PaymentMethodController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(
        bottom: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      title: Text('${paymentMethod.name}'),
      subtitle: Text('Reference No : ${paymentMethod.reference}'),
      trailing: GestureDetector(
        onTap: () {
          Get.dialog(
            DialogConfirm(
              name: '${paymentMethod.name}',
              onTap: () => controller.deleteData(
                int.parse('${paymentMethod.id}'),
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
