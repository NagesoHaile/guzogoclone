import 'package:flutter/material.dart';
import 'package:guzogoclone/constants/colors.dart';

class CustomTabView extends StatefulWidget {
  final Function changeTab;
  final int index;
  const CustomTabView(
      {super.key, required this.changeTab, required this.index});

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = [
    "Return",
    "One-Way",
  ];

  @override
  Widget build(BuildContext context) {
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
        child: Row(
            children: _tags
                .asMap()
                .entries
                .map((MapEntry map) => _buildTags(map.key))
                .toList()),
      ),
    );
  }

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .4,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .08,
              vertical: 15),
          decoration: BoxDecoration(
            color: widget.index == index ? AppColors.white : null,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              _tags[index],
              style: TextStyle(
                  color: widget.index == index
                      ? AppColors.primaryColor
                      : AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
