import 'dart:io';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:profile/app/modules/profile/profile_controller.dart';
import 'package:profile/app/modules/profile/widget/widget_pick_picture.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(), // Background utama
          Positioned(
            top: MediaQuery.of(context).size.height * 0.23, // Posisi container
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nama :",
                        style: ColorApp.blackTextStyle(context).copyWith(
                            fontSize: fontSize18, fontWeight: reguler),
                      ),
                      Flexible(
                        child: Text(
                          "Polan Stang mio",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: ColorApp.blackTextStyle(context).copyWith(
                              fontSize: fontSize18, fontWeight: medium),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1.5,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "NIK",
                        style: ColorApp.blackTextStyle(context).copyWith(
                            fontSize: fontSize18, fontWeight: reguler),
                      ),
                      Flexible(
                        child: Text(
                          "-",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: ColorApp.blackTextStyle(context).copyWith(
                              fontSize: fontSize18, fontWeight: medium),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1.5,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Posisi",
                        style: ColorApp.blackTextStyle(context).copyWith(
                            fontSize: fontSize18, fontWeight: reguler),
                      ),
                      Flexible(
                        child: Text(
                          "Mandor panen",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: ColorApp.blackTextStyle(context).copyWith(
                              fontSize: fontSize18, fontWeight: medium),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1.5,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Lainnya",
                    style: ColorApp.blackTextStyle(context)
                        .copyWith(fontSize: fontSize18, fontWeight: reguler),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SelectableText(
                    "lainnya",
                    // "sdf",
                    style: ColorApp.blackTextStyle(context)
                        .copyWith(fontSize: fontSize18, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1.5,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Lainnya",
                    style: ColorApp.blackTextStyle(context)
                        .copyWith(fontSize: fontSize18, fontWeight: reguler),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SelectableText(
                    "lainnya",
                    style: ColorApp.blackTextStyle(context)
                        .copyWith(fontSize: fontSize18, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1.5,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 23,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const SizedBox(height: 1000),
                ],
              ),
            ),
          ),
          // CircleAvatar di tengah atas
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15, // Posisi avatar
            left: 0,
            right: 0,
            child: Center(
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      builder: (BuildContext context) {
                        return WidgetPickPicture(controller: controller);
                      });
                },
                child: Stack(
                  children: [
                    Obx(() => CircleAvatar(
                          radius: 60,
                          backgroundImage: controller.isprofilepath.value
                              // Cek apakah ada path gambar yang dipilih
                              ? FileImage(
                                      File(controller.profilepathpicture.value))
                                  as ImageProvider
                              // Jika tidak ada gambar yang dipilih, tampilkan gambar default
                              : NetworkImage(
                                  "https://example.com/default_profile_picture.jpg"),
                          backgroundColor: grey2Color, // Warna background
                          child: controller.profilepathpicture.value.isEmpty
                              ? const Icon(Icons.person,
                                  size: 50, color: Colors.black)
                              : null,
                        )),
                    Positioned(
                        bottom: -15,
                        right: -10,
                        child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                builder: (BuildContext context) {
                                  return WidgetPickPicture(
                                      controller: controller);
                                },
                              );
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 45,
                              color: greenMainColor,
                            )))
                  ],
                ),
              ),
            ),
          ),
          // AppBar custom
          Column(
            children: [
              PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leadingWidth: 40,
                  leading: IconButton(
                    onPressed: () {
                      // Ganti dengan logika navigasi Anda
                      // Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  title: Text(
                    "PROFILE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper untuk membuat row
  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
