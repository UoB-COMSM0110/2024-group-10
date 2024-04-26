//bgm related
import ddf.minim.*;
Minim minim; 
AudioPlayer bgm; 
AudioPlayer bossbgm;
AudioPlayer alarm;
AudioPlayer glass;
AudioPlayer shatter;
AudioPlayer gameoverbgm;
AudioPlayer winbgm;

  void stop() {
  bgm.close();
  bossbgm.close();
  gameoverbgm.close();
  winbgm.close();
  alarm.close();
  glass.close();
  shatter.close();
  minim.stop();
  super.stop();
}
