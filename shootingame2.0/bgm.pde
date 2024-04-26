//bgm related
import ddf.minim.*;
Minim minim; 
AudioPlayer bgm; 
AudioPlayer bossbgm;
AudioPlayer alarm;
AudioPlayer glass;
AudioPlayer shatter;

  void stop() {
  bgm.close();
  bossbgm.close();
  alarm.close();
  glass.close();
  shatter.close();
  minim.stop();
  super.stop();
}
