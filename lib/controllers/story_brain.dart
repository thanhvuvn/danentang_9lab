import 'package:labs/models/Story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle:
          'Bạn đang đi trên một con đường vắng ở ngoại ô Đà Lạt, bỗng thấy một chiếc xe cổ dừng bên lề đường với khói bốc lên từ nắp capo.',
      choice1: 'Dừng lại giúp đỡ người lái xe.',
      choice2: 'Tiếp tục đi vì trời sắp tối.',
    ),
    Story(
      storyTitle:
          'Người lái xe là một cụ già, ông ấy đưa cho bạn một chiếc hộp gỗ bí ẩn để cảm ơn.',
      choice1: 'Mở hộp ngay lập tức.',
      choice2: 'Mang về nhà rồi mới mở.',
    ),
    Story(
      storyTitle:
          'Bạn quyết định đi tiếp, nhưng bỗng nhiên xe của bạn cũng hết xăng ngay giữa rừng.',
      choice1: 'Đi bộ tìm sự trợ giúp.',
      choice2: 'Ngồi trong xe đợi đến sáng.',
    ),
    Story(
      storyTitle:
          'Trong hộp là một tấm bản đồ dẫn đến kho báu cổ tại Langbiang! Bạn đã thắng!',
      choice1: 'Chơi lại',
      choice2: '',
    ),
    Story(
      storyTitle:
          'Bạn bị lạc trong rừng sâu và gặp một bầy sói. Rất tiếc, trò chơi kết thúc.',
      choice1: 'Chơi lại',
      choice2: '',
    ),
  ];

  String getStory() => _storyData[_storyNumber].storyTitle;
  String getChoice1() => _storyData[_storyNumber].choice1;
  String getChoice2() => _storyData[_storyNumber].choice2;

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 4;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber >= 3) {
      restart();
    }
  }

  void restart() => _storyNumber = 0;
  bool buttonShouldBeVisible() => _storyData[_storyNumber].choice2 != "";
}
