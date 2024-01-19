import 'package:flutter/material.dart';
import 'package:contraflutterkit/brutalism_theme/assets/brut_shadows.dart';
import 'package:contraflutterkit/brutalism_theme/assets/dimensions.dart';
import 'package:contraflutterkit/brutalism_theme/widgets/brut_buttons.dart';


class SearchBarSmart extends StatelessWidget {

  final String hintText;
  final Function search;

  const SearchBarSmart({ required this.hintText, required this.search});

  @override
  Widget build(BuildContext context) {


      return Container(
          margin: EdgeInsets.only(top: BrutDimensions.height30,left: BrutDimensions.width20,right: BrutDimensions.width20),
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.shadow,
                width: 2
            ),
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(BrutDimensions.brutBorderRadious),
            boxShadow: const [shadowMediumBrut]
          ),
          child: TextField(
            onTap: () => search(),
            decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.background,
                contentPadding: const EdgeInsets.all(20),
                hintText: hintText,
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 15
                ),
                suffixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: BrutIconButton(
                      iconData: Icons.search_rounded,
                      boxShadow: shadowSmallBrut,
                      rounded: false,
                      buttonColor: Theme.of(context).colorScheme.secondary,
                    )
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(BrutDimensions.brutBorderRadious),
                    borderSide: BorderSide.none
                )
            ),
          ),
      );
    
  }
}

