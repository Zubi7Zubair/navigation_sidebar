import 'package:flutter/material.dart';

import '../navigation_sidebar.dart';
import 'navigation_sidebar_provider.dart';

class NavSideBarItem {
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final String text;
  final BorderRadiusGeometry? selectedItemBorderRadius;
  final BorderRadiusGeometry? unSelectedItemBorderRadius;

  NavSideBarItem({
    required this.text,
    required this.selectedIcon,
    required this.unSelectedIcon,
    this.selectedItemBorderRadius,
    this.unSelectedItemBorderRadius,
  });
}

class NavigationSideBar extends StatefulWidget {
  final List<NavSideBarItem>
      items; // List of items to be displayed in the sidebar

  final int initialSelectedIndex; // Initial selected index

  final ValueChanged<int> onItemSelected; // Callback to handle page changes

  final bool isExtended; // Whether the sidebar is extended or not

  final NavSideBarTheme theme; // Theme for the sidebar

  final EdgeInsetsGeometry? sideBarPadding; // Padding for the sidebar

  final BorderRadiusGeometry?
      extendedBorderRadius; // Border radius for the extended sidebar

  final BorderRadiusGeometry?
      collapsedBorderRadius; // Border radius for the collapsed sidebar

  final double? height; // Height of the sidebar

  final EdgeInsetsGeometry? insideSideBarPadding; // Padding inside the sidebar

  final Duration? animationDuration; // Duration for the animation

  final double? extendedWidth; // Width of the extended sidebar

  final double? collapsedWidth; // Width of the collapsed sidebar

  final Widget?
      bottomWidget; // Widget to be displayed at the bottom of the sidebar

  final Widget?
      bottomWidget2; // Widget to be displayed at the bottom of the sidebar

  final Widget? topWidget; // Widget to be displayed at the top of the sidebar

  final Widget? topWidget2; // Widget to be displayed at the top of the sidebar

  final bool? isItemsCenter; // Whether the items are centered or not

  final bool isIndicatorActive; // Whether the indicator is active or not

  final bool? showExtendedButton; // Whether to show the extended button or not

  const NavigationSideBar({
    super.key,
    required this.items, // List of items to be displayed in the sidebar
    required this.initialSelectedIndex, // Initial selected index
    required this.onItemSelected, // Callback to handle page changes
    required this.isExtended, // Whether the sidebar is extended or not
    this.sideBarPadding, // Padding for the sidebar
    this.height, // Height of the sidebar
    this.extendedBorderRadius, // Border radius for the extended sidebar
    this.collapsedBorderRadius, // Border radius for the collapsed sidebar
    this.insideSideBarPadding, // Padding inside the sidebar
    this.animationDuration, // Duration for the animation
    required this.theme, // Theme for the sidebar
    this.extendedWidth = 200, // Width of the extended sidebar
    this.collapsedWidth = 80, // Width of the collapsed sidebar
    this.bottomWidget, // Widget to be displayed at the bottom of the sidebar
    this.topWidget, // Widget to be displayed at the top of the sidebar
    this.isItemsCenter, // Whether the items are centered or not
    required this.isIndicatorActive, // Whether the indicator is active or not
    this.showExtendedButton = true,
    this.bottomWidget2,
    this.topWidget2, // Whether to show the extended button or not
  });

  @override
  State<NavigationSideBar> createState() => _NavigationSideBarState();
}

class _NavigationSideBarState extends State<NavigationSideBar> {
  int _selectedIndex = 0; // Index of the selected item

  final _provider = NavSidebarProvider();

  @override
  void initState() {
    super.initState();
    _selectedIndex =
        widget.initialSelectedIndex; // Set the initial selected index

    _provider.isExtended = widget.isExtended;
  }

