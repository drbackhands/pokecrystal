	object_const_def
	const FIERY_CAVE_MOLTRES
	
FieryCave_MapScripts:
	def_scene_scripts

	def_callbacks
	
ShinyMoltres:
	opentext
	writetext MoltresCryText
	cry MOLTRES
	pause 50
	closetext
	loadwildmon MOLTRES, 50, CHARCOLE
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCESHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear FIERY_CAVE_MOLTRES
.NotBeaten:
	reloadmapafterbattle
	opentext
	writetext MoltresFledText
	closetext
	setscene 0 ; Not sure if needed
	end
	
MoltresCryText:
	text "MOLTRES: Kraaww!"
	done
	
MoltresFledText:
	text "MOLTRES flew away"
	line "..."
	done
	
FieryCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, VICTORY_ROAD, 11
	warp_event  4,  7, VICTORY_ROAD, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ShinyMoltres, EVENT_SHINY_MOLTRES
