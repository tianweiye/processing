class PUPIL{
  FloatList[] x = new FloatList[33];
  FloatList[] y = new FloatList[33];
  FloatList[] z = new FloatList[33];
  //x[i].get(j) i z轴角度，j x-y平面角度相关
  
  PUPIL(float r,float pmax, float pmin){    
    for(int i=0;i<=pmax; i++){
      x[i]=new FloatList();
      y[i]=new FloatList();
      z[i]=new FloatList();
      for(int t=0;t<361;t++){
        
        if(i>pmin && i<pmax && int(t)%5!=0 && t!=0)continue;//中间
        if(i<5 && int(t)%8!=0 && t!=0 )continue;//中间
        
        x[i].append(r*sin( radians(i) )*cos( radians(t)));
        
        y[i].append((r*sin(radians(i))*sin(radians(t))));
        
        z[i].append((r*cos(radians(i)) +1)); 
    }
  }   
    int count=0;    for(int i=0; i<=pmax;count+=x[i].size(), i++) println("r["+i+"].size():"+x[i].size());    println("amount of size pointArray = "+count);

  }
  
}
