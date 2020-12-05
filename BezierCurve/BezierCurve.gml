// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


///Bezier_Point_Find(lerp, p0x, p0y, p1x, p1y, p2x, p2y, p3x, p3y)
/*
Lerp is a value from 0-1 to find on the line between p0 and p3
p1 and p2 are the control points

returns array (x,y)
*/

function bezier_cubi(t, p0, p1, p2, p3){ // bezier cubique

//Precalculated power math
var tt  = t  * t;
var ttt = tt * t;
var u   = 1  - t; //Inverted
var uu  = u  * u;
var uuu = uu * u;

//Calculate the point
var px =     uuu * p0.x; //first term
var py =     uuu * p0.y;
px += 3 * uu * t * p1.x; //second term
py += 3 * uu * t * p1.y;
px += 3 * u * tt * p2.x; //third term 
py += 3 * u * tt * p2.y;
px +=        ttt * p3.x; //fourth term
py +=        ttt * p3.y;

//Pack into an array

return new vect2(px,py)

}

function bezier_quadra(t, p0 , p1, p2){ // bezier quadratique
//Precalculated power math
var tt  = t  * t;
var u   = 1  - t; //Inverted
var uu  = u  * u;

//Calculate the point

var px =  uu     * p0.x; //first term
var py =  uu     * p0.y;
    px += 2 * u * t  * p1.x; //second term
    py += 2 * u * t  * p1.y;
    px +=         tt * p2.x; //third term 
    py +=         tt * p2.y;


return new vect2(px,py)

}
	
	