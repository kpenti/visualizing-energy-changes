from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 3NH7.pdb, model
create antigen_chain, chain B
create antibody_chains, chain I+M
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

select interface, resi 43+60+62+64+65+66+67+72+74+77+78+81+86+87+90+91+92+93+94+95+96+97+99+43+77+78+79+80+81+82+84+86+92 and chain B
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 79+67+94+64 and chain B
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 34+92+81+94 and chain B
color yelloworange, yelloworange_residues
select red_residues, resi 39+86+99+97+62 and chain B
color red, red_residues


set_view (\
     0.071706839,    0.642444849,    0.762969613,\
     0.310044825,    0.712686896,   -0.629245043,\
    -0.948013544,    0.281676114,   -0.148082256,\
     0.000017121,    0.000000924, -147.589385986,\
    -8.951572418,  -16.502914429,   51.311729431,\
    97.618782043,  197.559982300,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/3NH7_B.png