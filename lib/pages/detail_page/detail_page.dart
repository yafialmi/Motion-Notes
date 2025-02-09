import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/colors/color.dart';
import 'package:todo_app/controller/detail_page_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final controller = Get.put(DetailPageController());
    return Scaffold(
      backgroundColor: AppColor.textWhite,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.textWhite,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.chevron_left_sharp)),
        title: Text(
          args['title'],
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Divider(
              color: AppColor.placeholder,
            )),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => controller.fetchSpecificNoteToUpdate(args['id']),
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(args['note'])],
        ),
      ),
    );
  }
}
