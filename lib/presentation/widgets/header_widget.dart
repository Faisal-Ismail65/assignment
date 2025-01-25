import 'package:assignment/constants/strings.dart';
import 'package:assignment/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants/colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  Strings.datingList,
                  textAlign: TextAlign.center,
                  style: AppStyles.titleStyle,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: Strings.search,
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon:
                        const Icon(Icons.search, color: AppColors.black),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 24,
            left: 20,
            child: Icon(
              Icons.arrow_back,
              size: 25,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
