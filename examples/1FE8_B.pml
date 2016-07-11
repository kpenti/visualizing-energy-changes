from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 1FE8.pdb, model
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

select interface, resi 960+961+962+963+965+966+982+983+984+985+986+987+1021+1022+1023+1024+1025+1026+1027+979+981+982+983+984+985+987+989+990+992+993+994+996+997 and chain B
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 975+977+979+981+997+1001+1020 and chain B
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 962+966+980+981+983+984+985+993+999+1006+1009+1021+1022+1027 and chain B
color yelloworange, yelloworange_residues
select red_residues, resi 974 and chain B
color red, red_residues


set_view (\
     0.569566071,   -0.195525855,   -0.798350990,\
    -0.071491286,    0.955828428,   -0.285097957,\
     0.818830490,    0.219457269,    0.530429184,\
     0.000001296,   -0.000000671, -156.541702271,\
     1.548091650,    4.610505104,  -12.507321358,\
   107.814308167,  205.269119263,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/1FE8_B.png