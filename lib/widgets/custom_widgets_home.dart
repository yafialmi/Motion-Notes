import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/colors/color.dart';
import 'package:todo_app/controller/detail_page_controller.dart';
import 'package:todo_app/controller/home_page_controller.dart';

final homeController = Get.put(HomePageController());
final detailController = Get.put(DetailPageController());

class TitleItem extends StatelessWidget {
  const TitleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: AppColor.secondary,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Title',
              style: TextStyle(color: AppColor.textWhite, fontSize: 18),
            ),
            Text(
              'Priority',
              style: TextStyle(color: AppColor.textWhite, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    return Obx(() {
      if (homeController.notesList.isEmpty) {
        return const Center(child: Text("No Notes Found"));
      }
      return Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: homeController.notesList.length,
          itemBuilder: (context, index) {
            final item = homeController.notesList[index];
            if (item.priority == "High") {
              borderColor = AppColor.danger;
            } else if (item.priority == "Medium") {
              borderColor = AppColor.warning;
            } else {
              borderColor = AppColor.success;
            }
            return Dismissible(
                key: Key(item.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  decoration: const BoxDecoration(
                      color: AppColor.danger,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.delete, color: AppColor.textWhite),
                ),
                onDismissed: (direction) {
                  homeController.deleteNote(item.id);
                },
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    tileColor: AppColor.textWhite,
                    enableFeedback: true,
                    title: Text(item.title),
                    trailing: Text(item.priority),
                    onTap: () => detailController.fetchSpecificNote(item.id),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: borderColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                  ),
                ));
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
        ),
      );
    });
  }
}

class FloatingActionButtonCreate extends StatelessWidget {
  const FloatingActionButtonCreate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.toNamed('/create_page'),
      backgroundColor: AppColor.primary,
      elevation: 8,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

class DropDownOption extends StatelessWidget {
  const DropDownOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton<int>(
      dropdownColor: AppColor.textWhite,
      icon: const Icon(Icons.more_vert, color: AppColor.textBlack),
      items: const [
        DropdownMenuItem(
          value: 3,
          child: Text('Order by Oldest'),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('Order by Newest'),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text('Order by Priority'),
        ),
      ],
      onChanged: (value) {
        homeController.optionValue.value = value ?? 0;
        homeController.optionFetch();
      },
    ));
  }
}
