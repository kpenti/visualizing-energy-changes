from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 4GAG.pdb, model
create antigen_chain, chain P
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

select interface, resi 412+413+414+415+416+417+418+420+413+415+417+418+419+420+421+422 and chain P
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 420+418+413+415+652+614+611+421+654+434+410+431+435+617+414+424+440+436+416+422+618+426+651 and chain P
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 539+444+619+419+443+540+423+428+441+655+412+613+430+438+615+649+612+417+442+437 and chain P
color yelloworange, yelloworange_residues
select red_residues, resi 1411+443+537+439+432+446+527+528+531+445+526+616+650+530+425+535+529+427+536+653+532+534+533+538+429 and chain P
color red, red_residues


set_view (\
     1.000000000,    0.000000000,    0.000000000,\
     0.000000000,    1.000000000,    0.000000000,\
     0.000000000,    0.000000000,    1.000000000,\
    -0.000000089,    0.000000387, -138.665344238,\
    -2.997231722,  -30.773963928,   21.936584473,\
    32.533866882,  244.796875000,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/4GAG_P.png