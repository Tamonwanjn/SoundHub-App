import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
          color: Color.fromARGB(255, 234, 255, 247), fontSize: 14),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 33, 33, 33),
        hintText: 'Search',
        hintStyle:
            TextStyle(color: ColorConstants.inputHintColor, fontSize: 14),
        prefixIcon: Icon(Icons.search,
            color: !FocusScope.of(context).isFirstFocus
                ? const Color.fromARGB(255, 73, 190, 183)
                : Color.fromARGB(255, 73, 190, 183)),
        suffixIcon: IconButton(
          icon: Icon(Icons.mic,
              color: const Color.fromARGB(255, 73, 190, 183), size: 20),
          onPressed: () {
            // TODO: Implement microphone action here
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color.fromARGB(255, 73, 190, 183)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
