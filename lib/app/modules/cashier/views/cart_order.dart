import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:flutter_sqflite/app/modules/cashier/views/detail_order.dart';
import 'package:get/get.dart';

class CartOrder extends StatelessWidget {
  const CartOrder({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CashierController());
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.only(
        top: 76,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        CupertinoIcons.clear,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 34,
            width: Get.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController(),
                    itemCount: controller.listOrderStatus.length,
                    itemBuilder: (context, index) {
                      var status = controller.listOrderStatus[index];
                      return GestureDetector(
                        onTap: () {
                          controller.orderStatus.value = '$status';
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: controller.orderStatus.value == '$status'
                                  ? Colors.blue
                                  : Colors.transparent,
                              border: Border(
                                bottom: BorderSide(
                                  color:
                                      controller.orderStatus.value == '$status'
                                          ? Colors.amberAccent
                                          : Colors.transparent,
                                  style: BorderStyle.solid,
                                  width:
                                      controller.orderStatus.value == '$status'
                                          ? 3
                                          : 1,
                                ),
                              ),
                            ),
                            child: Text(
                              '$status',
                              style: TextStyle(
                                color: controller.orderStatus.value == '$status'
                                    ? Colors.amberAccent
                                    : Colors.white,
                                fontSize:
                                    controller.orderStatus.value == '$status'
                                        ? 16
                                        : 14,
                                fontWeight:
                                    controller.orderStatus.value == '$status'
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                shrinkWrap: true,
                controller: ScrollController(),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            '${controller.orderStatus.value}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          '10 Orders',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.blue,
                              context: context,
                              builder: (context) => DetailOrder(),
                            );
                          },
                          child: CartItem());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  Icons.restaurant,
                  color: Colors.blue.shade800,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '17 November 2022 - 16:47 WIB',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'DNI-0001',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            color: Colors.grey.shade200,
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Diproses',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
              Text(
                '5 items',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
