bottom_barb_diam = 5.0;
bottom_barb_min_mul = 0.8;
bottom_barb_height = 2.5;
bottom_barb_count = 3;

top_barb_diam = 5.0;
top_barb_min_mul = 0.8;
top_barb_height = 2.5;
top_barb_count = 3;

hole_diam = 2.0;

draw();
module draw()
{
    $fn = 200;
    difference(){
        union(){
            drawAdapter(bottom_barb_diam*bottom_barb_min_mul, bottom_barb_diam, bottom_barb_height, bottom_barb_count);
        
            zMov = (bottom_barb_height*(bottom_barb_count-0.5)) + (top_barb_height*(top_barb_count-0.5));
            translate([0, 0, zMov])
            rotate([180, 0, 0])
            drawAdapter(top_barb_diam*top_barb_min_mul, top_barb_diam, top_barb_height, top_barb_count);
        }
       cylinder(d=hole_diam, h=1000, center=true);
    }
}

module drawAdapter(d1, d2, barb_height, barb_count)
{
    for (i = [0:barb_count-1]){
        translate([0, 0, barb_height*i])
        cylinder(h=barb_height, d1=d1, d2=d2,center=true);
    } 
}