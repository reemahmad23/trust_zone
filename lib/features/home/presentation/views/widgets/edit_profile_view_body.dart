import 'package:flutter/material.dart';
import 'package:trust_zone/utils/app_images.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Stack(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(Assets.imagesProfile1), // Ensure the image exists
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt, size: 15),
                    onPressed: () {
                      
                    },
                  ),
                ),
              ),
            ],
          ),
          //const SizedBox(height: 10),

          
          const ProfileTextField(label: "Username"),
          const ProfileTextField(label: "Email"),
          const ProfileTextField(label: "Password", obscureText: true),

          
          const ProfileDropdownField(label: "Date of Birth"),

          
          const ProfileDropdownField(label: "Disability Type"),

          const SizedBox(height: 5),

          
          SizedBox(
            width: 220,
            child: ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBEE9E8),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Save changes",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ProfileTextField extends StatelessWidget {
  final String label;
  final bool obscureText;

  const ProfileTextField({
    required this.label,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}


class ProfileDropdownField extends StatelessWidget {
  final String label;

  const ProfileDropdownField({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            items: const [
              DropdownMenuItem(value: "Option 1", child: Text("Option 1")),
              DropdownMenuItem(value: "Option 2", child: Text("Option 2")),
            ],
            onChanged: (value) {},
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
