import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/colors/color.dart';
import 'package:todo_app/controller/create_page_controller.dart';
import 'package:todo_app/controller/update_page_controller.dart';

class FormFieldWidgets extends StatelessWidget {
  final String errorMessage, labelText, hintText;
  final TextEditingController controller;
  const FormFieldWidgets({
    required this.errorMessage,
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: controller,
        cursorColor: AppColor.primary,
        enabled: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
          ),
          hintStyle: const TextStyle(color: AppColor.placeholder),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(20),
          fillColor: Colors.white,
          focusColor: AppColor.primary,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIconColor: Colors.black,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      ),
    );
  }
}

class FormFieldLargeWidgets extends StatelessWidget {
  final String errorMessage, labelText, hintText;
  final TextEditingController controller;
  const FormFieldLargeWidgets({
    required this.errorMessage,
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: controller,
        maxLines: 20,
        minLines: 10,
        cursorColor: AppColor.primary,
        enabled: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
          ),
          hintStyle: const TextStyle(color: AppColor.placeholder),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(20),
          fillColor: Colors.white,
          focusColor: AppColor.primary,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIconColor: Colors.black,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      ),
    );
  }
}

class DropDownFieldWidgets extends StatelessWidget {
  const DropDownFieldWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePageController());
    return DropdownButtonFormField(
      isExpanded: true,
      enableFeedback: true,
      value: 'Low',
      dropdownColor: AppColor.textWhite,
      padding: const EdgeInsets.symmetric(vertical: 8),
      items: const [
        DropdownMenuItem(
          value: 'High',
          child: Text('High'),
        ),
        DropdownMenuItem(
          value: 'Medium',
          child: Text('Medium'),
        ),
        DropdownMenuItem(
          value: 'Low',
          child: Text('Low'),
        ),
      ],
      decoration: InputDecoration(
        filled: true,
        labelText: 'Priority',
        hintText: "Select the priority level for your notes",
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
        ),
        hintStyle: const TextStyle(color: AppColor.placeholder),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(20),
        fillColor: Colors.white,
        focusColor: AppColor.primary,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIconColor: Colors.black,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      onChanged: (value) {
        controller.updateDropdownValue(value ?? 'Low');
      },
    );
  }
}

class DropDownFieldUpdateWidgets extends StatelessWidget {
  const DropDownFieldUpdateWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePageController());
    return DropdownButtonFormField(
      isExpanded: true,
      enableFeedback: true,
      dropdownColor: AppColor.textWhite,
      padding: const EdgeInsets.symmetric(vertical: 8),
      value: controller.dropdownController.text,
      items: const [
        DropdownMenuItem(
          value: 'High',
          child: Text('High'),
        ),
        DropdownMenuItem(
          value: 'Medium',
          child: Text('Medium'),
        ),
        DropdownMenuItem(
          value: 'Low',
          child: Text('Low'),
        ),
      ],
      decoration: InputDecoration(
        filled: true,
        labelText: 'Priority',
        hintText: "Select the priority level for your notes",
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
        ),
        hintStyle: const TextStyle(color: AppColor.placeholder),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(20),
        fillColor: Colors.white,
        focusColor: AppColor.primary,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIconColor: Colors.black,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      onChanged: (value) {
        controller.updateDropdownValue(value ?? 'Low');
      },
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String normalText, boldText;
  final Function buttonFunction;
  const CustomTextButton(
      {super.key,
      required this.normalText,
      required this.boldText,
      required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => buttonFunction(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              normalText,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              boldText,
              style: const TextStyle(color: AppColor.textWhite),
            )
          ],
        ),
      ),
    );
  }
}
