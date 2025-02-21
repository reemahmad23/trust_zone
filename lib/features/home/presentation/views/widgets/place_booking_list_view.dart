import 'package:flutter/material.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/places_view_body.dart';

class PlaceBookingListView extends StatelessWidget {
  const PlaceBookingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: const PlaceBookingItem(),
          );
      },

    );
  }
}