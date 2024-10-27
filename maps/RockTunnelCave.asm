	object_const_def
	const ROCK_TUNNEL_CAVE_YELLOW_SAGE
	const ROCK_TUNNEL_CAVE_ZAPDOS
	
RockTunnelCave_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RockTunnelCaveYellowSageCallback

RockTunnelCaveYellowSageCallback:
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .NoAppear
	checkflag ENGINE_BATTLED_YELLOW_SAGE
	iftrue .NoAppear
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .Appear
.NoAppear:
	disappear ROCK_TUNNEL_CAVE_YELLOW_SAGE
	endcallback

.Appear:
	appear ROCK_TUNNEL_CAVE_YELLOW_SAGE
	endcallback
	
YellowSageBattle:
	faceplayer
	opentext
	writetext YellowSageSeenText
	waitbutton
	closetext
	winlosstext YellowSageWinText, YellowSageLossText
	loadtrainer YELLOW_SAGE, YELLOW_SAGE1
	startbattle
	reloadmapafterbattle
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear ROCK_TUNNEL_CAVE_YELLOW_SAGE
	pause 30
	setflag ENGINE_BATTLED_YELLOW_SAGE
	special FadeInFromBlack
	end
	
ShinyZapdos:
	opentext
	writetext ZapdosCryText
	pause 15
	cry ZAPDOS
	closetext
	setevent EVENT_FOUGHT_ZAPDOS
	loadwildmon ZAPDOS, 5, MAGNET
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCESHINY
	startbattle
	disappear ROCK_TUNNEL_CAVE_ZAPDOS
	reloadmapafterbattle
	opentext
	writetext ZapdosFledText
	closetext
	setscene 0 ;
	end
	
YellowSageSeenText:
	text "..."
	done

YellowSageWinText:
	text "...!"
	done
	
YellowSageLossText:
	text "..."
	done
	
ZapdosCryText:
	text "ZAPDOS: Bzzzt!"
	done
	
ZapdosFledText:
	text "ZAPDOS flew away"
	line "..."
	done
	
RockTunnelCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  5, ROCK_TUNNEL_B1F, 5
	warp_event  5,  5, ROCK_TUNNEL_B1F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event 5, 2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, YellowSageBattle, EVENT_YELLOW_SAGE
	object_event  4,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, ShinyZapdos, EVENT_SHINY_ZAPDOS
