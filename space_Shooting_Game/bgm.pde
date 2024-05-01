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
AudioPlayer introbgm;
AudioPlayer menubgm;
AudioPlayer powerup;
AudioPlayer powerdown;
AudioPlayer bossExplosion;

  void stop() {
  bgm.close();
  bossbgm.close();
  gameoverbgm.close();
  winbgm.close();
  alarm.close();
  glass.close();
  shatter.close();
  introbgm.close();
  menubgm.close();
  powerup.close();
  powerdown.close();
  bossExplosion.close();
  minim.stop();
  super.stop();
}
