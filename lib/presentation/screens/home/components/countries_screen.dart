import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/Shared/countries.dart';
import 'package:qfly/data/model/passenger_model.dart';

import 'package:qfly/presentation/widgets/text_field_shapes/text_field_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_input_view.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({
    super.key,
    required this.isWhereFrom,
    required this.homeCubit,
    this.isCities = false,
  });

  final bool isWhereFrom;
  final HomeCubit homeCubit;
  final bool? isCities;

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  late List<dynamic> searchCountries = [];

  final TextEditingController _controller = TextEditingController();

  void updateList(String value) {
    setState(
      () {
        searchCountries = widget.isCities!
            ? widget.homeCubit.cities
                .where(
                  (element) => element.countryName!.toLowerCase().contains(
                        value.toLowerCase(),
                      ),
                )
                .toList()
            : widget.homeCubit.countries
                .where(
                  (element) => element.countryName!.toLowerCase().contains(
                        value.toLowerCase(),
                      ),
                )
                .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> data =
        widget.isCities! ? widget.homeCubit.cities : widget.homeCubit.countries;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: BlocConsumer<HomeCubit, HomeState>(
          bloc: widget.homeCubit,
          listener: (context, state) {},
          builder: (builder, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.isCities! ? 'Choose City ' : 'Choose country ',
                    style: TextStylesManager.mediumStyle(fontSize: 20),
                  ),
                ),
                //TextInputView(),
                const SizedBox(
                  height: 10,
                ),
                // Search Bar
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _controller,
                  onChanged: (value) => updateList(value),
                ),
                // Countries

                searchCountries.isNotEmpty || _controller.text.isNotEmpty
                    ? _controller.text.isNotEmpty && searchCountries.isEmpty
                        ? const SizedBox(
                            height: 300,
                            child: Center(
                              child: Text("Nothing found"),
                            ),
                          )
                        : SizedBox(
                            height: 300,
                            child: Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        widget.isCities!
                                            ? widget.homeCubit
                                                .handleHotelCitySelection(
                                                searchCountries[index],
                                              )
                                            : widget.homeCubit
                                                .handleHotelSelection(
                                                searchCountries[index],
                                              );
                                        Navigator.pop(context);
                                      },
                                      child: ListTile(
                                        title: Text(
                                          searchCountries[index]
                                              .countryName
                                              .toString(),
                                        ),
                                        trailing: Text(
                                          searchCountries[index]
                                              .countryCode
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: searchCountries.length,
                              ),
                            ),
                          )
                    : SizedBox(
                        height: 300,
                        child: Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Center(
                                child: GestureDetector(
                                  onTap: () {
                                    widget.isCities!
                                        ? widget.homeCubit
                                            .handleHotelCitySelection(
                                            searchCountries.isEmpty
                                                ? data[index]
                                                : searchCountries[index],
                                          )
                                        : widget.homeCubit.handleHotelSelection(
                                            searchCountries.isEmpty
                                                ? data[index]
                                                : searchCountries[index],
                                          );
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    title: Text(
                                      data[index].countryName.toString(),
                                    ),
                                    trailing: Text(
                                      data[index].countryCode.toString(),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: data.length,
                          ),
                        ),
                      )
              ],
            );
          },
        ));
  }
}
