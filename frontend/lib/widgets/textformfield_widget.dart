

import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {

  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;

  TextFormFieldWidget ({
    this.title = '', 
    this.keyboardType = TextInputType.none,
    required this.controller
  });


  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
      color: Colors.white, 
      fontSize: 15
    );
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(title, style: textStyle),
          const SizedBox(height: 10),
          TextFormField(  
            keyboardType: keyboardType,
            controller: controller,        
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
            ),
          ),
        ],
      );
  
  }
}