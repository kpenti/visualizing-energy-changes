from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 1A2Y.pdb, model
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

select interface, resi 19+22+23+24+27+102+103+116+117+118+119+120+121+13+18+19+22+24+25+119+121+124+125+126+128+129 and chain C
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 129+18+19+23+50+116+24+118+120+52+119+54 and chain C
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 32+124+50+54+50+101+32+32+125+52+101 and chain C
color yelloworange, yelloworange_residues
select red_residues, resi 32+101+121+100+32+92+92+92+100+92+92+101 and chain C
color red, red_residues


set_view (\
    -0.488173604,    0.840480089,   -0.235117152,\
     0.688672662,    0.536456347,    0.487795413,\
     0.536112785,    0.076210745,   -0.840699434,\
    -0.000012346,    0.000043049, -132.450119019,\
    47.334705353,  -10.944742203,   -3.263749599,\
    94.807952881,  170.092163086,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/1A2Y_C.png