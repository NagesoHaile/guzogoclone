import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guzogoclone/constants/colors.dart';
import 'package:guzogoclone/presentation/ui/location_list_screen.dart';

import 'package:guzogoclone/presentation/ui/widgets/custom_tab_view.dart';

class TopContent extends StatefulWidget {
  final double containerWidth;
  final double containerHeight;
  const TopContent(
      {super.key, required this.containerWidth, required this.containerHeight});

  @override
  State<TopContent> createState() => _TopContentState();
}

class _TopContentState extends State<TopContent> {
  int _selectedTab = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTab = index;
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
            'images/road.jpg',
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
                    onPressed: () {},
                    icon: Container(
                      // padding: const EdgeInsets.all(10.0),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: Colors.white60,
                          width: 3.0,
                        ),
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white60,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomTabView(
                index: _selectedTab,
                changeTab: changeTab,
              ),
              //TODO: the buttons for destination and departure location are lie here
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LocationPicker(
                      proposition: 'From',
                      city: 'Addis Ababa',
                      cityCode: 'ADD',
                      airportName: 'Bole International Airport'),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
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
                  const LocationPicker(
                      proposition: 'To',
                      city: 'Nairobi',
                      cityCode: 'NRB',
                      airportName: 'Jommo Kenyatta Airport')
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class LocationPicker extends StatelessWidget {
  final String proposition;
  final String city;
  final String cityCode;
  final String airportName;
  const LocationPicker({
    super.key,
    required this.proposition,
    required this.city,
    required this.cityCode,
    required this.airportName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LocationListScreen();
        }));
      },
      child: Column(
        children: [
          Text(
            proposition,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          ),
          Text(
            cityCode,
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          ),
          Text(
            city,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          ),
          Text(
            airportName,
            style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          )
        ],
      ),
    );
  }
}
