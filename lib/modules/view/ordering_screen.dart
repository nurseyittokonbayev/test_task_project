import 'package:flutter/material.dart';
import 'package:test_project/components/custom_button.dart';
import 'package:test_project/components/custom_textfield.dart';
import 'package:test_project/modules/view/resipient_adress.dart';
import 'package:test_project/modules/view/sender_details.dart';
import 'package:test_project/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:test_project/theme/text_style.dart';

class OrderingScreen extends StatefulWidget {
  const OrderingScreen({super.key});

  @override
  State<OrderingScreen> createState() => _OrderingScreenState();
}

class _OrderingScreenState extends State<OrderingScreen> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text(
          'Ordering',
          style: AppTextStyle.roboto20w600,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Divider(
            color: AppColors.appBarUnderLineColor,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: AppColors.bgColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    'Step 1',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.sFPro16w400,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: AppColors.whiteColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: CustomTextField(
                  controller: dateController,
                  text: 'Start date',
                  hintText: 'Sep 12, 2023',
                  enabled: true,
                  prefixIcon: const Image(
                    image: AssetImage('assets/icons/date.png'),
                  ),
                  onTap: () {
                    selectDate(context);
                  },
                ),
              ),
            ),
            const SenderDetails(),
            const ResipientAdress(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 20, left: 20, right: 20),
              child: CustomButton(
                text: 'Next step',
                style: AppTextStyle.roboto16w500White,
                color: AppColors.btnActiveColor,
                horizontal: 20,
                vertical: 18.5,
                onTap: () {},
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime date) {
    final formatter = DateFormat.yMMMd('en_US');
    return formatter.format(date);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != dateController.text) {
      setState(() {
        dateController.text = formatDate(picked);
      });
    }
  }
}
