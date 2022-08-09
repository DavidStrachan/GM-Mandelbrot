
/* usage:
t.test

// change language with: 
load_language("eng")

If you enter a language that cant be found it will return the strings (this can be quite helpful) 
*/

/*

function load_language(_loading_this_language) {
	#region load from file 
	localisation_csv = load_csv("localisation.csv")
	temp_all_text = ds_map_create() // put everything in here first and then into the struct

	var number_of_text_messages = ds_grid_height(localisation_csv)
	var column_of_language = 0
	global.current_language = _loading_this_language

	// find the language you want 
	for (var i = global.local_unused_columns; i < global.local_count+global.local_unused_columns; ++i) {
	    if (localisation_csv[# i,0] == _loading_this_language or 
			localisation_csv[# i,1] == _loading_this_language) {
			log("Language loaded: " +string(_loading_this_language))
			column_of_language = i
			break;
		}
	}

	if (column_of_language == 0) {
		log("ERROR: When loading language couldnt find what one to load")
	}

	// every bit of text
	for (var i = 1; i < number_of_text_messages; ++i) {
		ds_map_add(temp_all_text,localisation_csv[# 0,i],localisation_csv[# column_of_language,i])
	}
	#endregion

	global.local_text = { 

		test					: temp_all_text[? "test"],
	
		// PLAY
		play_pause				: temp_all_text[? "play_pause"],
	
		// MAIN MENU
		mainmenu_title			: temp_all_text[? "mainmenu_title"],
		mainmenu_play			: temp_all_text[? "mainmenu_play"],
	};


	// tidy up this temp stuff for loading
	ds_grid_destroy(localisation_csv)
	ds_map_destroy(temp_all_text)
}
	
global.local_list = []
global.local_count = 0
global.current_language = ""
global.local_unused_columns = 2 // how many columns to ignore because they are for descriptions etc

#region find data about languages and load initial one
localisation_csv = load_csv("localisation.csv")

// error if file not found 
if (localisation_csv == -1) {
	show_error("Cant load a language file",true)
}
global.local_count = ds_grid_width(localisation_csv)-global.local_unused_columns

// find the language you want 
for (var i = global.local_unused_columns; i < global.local_count+global.local_unused_columns; ++i) {
	global.local_list[i-global.local_unused_columns] = localisation_csv[# i,0]
}

ds_grid_destroy(localisation_csv)
#endregion

load_language(global.local_list[irandom(global.local_count-1)]) 
//load_language(global.local_list[irandom(global.local_count)]) // this will return one too many but gives you the chance to get the first column which shows the string needed to get the text

#macro t global.local_text