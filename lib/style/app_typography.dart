import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  static const fontFamily = 'Inter';

  /// Header
  static final exampleStyle1 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    height: 1.35,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static final exampleStyle2 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    height: 1.35,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static final exampleStyle3 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    height: 1.4,
    leadingDistribution: TextLeadingDistribution.even,
  );
}
