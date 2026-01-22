import 'package:assignment_clone/detail_module/payment_detail.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

import '/detail_module/transfer_detail.dart';
import '/detail_module/promotion_detail.dart';
import '/detail_module/qr_scanner.dart';
import '/detail_module/favorite_detail.dart';
import '/detail_module/messager_app.dart';
import '/detail_module/card_detail.dart';
import '/detail_module/account_detail.dart';
import '/detail_module/khqr_card_screen.dart';
import '/detail_module/bank_setting.dart';

import '../database_module/promotion_module.dart';
import '/database_module/items_module.dart';
import '/database_module/min_apps_module.dart';

class MainABAPage extends StatefulWidget {
  const MainABAPage({super.key});

  @override
  State<MainABAPage> createState() => _MainABAPageState();
}

class _MainABAPageState extends State<MainABAPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(CupertinoPageRoute(builder: (content) => MessagerApp()));
            },
            icon: Icon(Icons.message),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (content) => KhqrCardScreen()),
              );
            },
            icon: Icon(Icons.qr_code_scanner),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 4, 82, 106),
      body: _buildMainBodyView(),
    );
  }

  Widget _buildMainBodyView() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _builderTopView(),
        _title("New & Promotions"),
        _buildStackAutoSlider(),
        _title("Mini Apps"),
        _buildMiniAppView(),
        _title("Government Service"),
        _buildGovServiceView(),
        _title("Dicoveries"),
        _buildDicoveriesView(),
        _buildElevatedBtn(),
      ],
    );
  }

  Widget _title(String title) {
    return Text(
      '   $title',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 22,
      ),
    );
  }

  Widget _builderTopView() {
    String profileImage = 'assets/images/thalath.jpg';
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(0, 255, 255, 255), // heavy bottom
            Color.fromARGB(10, 255, 255, 255),
            Color.fromARGB(66, 255, 255, 255),
            Color.fromARGB(155, 255, 255, 255),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileDetail()),
                );
              },
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(64),
                  child: Image.asset(profileImage, fit: BoxFit.cover),
                ),
                title: Text(
                  "Hello, Thalath!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "View Profile",
                  style: TextStyle(color: Colors.grey[200]),
                ),
              ),
            ),
            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.red,
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    _title("\$10,000.00"),
                    SizedBox(height: 5),
                    _title("Default: USD"),
                    SizedBox(height: 5),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSubTansferIcon(Icons.call_received, "Receive"),
                          _buildSubTansferIcon(CupertinoIcons.car_fill, "Send"),
                          _buildSubTansferIcon(
                            Icons.analytics_sharp,
                            "Analyze",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1,
              padding: EdgeInsets.all(10),
              children: [
                _buildGridViewItems(
                  Icons.account_balance_wallet,
                  "Account",
                  AccountDetail(),
                ),
                _buildGridViewItems(Icons.credit_card, "Card", CardDetail()),
                _buildGridViewItems(Icons.star, "Favorites", FavoriteDetail()),
                _qrCoderScanner(
                  Icons.qr_code_scanner,
                  "ABA Scan",
                  QrCodeScanner(),
                ),
                _buildGridViewItems(
                  Icons.swap_horiz,
                  "Transfer",
                  TransferDetail(),
                ),
                _buildGridViewItems(
                  CupertinoIcons.money_dollar_circle,
                  "Payments",
                  PaymentDetail(),
                ),
              ],
            ),
            Divider(indent: 20, endIndent: 20, color: Colors.white),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildMinApp(Icons.grid_view_outlined, "Mini Apps"),
                    _buildMinApp(Icons.wallet_giftcard, "Gift zone"),
                    _buildMinApp(Icons.store_mall_directory, "ABA Merchant"),
                    _buildMinApp(Icons.account_balance, "Government"),
                    _buildMinApp(Icons.badge, "Auto payments"),
                    _buildMinApp(Icons.settings_suggest, "Navi"),
                    _buildMinApp(Icons.cast_sharp, "E-Cash"),
                    _buildMinApp(Icons.add, "New Account"),
                    _buildMinApp(Icons.group_add, "Invite Friend"),
                    _buildMinApp(Icons.request_quote_rounded, "Loan"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubTansferIcon(IconData iconData, String title) {
    return TextButton.icon(
      onPressed: () {},
      label: Text(title, style: TextStyle(color: Colors.black)),
      icon: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: Icon(iconData),
      ),
    );
  }

  Widget _buildMiniAppView() {
    return Card(
      color: Colors.grey[600],
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < miniAppLogo.length; i++)
              _buildMiniAppLogo(
                miniAppLogo[i].appImage,
                miniAppLogo[i].appTitle,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGovServiceView() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 158, 158, 158),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 110,
      padding: EdgeInsets.only(top: 5),
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < miniAppLogo.length; i++)
              _buildMiniAppLogo(
                miniAppLogo[i].appImage,
                miniAppLogo[i].appTitle,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDicoveriesView() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: itemList.length,
        itemBuilder: (content, index) {
          return Container(
            margin: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
              child: Image.network(
                width: 110,
                itemList[index].image,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildElevatedBtn() {
    return Center(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(7),
          ),
        ),
        onPressed: () {},
        label: Text("Edit"),
        icon: Icon(Icons.edit),
      ),
    );
  }

  Widget _buildGridViewItems(
    IconData mainIcon,
    String subTitle,
    Widget detailPage,
  ) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => detailPage));
      },
      child: Card(
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(mainIcon, size: 40),
            SizedBox(height: 10),
            Text(
              subTitle,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _qrCoderScanner(
    IconData mainIcon,
    String subTitle,
    Widget detailPage,
  ) {
    return InkWell(
      onTap: () async {
        bool allowed = await requestCameraPermission();

        if (!mounted) return;

        if (allowed) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const QrCodeScanner()),
          );
        }
      },
      child: Card(
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(mainIcon, size: 40),
            SizedBox(height: 10),
            Text(
              subTitle,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();

    if (status.isGranted) {
      return true;
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    return false;
  }

  Widget _buildMinApp(IconData iconData, String miniAppTitle) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(iconData),
          Text(
            '  $miniAppTitle',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniAppLogo(String image, String text) {
    String newTitle = text.replaceAll(RegExp(r'\s+'), '\n');
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(5),
              child: Image.network(
                image,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            ),
          ),
          Text(
            newTitle,
            style: TextStyle(fontSize: 12, color: Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildStackAutoSlider() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // 🔹 Slider
        CarouselSlider(
          items: promotionList.map((url) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => PromotionDetail(url),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.network(
                    url.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
        ),

        // 🔹 Dots overlay
        Positioned(
          bottom: 15,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: promotionList.asMap().entries.map((entry) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _currentIndex == entry.key ? 10 : 8,
                  height: _currentIndex == entry.key ? 10 : 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? Colors.white
                        : Colors.white54,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
