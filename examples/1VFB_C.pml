from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 1VFB.pdb, model
create antigen_chain, chain C
create antibody_chains, chain A+B
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

select interface, resi 19+21+22+23+24+27+102+103+116+117+118+119+120+121+13+18+19+22+24+25+26+119+121+124+125+126+127+129 and chain C
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 22+117+121+24 and chain C
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 18+19+124 and chain C
color yelloworange, yelloworange_residues
select red_residues, resi 13+113+125+129 and chain C
color red, red_residues


set_view (\
    -0.494773775,    0.749962389,   -0.439039320,\
     0.529778719,    0.660778761,    0.531702280,\
     0.688864827,    0.030477846,   -0.724249780,\
    -0.000016361,   -0.000009358, -170.621490479,\
    51.530056000,  -14.174253464,    5.137617111,\
   126.938346863,  214.306030273,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/1VFB_C.png