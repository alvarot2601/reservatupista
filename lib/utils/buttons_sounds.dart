import 'package:just_audio/just_audio.dart';

class ButtonsSounds {
  // static AudioPlayer sound1 = new AudioPlayer();
  static AudioPlayer audioPlayer = AudioPlayer();
  // Función para reproducir el sonido
  static void playSound({String? sound}) async {
    print(
        "--------------------------------------------------------------------------------------------");
    final soundPath = sound ?? "assets/sounds/click_button.mp3";
    print(soundPath);
    try {
      await audioPlayer.setAsset(soundPath);
      audioPlayer.seek(Duration.zero);
      audioPlayer.play();
    } catch (e) {
      print(e);
    }
  }
}
