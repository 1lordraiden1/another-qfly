import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/data/Shared/countries.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/data/model/passenger_model.dart';

import 'package:qfly/presentation/screens/payment/payment_screen.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_input_view.dart';
import 'package:qfly/utils/validation.dart';

import '../../../../constant/colors.dart';

class TravellerDetailsView extends StatelessWidget {
  const TravellerDetailsView({
    super.key,
    required this.homeCubit,
    required this.flight,
  });

  final HomeCubit homeCubit;
  final Flight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Provide Traveler details',
          style: TextStylesManager.mediumStyle(fontSize: 18.sp),
        ),
        10.verticalSpace,
        ListView.builder(
          padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: homeCubit.adults,
          itemBuilder: (context, index) {
            return PassengerForm(
              passenger: homeCubit.passengers[index],
              homeCubit: homeCubit,
              travelerNumber: index + 1,
              type: "Adult",
            );
          },
        ),
        homeCubit.children > 0
            ? ListView.builder(
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: homeCubit.children,
                itemBuilder: (context, index) {
                  return PassengerForm(
                    passenger: homeCubit.passengers[index + homeCubit.adults],
                    homeCubit: homeCubit,
                    travelerNumber: index + homeCubit.adults + 1,
                    type: "Child",
                  );
                },
              )
            : const SizedBox(),
        homeCubit.infant > 0
            ? ListView.builder(
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: homeCubit.infant,
                itemBuilder: (context, index) {
                  return PassengerForm(
                    passenger: homeCubit.passengers[
                        index + homeCubit.adults + homeCubit.children],
                    homeCubit: homeCubit,
                    travelerNumber:
                        index + homeCubit.adults + homeCubit.children + 1,
                    type: "Infant",
                  );
                },
              )
            : const SizedBox(),
        /*   Text(
                '*Note : Please ensure the name you enter is matching to your National ID / Passport ',
                style:
                    TextStylesManager.regularStyle(fontSize: 10.sp, color: red),
              ), */
        Text(
          '*Note : Please ensure the accurate contact details of the passenger (as in ID Proof), so that the Airline can update the passenger about any changes and request to verify the Visa and airline transit information before proceeding with the booking to avoid any inconvenience/ADM from the respective carrier. Please note that several countries have imposed entry restrictions because of the novel coronavirus(COVID-19) outbreak, kindly verify the checklist on the airlines official website. ',
          style: TextStylesManager.regularStyle(fontSize: 10.sp, color: red),
        ),
        20.verticalSpace,
      ],
    );
  }
}

class PassengerForm extends StatefulWidget {
  const PassengerForm({
    super.key,
    required this.homeCubit,
    required this.travelerNumber,
    required this.type,
    this.showDate,
    required this.passenger,
  });

  final HomeCubit homeCubit;
  final Passenger passenger;
  final int travelerNumber;
  final String type;
  final DateTime? Function(String?)? showDate;

  @override
  State<PassengerForm> createState() => _PassengerFormState();
}

