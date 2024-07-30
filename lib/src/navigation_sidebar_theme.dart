import 'package:flutter/material.dart';

class NavSideBarTheme {
  final TextStyle selectedTextStyle; // Customize selected text style

  final double? selectedIconSize; // Customize selected icon size

  final Color?
  selectedItemBackgroundColor; // Customize selected background color

  final TextStyle? unSelectedTextStyle; // Customize unselected text style

  final double? unSelectedIconSize; // Customize unselected icon size

  final Color?
  unSelectedItemBackgroundColor; // Customize unselected background color

  final Color? selectedIconColor; // Customize selected icon color

  final Color? unSelectedIconColor; // Customize unselected icon color

  final double? elevation; // Customize elevation

  final Color? shadowColor; // Customize shadow color

  final Color? backgroundColor; // Customize background color

  final EdgeInsetsGeometry? itemPadding; // Customize item padding

  final double?
  collapsedItemInsideHeight; // Customize collapsed item inside height

  final double? extendedItemInsideWidth; // Customize extended item inside width

  final int? textMaxLines; // Customize text max lines

  final MainAxisAlignment?
  extendedMainAxisAlignment; // Customize extended main axis alignment

  final MainAxisAlignment?
  collapsedMainAxisAlignment; // Customize collapsed main axis alignment

  final CrossAxisAlignment?
  extendedCrossAxisAlignment; // Customize extended cross axis alignment

  final CrossAxisAlignment?
  collapsedCrossAxisAlignment; // Customize collapsed cross axis alignment

  final EdgeInsetsGeometry? itemMargin; // Customize item margin

  final BorderRadiusGeometry?
  selectedItemBorderRadius; // Customize selected item border radius

  final BorderRadiusGeometry?
  unSelectedItemBorderRadius; // Customize unselected item border radius

  final double? extendedIndicatorGap; // Customize extended indicator gap

  final double? collapsedIndicatorGap; // Customize collapsed indicator gap

  final double? indicatorHeight; // Customize indicator height

  final double? indicatorWidth; // Customize indicator width

  final Color? indicatorSelectedColor; // Customize indicator selected color

  final Color? indicatorUnSelectedColor; // Customize indicator unselected color

  final double? indicatorBorderRadius; // Customize indicator border radius

  const NavSideBarTheme({
    this.selectedTextStyle = const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12), // Customize selected text style
    this.selectedIconSize, // Customize selected icon size
    this.selectedItemBackgroundColor, // Customize selected background color
    this.unSelectedTextStyle = const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 12), // Customize unselected text style
    this.unSelectedIconSize, // Customize unselected icon size
    this.unSelectedItemBackgroundColor, // Customize unselected background color

    this.elevation, // Customize elevation
    this.shadowColor, // Customize shadow color
    this.backgroundColor, // Customize background color
    this.itemPadding, // Customize item padding
    this.collapsedItemInsideHeight, // Customize collapsed item inside height
    this.extendedItemInsideWidth, // Customize extended item inside width
    this.textMaxLines = 1, // Customize text max lines
    this.extendedMainAxisAlignment, // Customize extended main axis alignment
    this.collapsedMainAxisAlignment, // Customize collapsed main axis alignment
    this.extendedCrossAxisAlignment, // Customize extended cross axis alignment
    this.collapsedCrossAxisAlignment, // Customize collapsed cross axis alignment
    this.itemMargin, // Customize item margin
    this.selectedIconColor, // Customize selected icon color
    this.unSelectedIconColor, // Customize unselected icon color
    this.selectedItemBorderRadius, // Customize selected item border radius
    this.unSelectedItemBorderRadius, // Customize unselected item border radius
    this.extendedIndicatorGap, // Customize extended indicator gap
    this.collapsedIndicatorGap, // Customize collapsed indicator gap
    this.indicatorHeight, // Customize indicator height
    this.indicatorWidth, // Customize indicator width
    this.indicatorSelectedColor, // Customize indicator selected color
    this.indicatorUnSelectedColor, // Customize indicator unselected color
    this.indicatorBorderRadius, // Customize indicator border radius
  });
}
