from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 4MWF.pdb, model
create antigen_chain, chain C
create antibody_chains, chain A+B+H+L
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

select interface, resi 422+425+427+428+429+430+431+432+433+436+438+439+441+442+443+444+446+529+531+613+578+579+604+605+606+607+623+625+626+627+628+629+630+639+644+645+430+431+433+446+623 and chain C
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 530+535+544+547+424+525+545+523+488+529+527+533+534 and chain C
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 487+540+417+484+420+423+412+421+483+489+419 and chain C
color yelloworange, yelloworange_residues
select red_residues, resi 413+422+549+485+543+526+532+538+415+416+550+491+418+414 and chain C
color red, red_residues


set_view (\
     0.612119615,    0.278969496,    0.739922523,\
     0.180376142,    0.861778021,   -0.474132985,\
    -0.769917548,    0.423691005,    0.477191925,\
     0.000001103,    0.000014707, -232.520675659,\
    43.117050171,  -17.476749420,   34.340785980,\
   183.321136475,  281.720367432,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/4MWF_C.png