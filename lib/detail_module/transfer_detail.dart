import 'package:assignment_clone/database_module/transfer_logo_icon.dart';
import 'package:flutter/material.dart';

class TransferDetail extends StatefulWidget {
  const TransferDetail({super.key});

  @override
  State<TransferDetail> createState() => _TransferDetailState();
}

class _TransferDetailState extends State<TransferDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.date_range_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        _buildHeaderBar(),
        SizedBox(height: 10),
        _buildFavoriteBtn(),
        _trasferTitle("Transfer to Card"),
        SizedBox(height: 10),
        _buildLocalTransfer(),
        SizedBox(height: 10),
        _trasferTitle("Transfer to Card"),
        _buildInternationalTransfer(),
        SizedBox(height: 20),
        _trasferTitle("Transfer to Card"),
        _buildTransferToCard(),
      ],
    );
  }

  Widget _buildHeaderBar() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ABA' Transfers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text("akdhfadlfhajs\ndhfskdjfhaksjdhfksjdhfkjdsfhkjdshkf"),
            ],
          ),
          Image.asset('assets/images/Leakhena.jpg', height: 150, width: 100),
        ],
      ),
    );
  }

  Widget _buildFavoriteBtn() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton.icon(
        onPressed: () {},
        label: Text("Create favorites"),
        icon: Icon(Icons.flag_circle),

        style: ElevatedButton.styleFrom(
          iconColor: Colors.black,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildLocalTransfer() {
    return Card(
      margin: const EdgeInsets.all(10),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: [
          _localGridItems(
            Icons.account_circle_sharp,
            "Own account",
            "make transfer to your own account",
          ),
          _localGridItems(
            Icons.abc,
            "ABA account",
            "Transfer money to other ABA customers",
          ),
          _localGridItems(
            Icons.local_activity,
            "Local Banks & Wallets",
            "make transfer to your own account",
          ),
          _localGridItems(
            Icons.person_add_alt_1_rounded,
            "Cash-by-code",
            "make transfer to your own account",
          ),
        ],
      ),
    );
  }

  Widget _localGridItems(IconData iconData, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(iconData, size: 35),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(subtitle),
        ],
      ),
    );
  }

  Widget _buildInternationalTransfer() {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 4.5,
      ),
      itemCount: internationalTransfer.length,
      itemBuilder: (_, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64),
                ),
                child: Image.network(
                  internationalTransfer[index].image,
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.error, size: 24),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  internationalTransfer[index].title,
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTransferToCard() {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 4.5,
      ),
      itemCount: transferToCard.length,
      itemBuilder: (_, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64),
                ),
                child: Image.network(
                  transferToCard[index].image,
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.error, size: 24),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  transferToCard[index].title,
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _trasferTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}
