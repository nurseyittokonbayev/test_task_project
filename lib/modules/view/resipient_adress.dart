import 'package:flutter/material.dart';
import 'package:test_project/components/custom_tab_widget.dart';
import 'package:test_project/components/custom_textfield.dart';
import 'package:test_project/theme/app_colors.dart';
import 'package:test_project/theme/text_style.dart';

class ResipientAdress extends StatefulWidget {
  const ResipientAdress({
    super.key,
  });

  @override
  State<ResipientAdress> createState() => _ResipientAdressState();
}

class _ResipientAdressState extends State<ResipientAdress>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isSelectAddressTab = false;
  List<Widget> textFields = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      isSelectAddressTab = _tabController.index == 1;
    });
  }

  void addAdressLine() {
    setState(() {
      textFields.add(
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: CustomTextField(
            text: 'Address line 1*',
            hintText: 'Via Toledo 256',
            prefixIcon: Image(
              image: AssetImage('assets/icons/adressLine.png'),
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    double tabViewHeight = screenHeight * 0.9;

    if (isSelectAddressTab) {
      tabViewHeight = screenHeight * 0.21;
    }
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.whiteColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Recipient adress',
              style: AppTextStyle.roboto16w700,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabBar(
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    tabs: [
                      CustomTabWidget(
                        text: 'Add Address',
                        isActive: _tabController.index == 0,
                        onTap: () {
                          _tabController.animateTo(0);
                        },
                      ),
                      CustomTabWidget(
                        text: 'Select Address',
                        isActive: _tabController.index == 1,
                        onTap: () {
                          _tabController.animateTo(1);
                        },
                      )
                    ],
                    unselectedLabelColor: const Color(0xFF919DAB),
                    labelColor: Colors.white,
                    indicator: const BoxDecoration(color: Colors.transparent),
                  ),
                  SizedBox(
                    height: tabViewHeight,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: CustomTextField(
                                    text: 'Full name*',
                                    hintText: 'Ko Yuri',
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: CustomTextField(
                                    text: 'Email*',
                                    hintText: 'yuri@email.com',
                                    prefixIcon: Icon(Icons.mail),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: CustomTextField(
                                    text: 'Phone number*',
                                    hintText: '+375294545687',
                                    prefixIcon: Icon(Icons.phone),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: CustomTextField(
                                    text: 'Country*',
                                    hintText: 'Italy',
                                    prefixIcon: Icon(Icons.location_on),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: CustomTextField(
                                    text: 'City*',
                                    hintText: 'Naple',
                                    prefixIcon: Image(
                                      image:
                                          AssetImage('assets/icons/city.png'),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: CustomTextField(
                                    text: 'Address line 1*',
                                    hintText: 'Via Toledo 256',
                                    prefixIcon: Image(
                                      image: AssetImage(
                                          'assets/icons/adressLine.png'),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: textFields,
                                ),
                                InkWell(
                                  onTap: addAdressLine,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 20),
                                    child: Text(
                                      'Add address line +',
                                      style: AppTextStyle
                                          .roboto16w500BtnAsctiveColor,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: CustomTextField(
                                    text: 'Postcode*',
                                    hintText: '80100',
                                    prefixIcon: Image(
                                      image:
                                          AssetImage('assets/icons/post.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Контент для "Select Address" вкладки
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: CustomTextField(
                                  text: 'Search',
                                  hintText: 'Search',
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.appBarTextColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Ko Yuri',
                                              style: AppTextStyle
                                                  .roboto14w600White,
                                            ),
                                            Image.asset(
                                                'assets/icons/edit.png'),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 6),
                                        child: Text(
                                          'Italy, Naple, Via Toledo 256, 220069',
                                          style: AppTextStyle
                                              .roboto14w400withColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
