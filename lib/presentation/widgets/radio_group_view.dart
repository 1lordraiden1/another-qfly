import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/app_strings.dart';
import 'package:qfly/constant/text_styles_manager.dart';

class RadioGroupView extends StatelessWidget {
  const RadioGroupView({
    super.key,
    required this.homeCubit,
  });
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: homeCubit,
        listener: (context, state) {},
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Cabin Class',
                  style: TextStylesManager.semiBoldStyle(fontSize: 22.sp),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: homeCubit.classTypes.length,
                  itemBuilder: (context, index) {
                    String selectedClassType =
                        homeCubit.classTypes[homeCubit.selectedClassType];
                    return RadioListTile<String>(
                      value: homeCubit.classTypes[index],
                      groupValue:
                          selectedClassType, // Your selected value (e.g., 'circle', 'square', etc.)
                      onChanged: (value) {
                        // Handle the selection
                        selectedClassType = value!;
                        homeCubit.handleClassTypeSelection(value);
                      },
                      title: Text(homeCubit.classTypes[index]),
                    );
                  },
                ),
              )
            ],
          );
        });
  }
}
