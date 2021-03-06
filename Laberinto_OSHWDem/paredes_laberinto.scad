// Paredes modulares para probar el laberinto de la OSHWDem ( http://oshwdem.org/ )
// Diseñado por Víctor Uceda (@VictorUceda), Eduardo Hilario (@eduhs) y Carlos García (@CarlosGS)
// Club de Robótica-Mecatrónica, Universidad Autónoma de Madrid ( http://crm.ii.uam.es )
// Licencia: Public Domain

module columna(complex=true){

    if(complex){
    difference(){
        translate([0,0,0.5]) cube([30,30,1],center=true);
        translate([12.5,12.5,0])cube([6.6,6.6,4],center=true);
        translate([12.5,-12.5,0])cube([6.6,6.6,4],center=true);
        translate([-12.5,12.5,0])cube([6.6,6.6,4],center=true);
        translate([-12.5,-12.5,0])cube([6.6,6.6,4],center=true);
    }
}
difference(){
    translate([0,0,25])cube([20,20,50],center=true);
    translate([0,0,35+0.5])cube([18.4,18.4,70],center=true);
}  
} 


module pieza(complex=true){
    columna(complex);
translate([148/2,10-0.4 ,25])cube([148,0.8,50],center=true);
translate([148/2,-(10-0.4) ,25])cube([148,0.8,50],center=true);
}

module bloque_impresion_piezas(numPiezas=8){
    for(i=[0:numPiezas/2]){
        translate([0,i*31,0])pieza();
    }
    for(i=[0:numPiezas/2]){
        translate([165,10+i*31  ,0])rotate([0,0,180])pieza();
    }
}

module bloque_impresion_columnas(dim=3){
    for(j=[0:dim-1]){
        translate([j*35,0,0])union(){
            for(i=[0:dim-1]){
                translate([0,i*35,0])columna();
            }
        }
    }
}
bloque_impresion_piezas();
%translate([-15,-15,-10])cube([198,198,5]); // base de impresión
*bloque_impresion_columnas();


