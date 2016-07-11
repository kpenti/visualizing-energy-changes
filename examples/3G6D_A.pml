from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 3G6D.pdb, model
create antigen_chain, chain A
create antibody_chains, chain L+H
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

select interface, resi 18+19+21+22+23+24+25+97+100+101+104+105+108+4+5+6+11+14+15+18+104+107+108+109 and chain A
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 98+97+16+104+108+15+19 and chain A
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 23+105+101+94+107+102 and chain A
color yelloworange, yelloworange_residues
select red_residues, resi 22+91+8+18+109+11+12+25 and chain A
color red, red_residues


set_view (\
     0.067887977,   -0.800133348,    0.595967174,\
     0.749174178,    0.435375333,    0.499185413,\
    -0.658885717,    0.412594795,    0.628996015,\
     0.000000000,    0.000000000, -149.399566650,\
     2.782648087,  -28.987081528,  -62.892646790,\
   121.737060547,  177.062072754,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/3G6D_A.png