import peasy.*;
PeasyCam cam;
PUPIL my_;
EYE eye;
int n=1;
color[] col={color(255),color(147,224,255),color(255,245,247),color(182,194,154),color(244,208,0)};

void setup(){
  cam = new PeasyCam(this, 500); //调试用摄像机 1
  size(1200,600,P3D);
  float r=70;//直径
  float l0=30;//最外层
  float l1=25; //次外层
  float l2=22;//次内层
  float l3=15;//黑眼仁
  my_ = new PUPIL(r,l0,l3+1);
  eye=new EYE(my_,r,l0,l1,l2,l3);
  for(int i=0;i<n;i++)eye.set(i,50-width/2,50-height/2,random(300,400),col[i%5],"2.PNG");
  //eye.set(i,0,0,100,col[i%5],"2.PNG");//initial 原点
}


int times=5;
int z=0;
void keyPressed(){
  if(key=='R'){for(int i=0;i<n;i++)eye.set(i,-600+i*210,20*random(-25,25),random(200,500),col[i%5],"2.PNG");}
  if(key=='w')times++;
  if(key=='s' && times>1)times--;
  if(key=='a' && z>=100)z+=5;
  if(key=='d' && z>=105)z-=5;
  println("Key Pressed！！！ "+"times: "+times+"z: "+z);
}


void draw(){
//坐标变换和旋转
//  scale(times);
  background(240);
//  translate(width/2,height/2,-z);
  translate(0,0,-z);  
  text_point();
//画眼球_追踪目标
  for(int i=0;i<n;i++)eye.target_draw(i,mouseX-width/2,mouseY-height/2, width/2+100);
}


void text_point(){
//  stroke(255,0,0);  line(0,0,z,10,0,z);
//  stroke(0,255,0);  line(0,0,z,0,10,z);
//  stroke(0,0,255);  line(0,0,z,0,0,10+z);

    lights();
    fill(255,80,0);   
    pushMatrix();
    translate(mouseX-width/2,mouseY-height/2,z);
    noStroke();
    sphere(8);
    popMatrix();
}



//以下是 其他代码
