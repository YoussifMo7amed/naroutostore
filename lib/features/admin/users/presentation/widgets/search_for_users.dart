import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/widgets/custom_text_field.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';

class SearchForUsers extends StatelessWidget {
  const SearchForUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: TextEditingController(),
      hintText: 'Search For Users',
      onChanged: (value) {

      },
      suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.clear,
            color: ColorsDark.blueDark,
          ),),
    );
  }
}
