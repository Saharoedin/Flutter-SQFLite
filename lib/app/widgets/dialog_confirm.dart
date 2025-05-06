import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogConfirm extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const DialogConfirm({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        controller: ScrollController(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  CupertinoIcons.clear,
                  color: Colors.red,
                  size: 18,
                ),
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Text(
              'Are you sure want to remove ${name}? This data will be remove permanetly.'),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () => Get.back(),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
