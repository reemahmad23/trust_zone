
import 'package:flutter/material.dart';

class ServiceRating extends StatelessWidget {
  const ServiceRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('4.7'),
        Icon(Icons.star, color: Color(0xFFFFBC3F),),
        
      ],
    );
  }
}      