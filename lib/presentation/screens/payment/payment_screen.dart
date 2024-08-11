import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/presentation/screens/payment/components/card_payment_view.dart';
import 'package:qfly/presentation/screens/payment/components/payment_ways_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_value_view.dart';
import 'package:readmore/readmore.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {super.key, required this.homeCubit, required this.flight});

  final HomeCubit homeCubit;
  final Flight flight;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.homeCubit.ticketData.clear();
    try {
      widget.flight.isLcc!
          ? widget.homeCubit.handleGettingTicketDetails(
              fare: widget.homeCubit.details['fareQuote']['Result'][0]['Fare'],
              fareRules: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['FareRules'][0],
              segment: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['Segments'][0],
              airlineCode: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['ValidatingAirline'],
              companyName: widget.flight.companyName!,
              desAirportCode: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['Destination'],
              isLcc: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['IsLcc'],
              origin: widget.flight.allData!.origin!,
              originAirportCode: widget.homeCubit.details['fareQuote']['Result']
                  [0]['Origin'],
              pointOfSale: widget.flight.allData!.origin!,
              responseTime: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['ResponseTime'],
              resultId: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['ResultId'],
            )
          : widget.homeCubit.handleBookingTicketProcess(
              fare: widget.homeCubit.details['fareQuote']['Result'][0]['Fare'],
              fareRules: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['FareRules'][0],
              segment: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['Segments'][0],
              airlineCode: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['ValidatingAirline'],
              companyName: widget.flight.companyName!,
              desAirportCode: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['Destination'],
              isLcc: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['IsLcc'],
              origin: widget.flight.allData!.origin!,
              originAirportCode: widget.homeCubit.details['fareQuote']['Result']
                  [0]['Origin'],
              pointOfSale: widget.flight.allData!.origin!,
              responseTime: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['ResponseTime'],
              resultId: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['ResultId'],
              lastTicketDate: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['LastTicketDate'],
              ticketAdvisory: widget.homeCubit.details['fareQuote']['Result'][0]
                  ['TicketAdvisory'],
              userSearchTime:
                  widget.homeCubit.flightDate.toString().substring(0, 10),
            );
    } catch (e) {
      callerWidget = Center(
        child: Text(
          "Sorry There's A server error, Please try to search again or contact tech support",
        ),
      );
    }

    /* widget.homeCubit.handleGettingBookedTicketProcess(
      fare: widget.homeCubit.details['fareQuote']['Result'][0]['Fare'],
      fareRules: widget.homeCubit.details['fareQuote']['Result'][0]['FareRules']
          [0],
      segment: widget.homeCubit.details['fareQuote']['Result'][0]['Segments']
          [0],
      airlineCode: widget.homeCubit.details['fareQuote']['Result'][0]
          ['ValidatingAirline'],
      companyName: widget.flight.companyName!,
      desAirportCode: widget.homeCubit.details['fareQuote']['Result'][0]
          ['Destination'],
      isLcc: widget.homeCubit.details['fareQuote']['Result'][0]['IsLcc'],
      origin: widget.flight.allData!.origin!,
      originAirportCode: widget.homeCubit.details['fareQuote']['Result'][0]
          ['Origin'],
      pointOfSale: widget.flight.allData!.origin!,
      responseTime: widget.homeCubit.details['fareQuote']['Result'][0]
          ['ResponseTime'],
      resultId: widget.homeCubit.details['fareQuote']['Result'][0]['ResultId'],
      lastTicketDate: widget.homeCubit.details['fareQuote']['Result'][0]
          ['LastTicketDate'],
      ticketAdvisory: widget.homeCubit.details['fareQuote']['Result'][0]
          ['TicketAdvisory'],
      userSearchTime: widget.homeCubit.flightDate.toString().substring(0, 10),
      createOn: widget.homeCubit.ticketData['Itinerary']['CreatedOn'],
      pnr: widget.homeCubit.ticketData['Itinerary']['PNR'],
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        listener: (context, state) {
          if (state is GettingAlreadyBookedTicketState &&
              widget.homeCubit.details.isEmpty) {
            callerWidget = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Oops! there's a problem trying to get data, try to search again or contact our tech support",
                  ),
                ),
              ],
            );
          }
          if (state is GettingAlreadyBookedTicketState) {
            callerWidget = Center(
              child: Text(
                  'Oops! your ticket is already booked, go and search again for another one'),
            );
          }
          if (state is GettingTicketDetailsState) {
            callerWidget = showPaymentWidget(widget.homeCubit);
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: state is GettingAlreadyBookedTicketState // temp
                ? null
                : () async {
                    return false;
                  },
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBarView(
                    title: 'Payment',
                    canPop: false,
                  ),
                  widget.homeCubit.isStillBooking
                      ? const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              Text('Checking everything is ok')
                            ],
                          ),
                        )
                      : callerWidget
                ],
              ),
            ),
          );
        });
  }
}

Widget callerWidget = Center(
  child: CircularProgressIndicator(),
);

Widget showPaymentWidget(HomeCubit homeCubit) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ticket Details',
            style: TextStylesManager.semiBoldStyle(),
          ),
          5.verticalSpace,
          TextWithValueView(
            text: 'Ticket Number',
            value: homeCubit.ticketData['PNR'].toString(),
          ),
          5.verticalSpace,
          TextWithValueView(
            text: 'Tracking ID',
            value: ReadMoreText(
              // some work here to trim the read more text
              trimMode: TrimMode.Line,
              colorClickableText: Colors.pink,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',

              trimLines: 1,
              //isExpandable: true,
              homeCubit.ticketData['TrackingId'].toString(),
            ).data,
          ),
          8.verticalSpace,
          PaymentWaysView(),
          20.verticalSpace,
          CardPaymentView(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RoundedBtn(
                title: 'Apply',
                onTap: () {},
              ),
            ),
          ),
          47.verticalSpace
        ],
      ),
    ),
  );
}
