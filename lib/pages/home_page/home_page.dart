import 'package:flutter/material.dart';

import 'package:todo_app/widgets/custom_widgets_home.dart';
import 'package:todo_app/colors/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.textWhite,
      appBar: AppBar(
        leading: const Text(''),
        backgroundColor: AppColor.textWhite,
        centerTitle: true,
        title: const Text(
          'Notes',
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Divider(
              color: AppColor.placeholder,
            )),
        actions: const [
          DropDownOption(),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleItem(),
            SizedBox(
              height: 8,
            ),
            ListItem(),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButtonCreate(),
    );
  }
}

