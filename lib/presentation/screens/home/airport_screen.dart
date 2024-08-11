import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/config/theme/app_theme.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/model/airport_model.dart';
import 'package:qfly/data/services/home_services.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/box_text_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_input_view.dart';

class AirportScreen extends StatefulWidget {
  AirportScreen({
    super.key,
    required this.isWhereFrom,
    required this.homeCubit,
    required this.title,
    required this.subtitle,
  });
  bool isWhereFrom;
  HomeCubit homeCubit;
  String title;
  String subtitle;

  @override
  State<AirportScreen> createState() => _AirportScreenState();
}

class _AirportScreenState extends State<AirportScreen> {
  late List<Airport> _airports = [];
  late List<Airport> popularAirports = [];
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  final TextEditingController _controllerTo = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    popularAirports = widget.homeCubit.popularAirports;
    //updateList('u');
  }

  Future<List<Airport>> updateList(String value) async {
    _airports = await widget.homeCubit.getAirportsData(value.toLowerCase());

    return _airports;
  }

  String searchValue = 'dx';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: widget.homeCubit,
      listener: (context, state) {
        //widget.homeCubit.getAirportsData('us');
      },
      builder: (builder, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.title,
                      style: TextStylesManager.mediumStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInputView(
                    focusNode: _focusNode,
                    hint: widget.homeCubit.airportFrom.name.isEmpty
                        ? widget.subtitle
                        : widget.isWhereFrom
                            ? widget.homeCubit.airportFrom.name
                            : widget.homeCubit.airportTo.name,
                    controller: _controller,
                    iconPath: ImageAssets.myTripsIcon,
                    /* onChanged: (value) {
                      widget.homeCubit.getAirportsData(
                        value.toString().trim(),
                      );
                      searchValue = value!;
                    }, */
                    iconPressedPath: 'assets/icons/flight_from_selected_ic.svg',
                    onEditingComplete: () {
                      _focusNode.unfocus();
                      widget.homeCubit.getAirportsData(
                        _controller.text.toString().trim(),
                      );
                    },
                  ),
                ],
              ),
            ),
            widget.homeCubit.isSearchDataLoading
                ? const Center(child: CircularProgressIndicator())
                : _controller.text.isEmpty && _controllerTo.text.isEmpty
                    ? SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: widget.homeCubit.popularAirports.length,
                          itemBuilder: (context, index) {
                            final airport =
                                widget.homeCubit.popularAirports[index];
                            return GestureDetector(
                              onTap: () {
                                widget.homeCubit.selectingAirport(
                                  airport,
                                  widget.isWhereFrom,
                                );
                                _controller.clear();
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                title: Text(
                                  airport.name
                                      .substring(airport.name.indexOf('-'))
                                      .replaceFirst('-', '')
                                      .trim(),
                                ),
                                subtitle: Text(airport.country),
                                trailing: BoxTextView(text: airport.code),
                              ),
                            );
                          },
                        ),
                      )
                    : SizedBox(
                        height: 300,
                        child: widget.homeCubit.airport.isEmpty
                            ? Center(child: Text("No Data Found"))
                            : ListView.builder(
                                itemCount: widget.homeCubit.airport.length,
                                itemBuilder: (context, index) {
                                  final airport =
                                      widget.homeCubit.airport[index];
                                  return GestureDetector(
                                    onTap: () {
                                      widget.homeCubit.selectingAirport(
                                        airport,
                                        widget.isWhereFrom,
                                      );
                                      _controller.clear();
                                      Navigator.pop(context);
                                    },
                                    child: ListTile(
                                      title: Text(
                                        airport.name
                                            .substring(
                                                airport.name.indexOf('-'))
                                            .replaceFirst('-', '')
                                            .trim(),
                                      ),
                                      subtitle: Text(airport.country),
                                      trailing: BoxTextView(text: airport.code),
                                    ),
                                  );
                                },
                              ),
                      ),
            SizedBox(
              height: 10,
            ),
            RoundedBtn(
              title: 'Done',
              onTap: () => Navigator.pop(context),
            ).build(context),
          ],
        );
      },
    );
  }
}
