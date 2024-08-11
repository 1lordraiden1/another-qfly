import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/hotels/components/filter_item_result.dart';
class FilterResultsView extends StatelessWidget {
  const FilterResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: List.generate(5, (index) =>FilterItemResult()

        )),
    );
  }
}
