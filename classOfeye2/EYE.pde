class EYE{
float r;//直径70
float l0;//最外层30
float l1; //次外层25
float l2;//次内层22
float l3;//黑眼仁15
float[] x=new float[25];
float[] y=new float[25];
float[] z=new float[25];//眼球位置z必须不为0 否则无法正常旋转。测试的时候用了150
PImage pic;
color[] c=new color[25];
PUPIL my;

EYE(PUPIL O,float R,float L0,float L1,float L2,float L3){
l0=L0;  
l1=L1;  
l2=L2;  
l3=L3;
r=R;
my=O;
}

void set(int i,float X,float Y,float Z,color C,String m){
x[i]=X;
y[i]=Y;
z[i]=Z;
c[i]=C;
pic=loadImage(m);
}


//画眼球
void Draw(int i){
  lights();  
  noStroke();
  fill(c[i]); 
  sphere(r);
  
  layer_eye(l0,l1,color(30));
  layer_eye(l1,l2,color(140)); 
  layer_eye(l2,l3,color(80));
//  layer_eye(l3,0,color(0,220));
  layer_eye(l3,0,color(0,0,20,220));

}

void target_draw(int i,float tarX,float tarY ,float Dmax){
  pushMatrix();

  translate(this.x[i],this.y[i],-this.z[i]);
  
  rotate_eye(i,tarX,tarY);
  
  float d=dist(this.x[i],this.y[i],this.z[i],tarX,tarY,0);
  float D=map(d,this.z[i]-50,this.z[i]+height/4,-15,14);//自行设置 设置大了也无所谓
  while(D+15>l1-2)D--; focus(D);
  
  Draw(i);
  popMatrix();
  
}


//传入 黑眼仁宽度
void focus(float d){
      if(15+d<l1-2 && 15+d<30 && 15+d>0)l3=15+d;    
}



//传入，眼球位置，目标位置
void rotate_eye(int i,float X,float Y){
  float p_2x=atan2((Y-this.y[i]) , this.z[i]);
  rotateX(-p_2x);
  
  float p_2y=atan2((X-this.x[i]) , this.z[i]);
  rotateY(p_2y);
}

//传入，各个层的角度（即宽度），半径，颜色
void layer_eye(float P,float p,color co){
  pushStyle();
  beginShape();
  fill(co);  
   for(int i=int(p);i<int(P);i++){
     if(i>14 && i<l0-2)if(i>l3)texture(pic);
    for(int j=0;j< my.x[i].size()-2;j++){ 
        vertex( my.x[i].get(j), my.y[i].get(j), my.z[i].get(j) ,my.x[i].get(j)*110/r+105,my.y[i].get(j)*110/r+105 );
    }  
   }
  endShape(CLOSE);
  popStyle();
}
};
