datatype Valve = ON | OFF

method Controller(V1: Valve, v2: Valve, v3: Valve, height: int, in_flow: int ) returns (new_v1: Valve, new_v2: Valve, new_v3: Valve)
requires v1==OFF && v2==ON && (v3==OFF || v3==ON)
requires height >=0 && height <127
ensures (height>10 && new_v1==OFF && new_v3==ON)|| (height <8 && new_v1== OFF && new_v2== ON )|| ((in_flowv >5 ) && new_v2==OFF )
{
    if(height > 10)
    {
        v1:= OFF;
        v3:= ON;
    }
    else if(height <8)
    {
        v1:= OFF;
        v2:=ON;
    }
    new_v1:= v1;
    new_v2:=v2;
    new_v3:=v3;
}


method checkRegulation(tank: Tank)
 //requires tank.pipe.v1==OFF && tank.pipe.v2==ON && (tank.pipe.v3==OFF || tank.pipe.v2==ON) 
ensures (tank.height>10 && tank.pipe.v1==OFF && tank.pipe.v3==ON && tank.pipe.v2==old(tank.pipe.v2)) 
|| (tank.height <8 && tank.pipe.v1== OFF && tank.pipe.v2== ON && tank.pipe.v3==old(tank.pipe.v3))
|| ((tank.pipe.in_flowv3 >5 || tank.pipe.in_flowv1 >5 ) && tank.pipe.v2==OFF && tank.pipe.v3==old(tank.pipe.v3) && tank.pipe.v1==old(tank.pipe.v1))
modifies tank.pipe;
 {
    if(tank.height >10)
     {
         tank.pipe.v1:= OFF;
         tank.pipe.v3:= ON;
        assert((tank.height>10 && tank.pipe.v1==OFF && tank.pipe.v3==ON && tank.pipe.v2==old(tank.pipe.v2)));
     }
    else if(tank.height <8)
     {
         
         tank.pipe.v1:= OFF;
         tank.pipe.v2:= ON;
         assert((tank.height <8 && tank.pipe.v1== OFF && tank.pipe.v2== ON && tank.pipe.v3==old(tank.pipe.v3)));
     }
     
     assume(((tank.pipe.in_flowv3 >5 || tank.pipe.in_flowv1 >5 ) && tank.pipe.v2==OFF && tank.pipe.v3==old(tank.pipe.v3) && tank.pipe.v1==old(tank.pipe.v1)));
     /*else if(tank.pipe.in_flowv3 >5 || tank.pipe.in_flowv1> 5)
     {

         tank.pipe.v2:= OFF;
         assume(((tank.pipe.in_flowv3 >5 || tank.pipe.in_flowv1 >5 ) && tank.pipe.v2==OFF && tank.pipe.v3==old(tank.pipe.v3) && tank.pipe.v1==old(tank.pipe.v1)));
     } */
     
 } 