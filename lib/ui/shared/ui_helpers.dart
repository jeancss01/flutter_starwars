import 'package:flutter/material.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceExtraSmall = 0.05;
  static const double _VerticalSpaceSmall = 0.1;
  static const double _VerticalSpaceMedium = 0.2;
  static const double _VerticalSpaceLarge = 0.3;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 20.0;
  static const double HorizontalSpaceLarge = 60.0;

 static Widget verticalSpaceExtraSmall(double height) {
    return verticalSpace(height * _VerticalSpaceExtraSmall);
  }

  static Widget verticalSpaceSmall(double height) {
    return verticalSpace(height *_VerticalSpaceSmall);
  }

  static Widget verticalSpaceMedium(double height) {
    return verticalSpace(height *_VerticalSpaceMedium);
  }

  static Widget verticalSpaceLarge(double height) {
    return verticalSpace(height *_VerticalSpaceLarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_HorizontalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_HorizontalSpaceMedium);
  }

  /// Returns a vertical space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(HorizontalSpaceLarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }
}
