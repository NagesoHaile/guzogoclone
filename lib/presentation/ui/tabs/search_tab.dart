import 'package:flutter/material.dart';
import 'package:guzogoclone/constants/colors.dart';
import 'package:guzogoclone/presentation/ui/widgets/components/top_content.dart';

import 'package:guzogoclone/presentation/ui/widgets/custom_button.dart';
import 'package:intl/intl.dart';

DateTimeRange dateRange =
    DateTimeRange(start: DateTime(2023, 10, 12), end: DateTime(2023, 11, 12));
String formattedStartDate = formatDate(dateRange.start);
String formattedEndDate = formatDate(dateRange.end);

String formatDate(DateTime date) {
  final customFormat = DateFormat("d, EEEE MMMM");
  return customFormat.format(date);
}

final start = dateRange.start;
final end = dateRange.end;

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  

  @override
  Widget build(BuildContext context) {
    print(formattedStartDate);
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(
        builder: (context, constraint) {
          double screenHeight = constraint.maxHeight;

          double aspectRatio = 16 / 9;

          double containerHeight = screenHeight * 0.5;
          double containerWidth = containerHeight * aspectRatio;

          return Column(
            children: [
              TopContent(
                  containerWidth: containerWidth,
                  containerHeight: containerHeight),
              BottomContent(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(
                    buttonName: 'Search Flights', onPressed: () {}),
              )
            ],
          );
        },
      )),
    );
  }
}



 


class OneWay extends StatelessWidget {
  const OneWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('One-Way');
  }
}

class Return extends StatelessWidget {
  const Return({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BottomContent extends StatelessWidget {
  const BottomContent({super.key});

  Widget buildBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cabin Class'),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
          Expanded(
            child: TextButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              child: Text(
                'Business',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Economy',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'First',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Departure Date',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  DateSelection(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Return Date',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  DateSelection(),
                ],
              ),
            )
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Cabin Class',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context, builder: buildBottomSheet);
                    },
                    child: Text(
                      'Economy',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Passengers',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  Passenger()
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Passenger extends StatelessWidget {
  const Passenger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Row(
          children: [
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 35,
                  ),
                  Text('2')
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 25,
                  ),
                  Text('0')
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Row(
                children: [Icon(Icons.person), Text('0')],
              ),
            ),
          ],
        ));
  }
}

class DateSelection extends StatelessWidget {
  const DateSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        showDateRangePicker(
            context: context,
            initialDateRange: dateRange,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${start.day}',
            style: const TextStyle(
                fontSize: 60.0,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${start.month}',
                style: TextStyle(
                    fontSize: 20.0,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                '${start.year}',
                style: TextStyle(
                    fontSize: 20.0,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w300),
              )
            ],
          )
        ],
      ),
    );
  }
}
