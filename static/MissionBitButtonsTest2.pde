import de.bezier.guido.*;
//make arraylist of buttons
private ArrayList <myButton> buttons = new ArrayList <myButton>();
// array of all strings
private String[] answers = {"Touches partner without consent", 
  "Exposes their genitals without consent", 
  "Refuses to use protection during sex", 
  "Repeatedly makes sexual comments", 
  "Pressures partner to have sex", 
  "Has sex under influence of drugs", 
  "Has sex under influence of alcohol", 
  "Forces partner to have sex", 
  "Has sex after partner changes mind", 
  "Repeatedly asks to have sex", 

  "Accidentally bumps into someone", 
  "Asks someone to have sex", 
  "Asks for nudes", 
  "Talks about sex", 
  "High-fives someone"
};
//array of strings of incorrect button text
private String[] wrongAnswers = {"Accidentally bumps into someone", 
  "Asks someone to have sex", 
  "Asks for nudes", 
  "Talks about sex", 
  "High-fives someone"};

private myButton b;
public void setup () {
  size(600, 600);
  textAlign(CENTER);
  noStroke();

  Interactive.make( this ); // make the manager

  //initialize buttons arraylist
  for (int i = 0; i < answers.length; i++)
    buttons.add(new myButton((float)(Math.random()*300+50), (float)(Math.random()*300+50), 225, 40, answers[i]));

  //test stuff
  //buttons.add(new myButton((float)(Math.random()*300+50), (float)(Math.random()*300+50), 100, 30, "hi")); 
  //b  = new myButton(200, 200, 100, 40, "hello"); // create a button
}

public void draw () {
  background(0);
  fill(255);
  textSize(24);
  text("Correct answers left:" + parseInt(buttons.size()-5), 300, 50); 
}

public class myButton
{
  private float x, y, width, height;
  private boolean on;
  private String myText;
  private int myColor;
  private double myXspeed, myYspeed, radians;

  public myButton (float xx, float yy, float w, float h, String text)
  {
    x = xx; 
    y = yy; 
    width = w; 
    height = h;
    myText = text;
    myColor = color((int)(Math.random()*100+150), (int)(Math.random()*100+150), (int)(Math.random()*100+150));
    
    radians = Math.random()*(Math.PI/180); //randomized
    myXspeed += Math.random()*1+1 + Math.cos(radians);
    myYspeed += Math.random()*1+1 + Math.cos(radians);

    Interactive.add( this ); // register button with the manager
  }
  public void mousePressed () { 
    on = true;
  }
  public void draw () 
  {
    if (on) { //if clicked
      //checks whether clicked button is on the wrong answers list
      for (int i = 0; i < wrongAnswers.length; i++){
        if (myText.equals(wrongAnswers[i])){   
          System.out.println("incorrect button presssed"); //stop program
          fill(255,0,0); //red
          textSize(18);
          text("Incorrect! This is a common misconception", 300, 50);
          noLoop(); //stops program
        }
      }
    } else { 
      fill(myColor);
    }

    rect(x, y, width, height, 20);
    fill(0);
    textSize(12);
    text(myText, x+(width/2), y+(height/2));

    x += myXspeed;
    y += myYspeed;
    if (x > 600-width)
      myXspeed*=-1;
    if (x < 0)
      myXspeed*=-1;
    if (y > 600-height)
      myYspeed*=-1;
    if (y < 0)
      myYspeed*=-1;
  }
  public boolean getOn() {
    return on;
  }
  public String getText() {
    return myText;
  }
}
