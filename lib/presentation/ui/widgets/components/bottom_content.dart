import 'package:flutter/material.dart';
import 'package:guzogoclone/constants/colors.dart';
import 'package:guzogoclone/presentation/providers/cabin_class_provider.dart';
import 'package:guzogoclone/presentation/providers/passenger_provider.dart';
import 'package:guzogoclone/presentation/providers/trip_way_provider.dart';
import 'package:provider/provider.dart';

class BottomContent extends StatefulWidget {
  const BottomContent({super.key});

  @override
  State<BottomContent> createState() => _BottomContentState();
}

class _BottomContentState extends State<BottomContent> {
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
    return Consumer<PassengerProvider>(
      builder: (context, value, child) {
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
                      value.counts.add(value.adultCount);
                      value.counts.add(value.childrenCount);
                      value.counts.add(value.infantCount);

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
                        onPressed: () {
                          if (value.adultCount > 0) {
                            value.decrementAdultCount();
                          }
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                        ),
                      ),
                      Text(value.adultCount.toString()),
                      IconButton(
                        onPressed: () {
                          value.incrementAdultCount();
                        },
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
                    value.passenger[1].category,
                    style: const TextStyle(color: AppColors.primaryColor),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (value.childrenCount > 0) {
                            value.decrementChildrenCount();
                          }
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                        ),
                      ),
                      Text('${value.childrenCount}'),
                      IconButton(
                        onPressed: () {
                          value.incrementChildrenCount();
                        },
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
                        onPressed: () {
                          if (value.infantCount > 0) {
                            value.decrementInfantCount();
                          }
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                        ),
                      ),
                      Text('${value.infantCount}'),
                      IconButton(
                        onPressed: () {
                          value.incrementInfantCount();
                        },
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
      },
    );
  }

  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2023, 10, 12), end: DateTime(2023, 11, 12));

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(2023),
        lastDate: DateTime(2100));
    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Departure Date',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  TextButton(
                    onPressed: pickDateRange,
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Return Date',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  !Provider.of<TripWayProvider>(context).tripWay
                      ? Container()
                      : TextButton(
                          onPressed: pickDateRange,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${end.day}',
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
                                    '${end.month}',
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    '${end.year}',
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
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
            Consumer<PassengerProvider>(builder: (context, value, child) {
              return Padding(
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
                      icon: Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.person,
                                size: 35,
                              ),
                              Text('${value.adultCount}')
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.person,
                                size: 25,
                              ),
                              Text('${value.childrenCount}')
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.person),
                              Text('${value.infantCount}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ],
    );
  }
}
