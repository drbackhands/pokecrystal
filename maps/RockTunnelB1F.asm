	object_const_def
	const ROCKTUNNELB1F_POKE_BALL1
	const ROCKTUNNELB1F_POKE_BALL2
	const ROCKTUNNELB1F_POKE_BALL3
	const ROCKTUNNELB1F_YELLOW_SAGE

RockTunnelB1F_MapScripts:
	def_scene_scripts

	def_callbacks
RockTunnelB1FYellowSageCallback:
	checkflag EVENT_HAS_RAIKOU
	iffalse .Appear
	disappear ROCKTUNNELB1F_YELLOW_SAGE
	endcallback

.Appear:
	appear ROCKTUNNELB1F_YELLOW_SAGE
	endcallback
	
RockTunnelB1FIron:
	itemball IRON

RockTunnelB1FPPUp:
	itemball PP_UP

RockTunnelB1FRevive:
	itemball REVIVE

RockTunnelB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ROCK_TUNNEL_B1F_HIDDEN_MAX_POTION
	
YellowSageScript:
	faceplayer
	opentext
	writetext YellowSageText
	cry RAIKOU
	pause 15
	promptbutton
	setval RAIKOU
	special MonCheck
	iffalse .NoRaikou
	setflag EVENT_HAS_RAIKOU
	pause 15
	writetext YellowSageSurpriseText
	cry ZAPDOS
	pause 15
	promptbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear ROCKTUNNELB1F_YELLOW_SAGE
	pause 30
	special FadeInFromBlack
	end
	
	
.NoRaikou
	closetext
	end
	
YellowSageText:
	text "..."
	done
	
YellowSageSurpriseText:
	text "...!"
	done

RockTunnelB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, ROCK_TUNNEL_1F, 6
	warp_event 17,  9, ROCK_TUNNEL_1F, 4
	warp_event 23,  3, ROCK_TUNNEL_1F, 3
	warp_event 25, 23, ROCK_TUNNEL_1F, 5
	warp_event  7,  1, ROCK_TUNNEL_CAVE, 1
	

	def_coord_events

	def_bg_events
	bg_event  4, 14, BGEVENT_ITEM, RockTunnelB1FHiddenMaxPotion

	def_object_events
	object_event  7, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FIron, EVENT_ROCK_TUNNEL_B1F_IRON
	object_event  6, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FPPUp, EVENT_ROCK_TUNNEL_B1F_PP_UP
	object_event 15,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FRevive, EVENT_ROCK_TUNNEL_B1F_REVIVE
	object_event  7,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, YellowSageScript, EVENT_YELLOW_SAGE_OUTSIDE