  void toggleIsExtended() {
    setState(() {
      _provider.isExtended = !_provider.isExtended;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.sideBarPadding ??
          const EdgeInsets.all(0.0), // Set the padding for the sidebar
      child: Material(
        borderRadius: _provider.isExtended // Set the border radius
            ? widget.extendedBorderRadius
            : widget.collapsedBorderRadius,
        shadowColor:
            widget.theme.shadowColor ?? Colors.black, // Customize shadow color
        elevation: widget.theme.elevation ?? 10, // Customize elevation
        child: AnimatedContainer(
          height: widget.height, // Set the height of the sidebar
          padding: widget.insideSideBarPadding ??
              const EdgeInsets.all(8.0), // Set the padding inside the sidebar
          decoration: BoxDecoration(
            borderRadius: _provider.isExtended // Set the border radius
                ? widget.extendedBorderRadius
                : widget.collapsedBorderRadius,
            color: widget.theme.backgroundColor ??
                Colors.white, // Customize background color
          ),
          duration: widget.animationDuration ??
              const Duration(
                  milliseconds: 300), // Set the duration for the animation
          width: _provider.isExtended // Set the width of the sidebar
              ? widget.extendedWidth
              : widget.collapsedWidth,

          child: Column(
            children: [
              widget.topWidget ?? Container(), // Display the top widget
              widget.topWidget2 ?? Container(), // Display the top widget
              widget.isItemsCenter == true
                  ? const Spacer()
                  : Container(), // Center the items
              Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the items
                children: widget.items.asMap().entries.map((entry) {
                  int index = entry.key; // Get the index of the item
                  NavSideBarItem item = entry.value; // Get the item
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index; // Set the selected index
                        // Call the callback function to handle page changes
                        widget.onItemSelected(index);
                      });
                    },
                    child: Container(
                      margin: widget.theme.itemMargin ??
                          const EdgeInsets.only(bottom: 4.0, top: 4),
                      padding: widget.theme.itemPadding ??
                          EdgeInsets.all(
                              widget.isIndicatorActive == false ? 8.0 : 0),
                      width: _provider.isExtended
                          ? double.infinity
                          : double.infinity,
                      height: _provider.isExtended ? 60.0 : 60.0,
                      decoration: BoxDecoration(
                          borderRadius: _selectedIndex == index
                              ? item.selectedItemBorderRadius ??
                                  widget.theme.selectedItemBorderRadius
                              : item.unSelectedItemBorderRadius ??
                                  widget.theme.unSelectedItemBorderRadius,
                          color: _selectedIndex == index
                              ? widget.theme.selectedItemBackgroundColor ??
                                  const Color.fromRGBO(224, 224, 224,
                                      1) // Customize selected background color
                              : widget.theme.unSelectedItemBackgroundColor ??
                                  Colors.grey[
                                      200] // Customize unselected background color
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // Align the items to the start
                        children: [
                          widget.isIndicatorActive
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: _selectedIndex == index
                                          ? widget.theme
                                                  .indicatorSelectedColor ??
                                              Colors
                                                  .blue // Customize indicator color
                                          : widget.theme
                                                  .indicatorUnSelectedColor ??
                                              Colors.transparent,
                                      borderRadius: BorderRadius.circular(
                                          widget.theme.indicatorBorderRadius ??
                                              50)),
                                  width: widget.theme.indicatorWidth ??
                                      4, // Adjust the width of the indicator
                                  height: widget.theme.indicatorHeight ?? 40,
                                )
                              : Container(),
                          widget.isIndicatorActive
                              ? SizedBox(
                                  width: _provider.isExtended
                                      ? widget.theme.extendedIndicatorGap ?? 6
                                      : widget.theme.collapsedIndicatorGap ?? 0)
                              : Container(),
                          Expanded(
                            child: _provider.isExtended
                                ? Row(
                                    mainAxisAlignment: widget
                                            .theme.extendedMainAxisAlignment ??
                                        MainAxisAlignment.start,
                                    crossAxisAlignment: widget
                                            .theme.extendedCrossAxisAlignment ??
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Icon(
                                            _selectedIndex == index
                                                ? item.selectedIcon
                                                : item.unSelectedIcon,
                                            color: _selectedIndex == index
                                                ? widget.theme
                                                        .selectedIconColor ??
                                                    Colors
                                                        .blue // Customize selected color
                                                : widget.theme
                                                        .unSelectedIconColor ??
                                                    Colors.grey[
                                                        600], // Customize unselected color
                                            size: _selectedIndex == index
                                                ? widget.theme.selectedIconSize
                                                : widget
                                                    .theme.unSelectedIconSize),
                                      ),
                                      SizedBox(
                                          width: widget.theme
                                                  .extendedItemInsideWidth ??
                                              8.0),
                                      Flexible(
                                        child: Text(
                                          maxLines: widget.theme.textMaxLines,
                                          item.text,
                                          style: _selectedIndex == index
                                              ? widget.theme.selectedTextStyle
                                              : widget
                                                  .theme.unSelectedTextStyle,
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: widget
                                            .theme.collapsedMainAxisAlignment ??
                                        MainAxisAlignment.center,
                                    crossAxisAlignment: widget.theme
                                            .collapsedCrossAxisAlignment ??
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Icon(
                                            _selectedIndex == index
                                                ? item.selectedIcon
                                                : item.unSelectedIcon,
                                            color: _selectedIndex == index
                                                ? widget.theme
                                                        .selectedIconColor ??
                                                    Colors
                                                        .blue // Customize selected color
                                                : widget.theme
                                                        .unSelectedIconColor ??
                                                    Colors.grey[
                                                        600], // Customize unselected color
                                            size: _selectedIndex == index
                                                ? widget.theme.selectedIconSize
                                                : widget
                                                    .theme.unSelectedIconSize),
                                      ),
                                      SizedBox(
                                          height: widget.theme
                                                  .collapsedItemInsideHeight ??
                                              4.0),
                                      Flexible(
                                        child: Text(
                                          maxLines: widget.theme.textMaxLines,
                                          item.text,
                                          style: _selectedIndex == index
                                              ? widget.theme.selectedTextStyle
                                              : widget
                                                  .theme.unSelectedTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Spacer(),
              widget.showExtendedButton == true
                  ? FloatingActionButton(
                      onPressed: () {
                        toggleIsExtended();
                      },
                      child: Icon(
                        _provider.isExtended
                            ? Icons.arrow_back_ios_rounded
                            : Icons.arrow_forward_ios,
                      ),
                    )
                  : Container(),
              widget.bottomWidget2 ?? Container(),
              widget.bottomWidget ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
