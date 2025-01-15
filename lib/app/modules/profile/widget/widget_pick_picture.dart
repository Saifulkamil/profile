import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:profile/app/modules/profile/profile_controller.dart';

class WidgetPickPicture extends StatelessWidget {
  const WidgetPickPicture({
    required this.controller,
    super.key,
  });

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: const BoxDecoration(
          color: whiteMainColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeader(onPressed: () {}, text: "PILIH FOTO"),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Column(
              children: [
                Material(
                  color: colorTransparan,
                  child: InkWell(
                    onTap: () {
                      controller.pilihFoto();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.image,
                          size: 30,
                          color: greenMainColor,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          "FOTO DARI GALERI",
                          style: ColorApp.blackTextStyle(context).copyWith(
                              fontSize: fontSize18, fontWeight: medium),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Material(
                  color: colorTransparan,
                  child: InkWell(
                    onTap: () {
                      controller.ambilfoto();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.camera_alt,
                          color: greenMainColor,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          "AMBIL FOTO DARI KAMERA",
                          style: ColorApp.blackTextStyle(context).copyWith(
                              fontSize: fontSize18, fontWeight: medium),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
