import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/colors/color.dart';
import 'package:todo_app/controller/create_page_controller.dart';
import 'package:todo_app/widgets/custom_widgets_form.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePageController());
    return Scaffold(
      backgroundColor: AppColor.textWhite,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.textWhite,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.chevron_left_sharp)),
        title: const Text(
          'Add Notes',
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Divider(
              color: AppColor.placeholder,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FormFieldWidgets(
                      errorMessage: 'Title required!',
                      hintText: 'Title',
                      labelText: 'Title',
                      controller: controller.titleController,
                    ),
                    FormFieldLargeWidgets(
                      errorMessage: 'Notes required!',
                      hintText: 'Notes',
                      labelText: 'Notes',
                      controller: controller.notesController,
                    ),
                    const DropDownFieldWidgets(),
                  ],
                ),
              ),
            ),
            CustomTextButton(
              normalText: '',
              boldText: 'Submit',
              buttonFunction: () => controller.createData(),
            ),
          ],
        ),
      ),
    );
  }
}
