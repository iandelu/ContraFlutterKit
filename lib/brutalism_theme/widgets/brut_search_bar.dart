import 'package:flutter/material.dart';
import 'package:contraflutterkit/brutalism_theme/assets/brut_shadows.dart';
import 'package:contraflutterkit/brutalism_theme/assets/dimensions.dart';
import 'package:contraflutterkit/brutalism_theme/widgets/brut_buttons.dart';

import '../assets/brut_colors.dart';

class BrutSearchBarSmart extends StatelessWidget {

  const BrutSearchBarSmart();

  @override
  Widget build(BuildContext context) {
      return Container(
          margin: EdgeInsets.only(top: BrutDimensions.height30,left: BrutDimensions.width20,right: BrutDimensions.width20),
          decoration: BoxDecoration(
            border: brutBorderNormal,
              boxShadow: const [shadowMediumBrut]
          ),
          child: TextField(
            onTap: () => {}/*showSearch(
                context: context,
                delegate: SearchRecipeDelegate()
            )*/,
            decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.background,
                contentPadding: const EdgeInsets.all(20),
                hintText: 'Search something',
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 15
                ),
                suffixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: BrutIconButton(
                      iconData: Icons.filter_alt,
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

