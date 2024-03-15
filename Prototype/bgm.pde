//bgm related
import ddf.minim.*;
Minim minim; 
AudioPlayer bgm; 

  void stop() {
  bgm.close();
  minim.stop();
  super.stop();
}
