class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) return '🌩';
    if (condition < 400) return '🌧';
    if (condition < 600) return '☔️';
    if (condition < 700) return '☃️';
    if (condition < 800) return '🌫';
    if (condition == 800) return '☀️';
    if (condition <= 804) return '☁️';
    return '🤷‍';
  }

  String getMessage(int temp) {
    if (temp > 30) return 'Trời khá nóng, làm ly trà sữa thôi Việt!';
    if (temp > 20) return 'Thời tiết tuyệt vời để đi chơi!';
    if (temp < 10) return 'Lạnh quá, nhớ mặc thêm áo ấm nhé!';
    return 'Thời tiết hôm nay rất ổn.';
  }
}
