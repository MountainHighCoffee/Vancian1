;/ Decompiled by Champollion V1.0.1
Source   : ORD_NewVancianMagic_Script.psc
Modified : 2017-02-01 03:47:48
Compiled : 2017-02-01 03:47:49
User     : Maximilian
Computer : MARUNAE
/;
scriptName ORD_NewVancianMagic_Script extends activemagiceffect

;-- Properties --------------------------------------
globalvariable property ORD_Alt_NewVancianMagic_Global_Count_Max_PointsOfMana auto
globalvariable property ORD_Alt_NewVancianMagic_Global_DungeonMaster_Double auto
message property ORD_Alt_NewVancianMagic_Message_DungeonMaster_Study auto
globalvariable property ORD_Alt_NewVancianMagic_Global_DungeonMaster_SideEffects auto
message property ORD_Alt_NewVancianMagic_Message_Recharged auto
globalvariable property ORD_Alt_NewVancianMagic_Global_Count_Max_Base auto
perk property ORD_StudyPerk auto
objectreference property ORD_Anchor auto
formlist property ORD_Alt_VancianMagic_FormList_LocationWhitelist auto
globalvariable property ORD_Alt_NewVancianMagic_Global_DungeonMaster_Half auto
keyword property LocTypeInn auto
sound property UISkillIncrease auto
perk property ORD_ScalingPerk auto
message property ORD_Alt_NewVancianMagic_Message_DungeonMaster_SideEffects auto
globalvariable property ORD_Alt_NewVancianMagic_Global_Count_Max auto
keyword property LocTypePlayerHouse auto
globalvariable property ORD_Alt_NewVancianMagic_Global_DungeonMaster_Study auto
actor property PlayerRef auto
globalvariable property ORD_Alt_NewVancianMagic_Global_Count auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnRaceSwitchComplete()

	utility.Wait(1.00000)
	self.RegisterForSleep()
endFunction

function OnSleepStop(Bool abInterrupted)

	location PlayerLocation = PlayerRef.GetCurrentLocation()
	if !abInterrupted && (PlayerLocation.HasKeyword(LocTypeInn) || PlayerLocation.HasKeyword(LocTypePlayerHouse) || ORD_Alt_VancianMagic_FormList_LocationWhitelist.Find(PlayerLocation as form) >= 0 || PlayerRef.GetDistance(ORD_Anchor) <= 5333 as Float)
		if PlayerRef.HasPerk(ORD_StudyPerk)
			ORD_Alt_NewVancianMagic_Global_DungeonMaster_Study.SetValue((ORD_Alt_NewVancianMagic_Message_DungeonMaster_Study.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000) - 1) as Float)
			ORD_Alt_NewVancianMagic_Global_DungeonMaster_SideEffects.SetValue(ORD_Alt_NewVancianMagic_Message_DungeonMaster_SideEffects.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000) as Float)
		endIf
		Int MaxSlots = ORD_Alt_NewVancianMagic_Global_Count_Max_Base.GetValue() as Int
		if PlayerRef.HasPerk(ORD_ScalingPerk)
			MaxSlots += math.Floor(PlayerRef.GetBaseActorValue("Magicka") / (ORD_Alt_NewVancianMagic_Global_Count_Max_PointsOfMana.GetValue() as Int) as Float)
		endIf
		if ORD_Alt_NewVancianMagic_Global_DungeonMaster_Study.GetValue() == 1 as Float
			MaxSlots = math.Floor(MaxSlots as Float * ORD_Alt_NewVancianMagic_Global_DungeonMaster_Half.GetValue())
		elseIf ORD_Alt_NewVancianMagic_Global_DungeonMaster_Study.GetValue() == -1 as Float
			MaxSlots = math.Floor(MaxSlots as Float * ORD_Alt_NewVancianMagic_Global_DungeonMaster_Double.GetValue())
		endIf
		ORD_Alt_NewVancianMagic_Global_Count.SetValue(MaxSlots as Float)
		ORD_Alt_NewVancianMagic_Global_Count_Max.SetValue(MaxSlots as Float)
		ORD_Alt_NewVancianMagic_Message_Recharged.Show(MaxSlots as Float, MaxSlots as Float, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		UISkillIncrease.Play(PlayerRef as objectreference)
	endIf
endFunction

function OnEffectStart(actor akTarget, actor akCaster)

	self.RegisterForSleep()
endFunction

; Skipped compiler generated GotoState
