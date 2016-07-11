from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 1BJ1.pdb, model
create antigen_chain, chain W
create antibody_chains, chain H
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

select interface, resi 45+48+79+80+81+82+83+84+85+86+87+88+89+90+91+92+93+94 and chain W
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 100+52+53+51+56+54+93+92+63+55+25+55+27+28+60+64+65+24+28+30+102 and chain W
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 29+50+97+61+62+26+30+94+57+31+56+100+32+101+59+33+26+100+58+90+95+34+89 and chain W
color yelloworange, yelloworange_residues
select red_residues, resi 51+98+97+54+99+33+34+52+53+91+29+100+100+27+96+35+95+96+31+32+50+52+100+100 and chain W
color red, red_residues


set_view (\
    -0.305600941,   -0.941388309,   -0.142816648,\
     0.938997924,   -0.273115009,   -0.209023252,\
     0.157765552,   -0.197981343,    0.967424989,\
     0.000004670,    0.000005513, -127.701072693,\
    15.551010132,  -15.207269669,    8.987190247,\
    89.263313293,  166.134796143,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/1BJ1_W.png