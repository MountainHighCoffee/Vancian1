;/ Decompiled by Champollion V1.0.1
Source   : WB_NewVancianMagicPersistent_Script.psc
Modified : 2016-12-29 18:54:17
Compiled : 2016-12-29 18:54:18
User     : Maximilian
Computer : MARUNAE
/;
scriptName WB_NewVancianMagicPersistent_Script extends activemagiceffect

;-- Properties --------------------------------------
globalvariable property ORD_Alt_NewVancianMagic_Global_Count auto
globalvariable property ORD_Alt_NewVancianMagic_Global_Count_Max auto
globalvariable property ORD_Alt_NewVancianMagic_Global_Count_Max_Base auto
perk property ORD_ScalingPerk auto
globalvariable property ORD_Alt_NewVancianMagic_Global_Count_Max_PointsOfMana auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnEffectStart(Actor akTarget, Actor akCaster)

	Int MaxSlots = ORD_Alt_NewVancianMagic_Global_Count_Max_Base.GetValue() as Int
	if akTarget.HasPerk(ORD_ScalingPerk)
		MaxSlots += math.Floor(akTarget.GetBaseActorValue("Magicka") / (ORD_Alt_NewVancianMagic_Global_Count_Max_PointsOfMana.GetValue() as Int) as Float)
	endIf
	ORD_Alt_NewVancianMagic_Global_Count.SetValue(MaxSlots as Float)
	ORD_Alt_NewVancianMagic_Global_Count_Max.SetValue(MaxSlots as Float)
endFunction

; Skipped compiler generated GotoState
