import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionsItemSearch extends StatelessWidget {
  const TransactionsItemSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void showFormBottomSheet(BuildContext context) {
    var controller = Get.put(TransactionController());
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            // borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.only(
            top: 76,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        // controller: controller.txtEndDate,
                        decoration: InputDecoration(
                          hintText: 'Type some text here...',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(CupertinoIcons.search),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.white,
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.blue),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Seblak',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata letak.',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          '${NumberFormat.currency(locale: 'id', symbol: 'IDR ').format(1000)}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/product2.jpg',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 24,
                                        left: 32,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                side: WidgetStatePropertyAll(
                                              BorderSide(color: Colors.blue),
                                            )),
                                            onPressed: () {
                                              //
                                            },
                                            child: Text(
                                              '1 item',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ))
                  // ListView(
                  //   padding: EdgeInsets.symmetric(horizontal: 16),
                  //   shrinkWrap: true,
                  //   controller: ScrollController(),
                  //   children: [
                  //     SizedBox(
                  //       height: 16,
                  //     ),
                  //     Text(
                  //       'Products',
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         // fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 8,
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.only(bottom: 16),
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(12),
                  //         border: Border.all(color: Colors.grey),
                  //       ),
                  //       child: Obx(
                  //         () => DropdownButton(
                  //           padding: EdgeInsets.all(0),
                  //           menuWidth: Get.width,
                  //           borderRadius: BorderRadius.circular(12),
                  //           hint: Text(
                  //             'Select...',
                  //             style: TextStyle(color: Colors.grey),
                  //           ),
                  //           isExpanded: true,
                  //           underline: SizedBox(),
                  //           // value: controller.categoryId.value == 0
                  //           //     ? null
                  //           //     : controller.categoryId.value,
                  //           items: controller.products.map(
                  //             (element) {
                  //               return DropdownMenuItem(
                  //                 value: element.id,
                  //                 child: Text('${element.name}'),
                  //               );
                  //             },
                  //           ).toList(),
                  //           onChanged: (value) {
                  //             // controller.categoryId.value = int.parse('${value}');
                  //           },
                  //         ),
                  //       ),
                  //     ),
                  //     Text(
                  //       'Description',
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         // fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 8,
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.only(bottom: 16),
                  //       child: TextFormField(
                  //         // controller: controller.txtEndDate,
                  //         decoration: InputDecoration(
                  //           hintText: 'Product description',
                  //           hintStyle: TextStyle(color: Colors.grey),
                  //           fillColor: Colors.white,
                  //           filled: true,
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(12),
                  //             borderSide: BorderSide(color: Colors.grey),
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(12),
                  //             borderSide: BorderSide(color: Colors.grey),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.only(bottom: 16),
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'Price',
                  //                   style: TextStyle(
                  //                     fontSize: 16,
                  //                     // fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //                 SizedBox(
                  //                   height: 8,
                  //                 ),
                  //                 TextFormField(
                  //                   // controller: controller.txtEndDate,
                  //                   decoration: InputDecoration(
                  //                     hintText: 'Price',
                  //                     hintStyle: TextStyle(color: Colors.grey),
                  //                     // suffixIcon: Icon(CupertinoIcons.calendar),
                  //                     fillColor: Colors.white,
                  //                     filled: true,
                  //                     border: OutlineInputBorder(
                  //                       borderRadius: BorderRadius.circular(12),
                  //                       borderSide: BorderSide.none,
                  //                     ),
                  //                     enabledBorder: OutlineInputBorder(
                  //                       borderRadius: BorderRadius.circular(12),
                  //                       borderSide:
                  //                           BorderSide(color: Colors.grey),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 16,
                  //           ),
                  //           Expanded(
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'Quantity',
                  //                   style: TextStyle(
                  //                     fontSize: 16,
                  //                     // fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //                 SizedBox(
                  //                   height: 8,
                  //                 ),
                  //                 TextFormField(
                  //                   // controller: controller.txtEndDate,
                  //                   decoration: InputDecoration(
                  //                     hintText: 'Qty',
                  //                     hintStyle: TextStyle(color: Colors.grey),
                  //                     // suffixIcon: Icon(CupertinoIcons.calendar),
                  //                     fillColor: Colors.white,
                  //                     filled: true,
                  //                     border: OutlineInputBorder(
                  //                       borderRadius: BorderRadius.circular(12),
                  //                       borderSide: BorderSide.none,
                  //                     ),
                  //                     enabledBorder: OutlineInputBorder(
                  //                       borderRadius: BorderRadius.circular(12),
                  //                       borderSide:
                  //                           BorderSide(color: Colors.grey),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Text(
                  //       'Discount',
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         // fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 8,
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.only(bottom: 16),
                  //       child: TextFormField(
                  //         // controller: controller.txtEndDate,
                  //         decoration: InputDecoration(
                  //           hintText: 'Discount',
                  //           hintStyle: TextStyle(color: Colors.grey),
                  //           fillColor: Colors.white,
                  //           filled: true,
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(12),
                  //             borderSide: BorderSide(color: Colors.grey),
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(12),
                  //             borderSide: BorderSide(color: Colors.grey),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Text(
                  //       'Tax',
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         // fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 8,
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.only(bottom: 16),
                  //       child: TextFormField(
                  //         // controller: controller.txtEndDate,
                  //         decoration: InputDecoration(
                  //           hintText: 'Tax',
                  //           hintStyle: TextStyle(color: Colors.grey),
                  //           fillColor: Colors.white,
                  //           filled: true,
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(12),
                  //             borderSide: BorderSide(color: Colors.grey),
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(12),
                  //             borderSide: BorderSide(color: Colors.grey),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.symmetric(vertical: 16),
                  //       width: Get.width,
                  //       child: ElevatedButton(
                  //         style: ButtonStyle(
                  //             backgroundColor:
                  //                 WidgetStatePropertyAll(Colors.blue),
                  //             padding: WidgetStatePropertyAll(
                  //               EdgeInsets.symmetric(
                  //                   vertical: 14, horizontal: 32),
                  //             ),
                  //             shape: WidgetStatePropertyAll(
                  //               RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(12),
                  //               ),
                  //             )),
                  //         onPressed: () {
                  //           if (_formKey.currentState!.validate()) {
                  //             if (controller.isNew.value == true) {
                  //               //
                  //             } else {
                  //               //
                  //             }
                  //           }
                  //         },
                  //         child: Text(
                  //           '${controller.isNew.value ? 'Checkout' : 'Update'}',
                  //           style: TextStyle(color: Colors.white, fontSize: 18),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
