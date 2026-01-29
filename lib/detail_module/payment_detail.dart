import 'package:flutter/material.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        foregroundColor: Colors.white,
        title: const Text(
          "ABA ទទូទាត់",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Siem Reap",
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_today_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://i.pinimg.com/736x/e7/b6/35/e7b6357d27107fd0e12f1a654dd0b650.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.5),
                    const Color(0xFF0F1923).withOpacity(0.98),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildHeaderInfo(),
                  const SizedBox(height: 30),
                  const Text(
                    "មើលតាមប្រភេទ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Siem Reap",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.3,
                    children: [
                      _buildGridItem(
                        Icons.phone_android,
                        Colors.blue,
                        "បញ្ចូលលុយទូរស័ព្ទ",
                        "សម្រាប់ប្រព័ន្ធ:",
                      ),
                      _buildGridItem(
                        Icons.wifi,
                        Colors.teal,
                        "អ៊ីនធឺណិត",
                        "ទូទាត់សេវាអ៊ីនធឺណិត",
                      ),
                      _buildGridItem(
                        Icons.lightbulb_outline,
                        Colors.blueAccent,
                        "ទឹកភ្លើង & សំរាម",
                        "ទូទាត់វិក្កយបត្រ",
                      ),
                      _buildGridItem(
                        Icons.account_balance,
                        Colors.orange,
                        "រដ្ឋាភិបាល",
                        "បង់ពន្ធ កម្រៃសេវា",
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    "សេវាកម្មផ្សេងៗ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildListItem(
                    Icons.home_work,
                    Colors.purple,
                    "អចលនទ្រព្យ",
                    "ទូទាត់សេវាអចលនទ្រព្យ",
                  ),
                  _buildListItem(
                    Icons.umbrella,
                    Colors.pink,
                    "ធានារ៉ាប់រង",
                    "ទូទាត់សេវាធានារ៉ាប់រង",
                  ),
                  _buildListItem(
                    Icons.monetization_on,
                    Colors.cyan,
                    "ហិរញ្ញវត្ថុ & វិនិយោគ",
                    "កិច្ចសន្យា និងវិនិយោគ",
                  ),
                  _buildListItem(
                    Icons.school,
                    Colors.indigo,
                    "វិស័យអប់រំ",
                    "បង់ថ្លៃសិក្សា",
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ABA ទទូទាត់",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "បញ្ចូលលុយទូរស័ព្ទ បង់ទឹក ភ្លើង និងសេវាផ្សេងៗ ដោយឥតគិតថ្លៃ",
                style: TextStyle(
                  color: Colors.white70,
                  fontFamily: "Siem Reap",
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white.withOpacity(0.1),
          child: const Icon(
            Icons.payments_outlined,
            color: Colors.white,
            size: 40,
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(IconData icon, Color color, String title, String sub) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Siem Reap",
              fontSize: 13,
            ),
          ),
          Text(
            sub,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 10,
              fontFamily: "Siem Reap",
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
  

  

  Widget _buildListItem(IconData icon, Color color, String title, String sub) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Siem Reap",
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          sub,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 12,
            fontFamily: "Siem Reap",
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white24,
          size: 14,
        ),
      ),
    );
  }
}
