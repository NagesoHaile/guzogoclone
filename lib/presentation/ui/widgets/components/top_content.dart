import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guzogoclone/constants/colors.dart';
import 'package:guzogoclone/presentation/providers/airport_provider.dart';
import 'package:guzogoclone/presentation/providers/bottom_nav_provider.dart';
import 'package:guzogoclone/presentation/ui/show_location_selection.dart';
import 'package:guzogoclone/presentation/ui/tabs/notification_tab.dart';

import 'package:guzogoclone/presentation/ui/widgets/custom_tab_view.dart';
import 'package:provider/provider.dart';

class TopContent extends StatefulWidget {
  final double containerWidth;
  final double containerHeight;
  const TopContent(
      {super.key, required this.containerWidth, required this.containerHeight});

  @override
  State<TopContent> createState() => _TopContentState();
}

class _TopContentState extends State<TopContent> {
  bool isSwapped = false;

  void swapLocationPicker(bool value) {
    setState(() {
      isSwapped = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: widget.containerWidth,
          height: widget.containerHeight,
          child: Image.asset(
            'images/road.png',
            color: Colors.indigo.withOpacity(0.7),
            colorBlendMode: BlendMode.modulate,
            fit: BoxFit.cover,
            height: 400,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Spacer(),
                  Text('Guzo go',
                      style: GoogleFonts.dancingScript(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.amber.shade700)),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Provider.of<BottomNavProvider>(context, listen: false)
                          .selectItem(2);
                    },
                    icon: Container(
                      // padding: const EdgeInsets.all(10.0),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: Colors.white60,
                          width: 3.0,
                        ),
                      ),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white60,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              //////////////////////////////////
              const CustomTabBar(),
              ////////////////////////////////
              // the buttons for destination and departure location are lie here
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isSwapped
                      ? const DestinationLocationPicker(
                          proposition: 'To',
                        )
                      : const DepartureLocationPicker(
                          proposition: 'From',
                        ),
                  IconButton(
                    onPressed: () {
                      swapLocationPicker(!isSwapped);
                    },
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            size: 15,
                          ),
                          Icon(
                            Icons.arrow_back,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  isSwapped
                      ? const DepartureLocationPicker(
                          proposition: 'From',
                        )
                      : const DestinationLocationPicker(
                          proposition: 'To',
                        )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class DestinationLocationPicker extends StatelessWidget {
  final String proposition;
  const DestinationLocationPicker({
    super.key,
    required this.proposition,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showBottomSheet(
            context: context,
            builder: (context) => const ShowDestinationLocationSelection());
      },
      child: Column(
        children: [
          Text(
            proposition,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          ),
          Text(
            Provider.of<DestinationAirportProvider>(context)
                .selectedDestination
                .cityCode
                .toString(),
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          ),
          Text(
            Provider.of<DestinationAirportProvider>(context)
                .selectedDestination
                .city
                .toString(),
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          ),
          Text(
            Provider.of<DestinationAirportProvider>(context)
                .selectedDestination
                .airportName
                .toString(),
            style: const TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          )
        ],
      ),
    );
  }
}

class DepartureLocationPicker extends StatelessWidget {
  final String proposition;
  const DepartureLocationPicker({
    super.key,
    required this.proposition,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showBottomSheet(
            context: context,
            builder: (context) => const ShowDepartureLocationSelection());
      },
      child: Column(
        children: [
          Text(
            proposition,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          ),
          Text(
            Provider.of<DepartureAirportProvider>(context)
                .selectedDeparture
                .cityCode
                .toString(),
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          ),
          Text(
            Provider.of<DepartureAirportProvider>(context)
                .selectedDeparture
                .city
                .toString(),
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          ),
          Text(
            Provider.of<DepartureAirportProvider>(context)
                .selectedDeparture
                .airportName
                .toString(),
            style: const TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          )
        ],
      ),
    );
  }
}