class _PassengerFormState extends State<PassengerForm> {
  @override
  Widget build(BuildContext context) {
    final ExpansionTileController expansionTileController =
        ExpansionTileController();

    final _formKey = GlobalKey<FormBuilderState>();
    final _firstController = TextEditingController();
    final _lastController = TextEditingController();
    final _emailController = TextEditingController();
    final _phoneController = TextEditingController();
    final _addressController = TextEditingController();
    final _nationalityController = TextEditingController();

    return ExpansionTile(
      controller: expansionTileController,
      /* onExpansionChanged: (bool expanded) {
        setState(() {
          expanded
              ? expansionTileController.collapse()
              : expansionTileController.expand();
        });
      }, */
      maintainState: true,
      title: Text(
        'Traveler ${widget.travelerNumber} (${widget.type})',
        style: TextStylesManager.regularStyle(fontSize: 14.sp),
      ),
      children: [
        FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Traveler ${widget.travelerNumber} (${widget.type})',
                style: TextStylesManager.regularStyle(fontSize: 14.sp),
              ),
              8.verticalSpace,
              OutlinedInputFieldWidget(
                controller: _firstController,
                homeCubit: widget.homeCubit,
                label: 'First Name',
                validation: (value) {
                  return Validation().emptyField(value, 'First Name');
                },
                onSaved: (value) {
                  widget.passenger.firstName = value;
                },
              ),
              10.verticalSpace,
              OutlinedInputFieldWidget(
                controller: _lastController,
                homeCubit: widget.homeCubit,
                label: 'Last Name',
                validation: (value) {
                  return Validation().emptyField(value, 'Last Name');
                },
                onSaved: (value) {
                  widget.passenger.lastName = value;
                },
              ),
              10.verticalSpace,
              OutlinedInputFieldWidget(
                controller: _phoneController,
                homeCubit: widget.homeCubit,
                label: 'Phone Number',
                validation: (value) {
                  return Validation().mobileValidator(value);
                },
                onSaved: (value) {
                  widget.passenger.mobile1 = value;
                  _phoneController.text = value!;
                },
              ),
              10.verticalSpace,
              FormBuilderDateTimePicker(
                enableInteractiveSelection: false,
                name: 'Birth Date',
                decoration: InputDecoration(
                  label: Text('Birth Date'),
                  labelStyle: TextStylesManager.lightStyle(),
                  border: const OutlineInputBorder(),
                  icon: Icon(Icons.date_range_outlined),
                ),
                onSaved: (newValue) {
                  widget.passenger.dateOfBirth = newValue;
                },
              ),

              /*     OutlinedInputFieldWidget(
                homeCubit: homeCubit,
                label: 'Date of birth',
                isDate: true,

                //showDate: showDate,
              ), */
              10.verticalSpace,
              OutlinedInputFieldWidget(
                controller: _nationalityController,
                homeCubit: widget.homeCubit,
                label: 'Nationality',
                validation: (value) {
                  return Validation().emptyField(value, 'Country Exist ');
                },
                onSaved: (value) {
                  /*                     passenger.country!.countryCode = CountriesData.countries
                      .firstWhere(
                          (element) => element.name.contains(value!))
                      .code;
                  passenger.country!.countryName = CountriesData.countries
                      .firstWhere(
                          (element) => element.name.contains(value!))
                      .name;
    
                  passenger.city!.countryCode = CountriesData.countries
                      .firstWhere(
                          (element) => element.name.contains(value!))
                      .code;
    
                  passenger.nationality!.countryCode = CountriesData
                      .countries
                      .firstWhere(
                          (element) => element.name.contains(value!))
                      .code;
                  passenger.nationality!.countryName = CountriesData
                      .countries
                      .firstWhere(
                          (element) => element.name.contains(value!))
                      .name; */

                  print(widget.passenger.toJson());
                },
              ),
              10.verticalSpace,
              OutlinedInputFieldWidget(
                controller: _addressController,
                homeCubit: widget.homeCubit,
                label: 'Address',
                validation: (value) {
                  return Validation().emptyField(value, 'Address');
                },
                onSaved: (value) {
                  widget.passenger.addressLine1 = value;
                },
              ),
              10.verticalSpace,
              OutlinedInputFieldWidget(
                controller: _emailController,
                homeCubit: widget.homeCubit,
                label: 'Email',
                validation: (value) {
                  return Validation().emailValidator(value);
                },
                onSaved: (value) {
                  widget.passenger.email = value;
                },
              ),
              10.verticalSpace,
              FormBuilderRadioGroup(
                name: 'Gender',
                separator: SizedBox(width: 30),
                options: [
                  const FormBuilderFieldOption(
                    value: 1,
                    child: Text('Male'),
                  ),
                  const FormBuilderFieldOption(
                    value: 2,
                    child: Text('Female'),
                  ),
                ],
                onSaved: (newValue) {
                  widget.passenger.gender = newValue;
                  widget.passenger.title = newValue == 2 ? 'Mrs' : 'Mr';
                },
              ),
              10.verticalSpace,
              TextButton(
                child: const Text("Confirm"),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(primaryColor),
                  foregroundColor: const WidgetStatePropertyAll(white),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    expansionTileController.collapse();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OutlinedInputFieldWidget extends StatelessWidget {
  const OutlinedInputFieldWidget({
    super.key,
    required this.homeCubit,
    required this.label,
    this.validation,
    this.isDate = false,
    this.onSaved,
    this.showDate,
    this.controller,
  });
  final HomeCubit homeCubit;
  final String label;
  final String? Function(String?)? validation;
  final bool? isDate;
  final void Function(String?)? onSaved;
  final DateTime? Function(String?)? showDate;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return isDate!
        ? BlocBuilder<HomeCubit, HomeState>(
            bloc: homeCubit,
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1930),
                    lastDate: DateTime.now(),
                  ).then(
                    (value) {
                      homeCubit.handleFlightBirthDateChanging(value!);
                    },
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homeCubit.flightBirthDate
                                  .toString()
                                  .substring(0, 10),
                            ),
                            Icon(
                              Icons.date_range_outlined,
                              color: primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : TextFormField(
            enabled: !isDate!,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStylesManager.lightStyle(),
              border: const OutlineInputBorder(),
            ),
            validator: validation,
            onSaved: onSaved,
            controller: controller,
          );
  }
}
