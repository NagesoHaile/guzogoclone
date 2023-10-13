import 'package:flutter/material.dart';
import 'package:guzogoclone/presentation/ui/widgets/components/bottom_content.dart';
import 'package:guzogoclone/presentation/ui/widgets/components/top_content.dart';
import 'package:guzogoclone/presentation/ui/widgets/custom_button.dart';



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
      
            return SingleChildScrollView(
              child: Column(
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
              ),
            );
          },
        ),
      ),
    );
  }
}


