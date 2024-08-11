import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/terms/components/terms_item_view.dart';
class TermsDataView extends StatelessWidget {
  const TermsDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context,int index){
return TermsItemView(index: index+1);
    });
  }
}
