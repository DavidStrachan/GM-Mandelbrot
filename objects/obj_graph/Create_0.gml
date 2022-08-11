
// How big to draw
draw_width = 800
draw_height = 600

// Where to draw
draw_left = 0 
draw_right = draw_left + draw_width
draw_top = 0 
draw_bottom = draw_top + draw_height

// Starting values that the graph goes to/from
val_left = -3.5
val_right = 2.5
val_top = -2.5
val_bottom = 2.5

// Setting this to false will reprocess the image
processed = false

// We will draw the image onto this so it doesnt have to be done every frame 
the_surface = surface_create(draw_width,draw_height)

// Used to zoom in, These will be the new ranges for the graph
new_val_left = 0 
new_val_right = 0 
new_val_top = 0 
new_val_bottom = 0 

left_picked = false // should we draw the box at the bottom?

// This is used to draw the rectangle that we will zoom into. 
new_draw_left = 0 
new_draw_right = 0 
new_draw_top = 0 
new_draw_bottom = 0 

// Draw some debug values to the screen 
draw_debug_x = draw_width + 150
draw_debug_y = draw_height/2

colour_1_r = 89
colour_1_g = 115
colour_1_b = 114

colour_2_r = 218
colour_2_g = 209
colour_2_b = 194
