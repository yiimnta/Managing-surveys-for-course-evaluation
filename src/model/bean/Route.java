package model.bean;

public class Route {
    private String x;
    private String y;

    public Route(String x, String y) {
        this.x = x;
        this.y = y;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public String getY() {
        return y;
    }

    public void setY(String y) {
        this.y = y;
    }
    
    public Route(){
        this.x = "";
        this.y = "";
    }
    
}