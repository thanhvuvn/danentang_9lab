import 'package:flutter/material.dart';
import 'package:labs/models/WheatherModel.dart';

class Lab9 extends StatefulWidget {
  const Lab9({super.key});

  @override
  State<Lab9> createState() => _Lab9State();
}

class _Lab9State extends State<Lab9> {
  WeatherModel weather = WeatherModel();
  int temperature = 0;
  String weatherIcon = '';
  String cityName = 'Đang tải...';
  String message = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    updateUI(); // Giả lập lấy dữ liệu khi vừa mở app
  }

  // Giả lập gọi API và lấy tọa độ GPS
  void updateUI() async {
    setState(() => isLoading = true);

    // Giả lập độ trễ mạng 2 giây
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      temperature = 28;
      weatherIcon = weather.getWeatherIcon(750); // Mã 800 là trời nắng
      cityName = 'Đà Nẵng';
      message = weather.getMessage(temperature);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1513002749550-c59d786b8e6c',
            ), // Ảnh nền mây trời
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
          ),
        ),
        child: SafeArea(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Hàng trên cùng: Nút refresh và tìm kiếm
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: updateUI,
                            icon: const Icon(
                              Icons.near_me,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            cityName,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {}, // Tính năng tìm kiếm mở rộng
                            icon: const Icon(
                              Icons.location_city,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // Giữa: Hiển thị nhiệt độ và Icon
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '$temperature°',
                                style: const TextStyle(
                                  fontSize: 100,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                weatherIcon,
                                style: const TextStyle(fontSize: 80),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Dưới: Thông điệp thời tiết
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Text(
                          "$message",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
