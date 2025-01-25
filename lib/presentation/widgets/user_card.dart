import 'package:assignment/constants/strings.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/styles.dart';
import 'package:assignment/data/models/user_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.event_available,
                color: AppColors.primaryColor,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text('Dinner', style: AppStyles.headingStyle),
              ),
              Icon(Icons.more_horiz),
            ],
          ),
          const SizedBox(height: 5),
          Divider(),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(user.picture?.thumbnail ?? ''),
                      radius: 25,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.userStatusColor,
                          border: Border.all(
                            color: AppColors.white,
                            width: 2,
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name?.first ?? ''} - ${user.registered?.age ?? ''}',
                      style: AppStyles.headingStyle,
                    ),
                    Text(
                      '3 km from you',
                      style: AppStyles.subHeadingStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(Icons.chat, size: 30, color: AppColors.primaryColor),
              const SizedBox(width: 10),
              Icon(Icons.call, size: 30, color: AppColors.primaryColor),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.event),
                        const SizedBox(width: 10),
                        Text(Strings.date, style: AppStyles.labelStyle),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                        DateFormat("EEE, MMM dd yyyy").format(
                            DateTime.parse(user.registered?.date ?? '')),
                        style: AppStyles.labelStyle),
                    const SizedBox(height: 10),
                    Text(
                        DateFormat("hh:mm a").format(
                            DateTime.parse(user.registered?.date ?? '')
                                .toLocal()),
                        style: AppStyles.labelStyle),
                  ],
                ),
              ),
              Container(
                height: 90,
                width: 2,
                color: Colors.grey.shade300,
                margin: EdgeInsets.only(right: 10),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        const SizedBox(width: 10),
                        Text(Strings.location, style: AppStyles.labelStyle),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('${user.location?.city}, ${user.location?.country}',
                        style: AppStyles.labelStyle),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
