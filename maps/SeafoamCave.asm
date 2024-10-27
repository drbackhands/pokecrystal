	object_const_def
	const SEAFOAM_CAVE_ARTICUNO
	
SeafoamCave_MapScripts:
	def_scene_scripts

	def_callbacks
	
ShinyArticuno:
	opentext
	writetext ArticunoCryText
	cry ARTICUNO
	pause 50
	closetext
	loadwildmon ARTICUNO, 50, NEVERMELTICE
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCESHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear SEAFOAM_CAVE_ARTICUNO
.NotBeaten:
	reloadmapafterbattle
	opentext
	writetext ArticunoFledText
	closetext
	setscene 0 ; Not sure if needed
	end
	
ArticunoCryText:
	text "ARTICUNO: Koooo!"
	done
	
ArticunoFledText:
	text "ARTICUNO flew away"
	line "..."
	done
	
SeafoamCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  5, ROUTE_20, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ShinyArticuno, EVENT_SHINY_ARTICUNO
