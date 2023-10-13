import 'package:flutter/material.dart';
import 'package:guzogoclone/constants/colors.dart';
import 'package:guzogoclone/presentation/providers/trip_way_provider.dart';
import 'package:provider/provider.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  // bool showFirstContent = ; // Default to show the first content

  void toggleContent(bool newValue) {
    Provider.of<TripWayProvider>(context, listen: false)
        .toggleTripWay(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TripWayProvider>(
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.0),
            border: Border.all(
              color: Colors.white60,
              width: 2.0,
            ),
          ),
          child: Center(
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  toggleContent(true);
                  if (value.tripWay) {
                    print(value.tripWay);
                  }
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .4,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .08,
                        vertical: 15),
                    decoration: BoxDecoration(
                      color:value.tripWay ? AppColors.white
                              : null,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Text(
                        'Return',
                        style: TextStyle(
                            color:value.tripWay ? AppColors.primaryColor
                                : AppColors.white),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  toggleContent(false);
                  if (!value.tripWay) {
                    // Provider.of<TripWayProvider>(context, listen: false)
                    //     .toggleTripWay(
                    //         Provider.of<TripWayProvider>(context, listen: false)
                    //             .tripWay);
                    print(value.tripWay);
                  }
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .4,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .08,
                        vertical: 15),
                    decoration: BoxDecoration(
                      color:value.tripWay ? null
                              : AppColors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Text(
                        'One-Way',
                        style: TextStyle(
                          color:value.tripWay  ? AppColors.white
                              : AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
