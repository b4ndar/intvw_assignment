import 'package:flutter/widgets.dart';

/// todo create mediaQuery class helper
class ResponsiveHelper {
  final BuildContext context;

  ResponsiveHelper(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  // Define breakpoints for different screen sizes
  double get smallScreenBreakpoint => 600.0; // Example breakpoint
  double get mediumScreenBreakpoint => 900.0; // Example breakpoint

  bool get isSmallScreen => screenWidth < smallScreenBreakpoint;
  bool get isMediumScreen =>
      screenWidth >= smallScreenBreakpoint && screenWidth < mediumScreenBreakpoint;
  bool get isLargeScreen => screenWidth >= mediumScreenBreakpoint;

}
