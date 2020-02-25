// 3D printed template for U bottom 48 well plate. 

// Well dimensions 
d_well = 10; //  mm
r_well = d_well/2; //  mm
h_well = r_well;  // mm
quality_fn = 100;

// Plate dimensions
row_num = 6; 
col_num = 4; 
row_total_length = 90; // distance in mm 
col_total_length = 60; // distance in mm 
row_spacing = row_total_length / row_num; // center to center spacing of wells in the rows 
col_spacing = col_total_length / col_num; // center to center spacing of wells in the rows 

// Structural lattice height and width
lattice_height = 1; 
lattice_width = 1; 

// Build templates for mold
module well_mold() {   
    for(j=[1:row_num]) {  
    for(i=[1:col_num]) {  
        translate([row_spacing*i, col_spacing*j, 0]) 
        cylinder (h = h_well, r=r_well, $fn=quality_fn); 
     }}}
     
// Add U-bottom
module u_bottom() {   
    for(j=[1:row_num]) {  
    for(i=[1:col_num]) {  
        translate([row_spacing*i, col_spacing*j, r_well]) 
        sphere (r = r_well, $fn=quality_fn); 
     }}}
     
 
 // Build lattice to connect the wells
module  well_connection_col() {   
    for(j=[1:row_num]) {  
    for(i=[1:col_num]) {  
        translate([row_spacing*i, col_spacing*j, 0]) 
        cube (size = [lattice_width, col_spacing, lattice_height]); 
     }}}
     
module  well_connection_row() {   
    for(j=[1:row_num]) {  
    for(i=[1:col_num]) {   
        translate([row_spacing*i, col_spacing*j, 0]) 
        cube (size = [row_spacing, lattice_width, lattice_height]); 
     }}}
     
// Add all of wells with the lattice  
 union(){
    well_mold();
    well_connection_col();  
    well_connection_row();  
    u_bottom(); 
 }
  