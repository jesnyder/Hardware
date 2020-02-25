// 3D printed template 

// Microplate well dimensions 
d_well = 6; //  mm
r_well = d_well/2; //  mm
h_well = 8;  // mm
column_offset = 9.5; // mm
row_offset = column_offset; // mm
quality_fn = 50;

// Microplate 
num_of_row = 12;
num_of_col = 8;

// Lattice height and width
lattice_height = .5; 
lattice_width = .5; 

// Build templates for mold
module well_mold() {   
    for(j=[1:num_of_row]) {  
    for(i=[1:num_of_col]) {  
        translate([row_offset*i, column_offset*j, 0]) 
        cylinder (h = h_well, r=r_well, $fn=quality_fn); 
     }}}
     
 
 // Build lattice to connect the wells
module  well_connection_col() {   
    for(j=[1:num_of_row]) {  
    for(i=[1:num_of_col]) {  
        translate([row_offset*i, column_offset*j, 0]) 
        cube (size = [lattice_width, column_offset, lattice_height]); 
     }}}
     
module  well_connection_row() {   
    for(j=[1:num_of_row]) {  
    for(i=[1:num_of_col]) {  
        translate([row_offset*i, column_offset*j, 0]) 
        cube (size = [row_offset, lattice_width, lattice_height]); 
     }}}
     
  // Add all of wells with the lattice  
 well_mold();
 well_connection_col();  
 well_connection_row();   
  