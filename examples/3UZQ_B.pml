from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 3UZQ.pdb, model
create antigen_chain, chain B
create antibody_chains, chain A
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

select interface, resi 305+306+307+308+309+310+311+312+323+325+327+329+360+361+362+363+364+385+387+388+389+390+391 and chain B
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 313+390+388+314+386 and chain B
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 311+387+309+391 and chain B
color yelloworange, yelloworange_residues
select red_residues, resi 312+389+308+307+310 and chain B
color red, red_residues


set_view (\
     0.990245521,   -0.047041822,   -0.131146520,\
     0.022968184,    0.983515084,   -0.179357827,\
     0.137422025,    0.174595997,    0.975002885,\
     0.000000000,    0.000000000, -122.211364746,\
    35.694889069,   20.922418594,  -25.666185379,\
    96.165473938,  148.257247925,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/3UZQ_B.png