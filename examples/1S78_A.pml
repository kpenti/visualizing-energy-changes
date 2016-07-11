from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 1S78.pdb, model
create antigen_chain, chain A
create antibody_chains, chain D+E
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

select interface, resi 128+156+235+236+244+245+246+248+249+252+254+255+257+268+270+284+285+286+287+288+290+292+294+295+296+297+311 and chain A
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 290+268+315+257+311+295 and chain A
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 286+245+288+296+296+295 and chain A
color yelloworange, yelloworange_residues
select red_residues, resi 311+286+245+288+295+295 and chain A
color red, red_residues


set_view (\
    -0.869695961,    0.153100997,   -0.469243735,\
    -0.001194947,    0.950021982,    0.312180310,\
     0.493586838,    0.272062659,   -0.826046944,\
    -0.000056654,   -0.000032425, -234.733154297,\
    62.243530273,   82.319175720,  197.183807373,\
   148.293472290,  321.171997070,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/1S78_A.png