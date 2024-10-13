import 'package:flutter/material.dart';
import 'package:redicalstart_tasks/views/custom_image_picker.dart';
import 'package:redicalstart_tasks/views/getx_calculator.dart';
import 'package:redicalstart_tasks/views/house_rental_screen.dart';
import 'package:redicalstart_tasks/views/provider_calculator.dart';
import 'package:redicalstart_tasks/widgets/custom_button.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All in one'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Here you can find the Tasks that you are assigned. Please click the buttons to navigate to the next page..',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              btnName: 'Provider Calculator',
              imgName: 'calculator',
              nextPage: ProviderCalculator(),
            ),
            CustomButton(
              btnName: 'Getx Calculator',
              imgName: 'getxCalculator',
              nextPage: GetxCalculator(),
            ),
            CustomButton(
              btnName: 'House Rental',
              imgName: 'calculator',
              nextPage: HouseRentalScreen(),
            ),
            CustomButton(
              btnName: 'Image Picker',
              imgName: 'calculator',
              nextPage: CustomImagePicker(),
            ),
          ],
        ),
      ),
    );
  }
}
