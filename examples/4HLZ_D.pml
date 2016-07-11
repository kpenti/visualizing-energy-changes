from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 4HLZ.pdb, model
create antigen_chain, chain D
create antibody_chains, chain G+L
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

select interface, resi  and chain D
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 102+102+41 and chain D
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 42+49+57+55 and chain D
color yelloworange, yelloworange_residues
select red_residues, resi 45+52+53+54+99 and chain D
color red, red_residues


set_view (\
     0.706002951,   -0.645321488,    0.291751921,\
     0.078760661,   -0.337858498,   -0.937895596,\
     0.703815758,    0.685136020,   -0.187703446,\
    -0.000013888,    0.000016913, -238.992340088,\
    -1.640446782,   52.170742035,  -25.038921356,\
   145.214553833,  332.771148682,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/4HLZ_D.png