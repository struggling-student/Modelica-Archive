
block StreamMobAvg

InputReal x;  // x stream 

OutputReal y;  // mobile average

MobAvg Mavg;


equation


connect(Mavg.u, x);
connect(Mavg.y, y);


end StreamMobAvg;

