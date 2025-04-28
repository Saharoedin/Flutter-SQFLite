import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_form_controller.dart';

class ProductFormView extends GetView<ProductFormController> {
  const ProductFormView({super.key});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Form'),
        centerTitle: true,
      ),
      body: SizedBox(),
    );
  }
}
