from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 1FBI.pdb, model
create antigen_chain, chain Y
create antibody_chains, chain P+Q
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

select interface, resi 14+15+16+19+20+21+22+62+63+73+75+76+77+78+89+90+93+94+96+97+100+101+102+61+62+71+72+73+74+75+77+97 and chain Y
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 93+77+14+100 and chain Y
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 63+15+101+21 and chain Y
color yelloworange, yelloworange_residues
select red_residues, resi 97+96+20+73 and chain Y
color red, red_residues


set_view (\
     0.572700083,    0.657366514,   -0.489779443,\
     0.248528108,    0.430114627,    0.867891133,\
     0.781183898,   -0.618764818,    0.082952768,\
     0.000016049,   -0.000051349, -175.907073975,\
    50.428852081,  126.919418335,   16.688699722,\
   128.605178833,  223.208541870,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/1FBI _Y.png