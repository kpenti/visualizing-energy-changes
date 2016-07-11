from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 4HS8.pdb, model
create antigen_chain, chain A
create antibody_chains, chain H+L
delete model

set ray_trace_mode,  1
#set ambient, 1
#set reflect, 0
#set two_sided_lighting, on
unset specular

remove solvent
hide nonbonded

color white, *
show spheres, *

select interface, resi 412+413+414+415+416+417+418+420+423+413+415+418+419+420+421+422 and chain A
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 423+421 and chain A
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 412+419+417+422 and chain A
color yelloworange, yelloworange_residues
select red_residues, resi 414+416+413+418 and chain A
color red, red_residues


set_view (\
     0.867052734,    0.423240215,   -0.262844115,\
    -0.227527976,    0.805722773,    0.546847284,\
     0.443227351,   -0.414340973,    0.794902861,\
     0.000003569,   -0.000000219,  -84.972328186,\
   -15.482845306,  -10.834058762,  -15.500176430,\
    40.834968567,  129.110061646,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/4HS8_A.png