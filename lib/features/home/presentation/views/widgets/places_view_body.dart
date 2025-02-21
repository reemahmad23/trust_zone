
import 'package:flutter/material.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/service_rating.dart';
import 'package:trust_zone/utils/app_images.dart';
import 'package:trust_zone/utils/app_styles.dart';

class PlacesViewBody extends StatelessWidget {
  const PlacesViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return PlaceBookingItem();
      
    
  }
}
      

class PlaceBookingItem extends StatelessWidget {
  const PlaceBookingItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container( 
        height: 90,// Adds spacing inside the container
        decoration: BoxDecoration(
          color: Color(0xFFDEDDE0),
           // Background color
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(Assets.imagesRestaurant),// Placeholder image color
              ),
            ),
        
            SizedBox(
              width: 30,
            ),
        
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(children: [
                SizedBox(width: MediaQuery.of(context).size.width * .5,
                child: const Text('Restaurant Name',
                style: AppStyles.styleRegular16,
                ),
                
                ),
                SizedBox(width: MediaQuery.of(context).size.width * .5,
                child: const Text('partially accessible',
                style: AppStyles.styleRegular13,
                ),
                
                ),
              ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ServiceRating(),
            ),
          ],
        ),
      ),
    );
  }
}
