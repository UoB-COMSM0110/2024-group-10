class Explosion {
    float x, y;
    PImage image; 
    int frameCountdown = 60; 
    boolean active = true;

    Explosion(float x, float y, PImage img) {
        this.x = x;
        this.y = y;
        this.image = img;
    }

    void update() {
        if (frameCountdown > 0) {
            frameCountdown--;
        } else {
            active = false;
        }
    }

    void display() {
        if (active) {
            imageMode(CENTER);
            image(image, x, y);
        }
    }

    boolean isActive() {
        return active;
    }
}
