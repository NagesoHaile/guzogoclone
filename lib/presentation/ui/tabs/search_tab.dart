import 'package:flutter/material.dart';
import 'package:guzogoclone/constants/colors.dart';
import 'package:guzogoclone/presentation/providers/cabin_class_provider.dart';
import 'package:guzogoclone/presentation/providers/passenger_provider.dart';
import 'package:guzogoclone/presentation/ui/widgets/components/top_content.dart';
import 'package:guzogoclone/presentation/ui/widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            double screenHeight = constraint.maxHeight;

            double aspectRatio = 16 / 9;

            double containerHeight = screenHeight * 0.5;
            double containerWidth = containerHeight * aspectRatio;

            return Column(
              children: [
                TopContent(
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                ),
                const BottomContent(),
                const SizedBox(
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
        ),
      ),
    );
  }
}

class OneWay extends StatelessWidget {
  const OneWay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('One-Way');
  }
}

class Return extends StatelessWidget {
  const Return({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Return');
  }
}

class BottomContent extends StatelessWidget {
  const BottomContent({super.key});

  Widget cabinClassBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Cabin Class'),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          Expanded(
            child: TextButton(
              onPressed: () {
                Provider.of<CabinClassProvider>(context, listen: false)
                    .selectCabinClass('Business');
                Navigator.pop(context);
              },
              child: Text(
                Provider.of<CabinClassProvider>(context, listen: false)
                    .cabinClass[0]
                    .name,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: TextButton(
              onPressed: () {
                Provider.of<CabinClassProvider>(context, listen: false)
                    .selectCabinClass('Economy');
                Navigator.pop(context);
              },
              child: Text(
                Provider.of<CabinClassProvider>(context).cabinClass[1].name,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: TextButton(
              onPressed: () {
                Provider.of<CabinClassProvider>(context, listen: false)
                    .selectCabinClass('First');
                Navigator.pop(context);
              },
              child: Text(
                Provider.of<CabinClassProvider>(context).cabinClass[2].name,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget passengerBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Passengers'),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Done',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          Row(
            children: [
              Text(
                Provider.of<PassengerProvider>(context, listen: false)
                    .passenger[0]
                    .category,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_circle,
                    ),
                  ),
                  Text(Provider.of<PassengerProvider>(context)
                      .passenger[0]
                      .count
                      .toString()),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Divider(),
          Row(
            children: [
              Text(
                Provider.of<PassengerProvider>(context, listen: false)
                    .passenger[1]
                    .category,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_circle,
                    ),
                  ),
                  Text(Provider.of<PassengerProvider>(context)
                      .passenger[0]
                      .count
                      .toString()),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Divider(),
          Row(
            children: [
              Text(
                Provider.of<PassengerProvider>(context, listen: false)
                    .passenger[2]
                    .category,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_circle,
                    ),
                  ),
                  Text(Provider.of<PassengerProvider>(context)
                      .passenger[0]
                      .count
                      .toString()),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle,
                    ),
                  ),
                ],
              )
            ],
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
        const TableRow(
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
                  const Text(
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
                          context: context, builder: cabinClassBottomSheet);
                    },
                    child: Text(
                      Provider.of<CabinClassProvider>(context)
                          .selectedCabinClass,
                      style: const TextStyle(
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
                  const Text(
                    'Passengers',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context, builder: passengerBottomSheet);
                    },
                    icon: const Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 35,
                            ),
                            Text('2')
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 25,
                            ),
                            Text('0')
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [Icon(Icons.person), Text('0')],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
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
                style: const TextStyle(
                    fontSize: 20.0,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                '${start.year}',
                style: const TextStyle(
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
