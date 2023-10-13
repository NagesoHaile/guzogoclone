import 'package:flutter/material.dart';
import 'package:guzogoclone/constants/colors.dart';
import 'package:guzogoclone/presentation/providers/airport_provider.dart';
import 'package:provider/provider.dart';

class ShowDepartureLocationSelection extends StatelessWidget {
  const ShowDepartureLocationSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final departureDisplayList =
        Provider.of<DepartureAirportProvider>(context).displayList;

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Select Airport',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) =>
                    Provider.of<DepartureAirportProvider>(context)
                        .updateList(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  hintText: "Search here",
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const Text('Direct Airports'),
              Provider.of<DepartureAirportProvider>(context).displayList == 0
                  ? const Center(
                      child: Text('No results found'),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount:
                            Provider.of<DepartureAirportProvider>(context)
                                .displayList
                                .length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Provider.of<DepartureAirportProvider>(context,
                                      listen: false)
                                  .selectDepartureAirport(
                                      departureDisplayList[index]);
                              Provider.of<DepartureAirportProvider>(context,
                                      listen: false)
                                  .selectDepartureAirport(
                                      departureDisplayList[index]);
                              Navigator.pop(context);
                            },
                            leading: const Icon(Icons.airplane_ticket),
                            title: Text(
                                "${Provider.of<DepartureAirportProvider>(context).displayList[index].city!},${Provider.of<DepartureAirportProvider>(context).displayList[index].airportName}(${Provider.of<DepartureAirportProvider>(context).displayList[index].cityCode})"),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class ShowDestinationLocationSelection extends StatelessWidget {
  const ShowDestinationLocationSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final destinationDisplayList =
        Provider.of<DestinationAirportProvider>(context).displayList;

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Select Airport',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) =>
                    Provider.of<DestinationAirportProvider>(context)
                        .updateList(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  hintText: "Search here",
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const Text('Direct Airports'),
              Provider.of<DestinationAirportProvider>(context).displayList == 0
                  ? const Center(
                      child: Text('No results found'),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount:
                            Provider.of<DestinationAirportProvider>(context)
                                .displayList
                                .length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Provider.of<DestinationAirportProvider>(context,
                                      listen: false)
                                  .selectDestinationAirport(
                                      destinationDisplayList[index]);

                              Navigator.pop(context);
                            },
                            leading: const Icon(Icons.airplane_ticket),
                            title: Text(
                                "${Provider.of<DestinationAirportProvider>(context).displayList[index].city!},${Provider.of<DestinationAirportProvider>(context).displayList[index].airportName}(${Provider.of<DestinationAirportProvider>(context).displayList[index].cityCode})"),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
