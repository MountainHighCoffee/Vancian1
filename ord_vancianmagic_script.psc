;/ Decompiled by Champollion V1.0.1
Source   : ORD_VancianMagic_Script.psc
Modified : 2016-06-22 11:24:48
Compiled : 2016-06-22 11:24:49
User     : Maximilian
Computer : MARUNAE
/;
scriptName ORD_VancianMagic_Script extends activemagiceffect

;-- Properties --------------------------------------
quest property RelationshipMarriageFIN auto
message property ORD_Alt_VancianMagic_Message_HalfFail auto
globalvariable property ORD_Alt_VancianMagic_Global_Count_7thCircinate auto
message property ORD_Alt_VancianMagic_Message_Full auto
globalvariable property ORD_Alt_VancianMagic_Global_Count_Max auto
globalvariable property ORD_Alt_VancianMagic_Global_Count_DefineMaxBase auto
companionshousekeepingscript property CHScript auto
message property ORD_Alt_VancianMagic_Message_Half auto
perk property ORD_Alt40_VancianMagic_Perk_70 auto
Float property ORD_CircinateMult auto
globalvariable property ORD_Alt_VancianMagic_Global_Count auto
keyword property LocTypePlayerHouse auto
keyword property LocTypeInn auto
Float property ORD_HalfMult auto
actor property PlayerRef auto
referencealias property LoveInterest auto
globalvariable property ORD_Alt_VancianMagic_Global_Count_DefineMaxQuadraticWizard auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnEffectStart(actor akTarget, actor akCaster)

	ORD_Alt_VancianMagic_Global_Count.SetValue(ORD_Alt_VancianMagic_Global_Count_DefineMaxBase.GetValue())
	self.RegisterForSleep()
endFunction

; Skipped compiler generated GetState

function OnSleepStop(Bool abInterrupted)

	Float NewMax
	if PlayerRef.HasPerk(ORD_Alt40_VancianMagic_Perk_70)
		NewMax = ORD_Alt_VancianMagic_Global_Count_DefineMaxBase.GetValue() + PlayerRef.GetLevel() as Float * ORD_Alt_VancianMagic_Global_Count_DefineMaxQuadraticWizard.GetValue()
	else
		NewMax = ORD_Alt_VancianMagic_Global_Count_DefineMaxBase.GetValue()
	endIf
	ORD_Alt_VancianMagic_Global_Count_Max.SetValue(NewMax)
	ORD_Alt_VancianMagic_Global_Count_7thCircinate.SetValue(NewMax * ORD_CircinateMult)
	if RelationshipMarriageFIN.IsRunning() && RelationshipMarriageFIN.GetStage() >= 10 && PlayerRef.GetCurrentLocation() == LoveInterest.GetActorRef().GetCurrentLocation() || PlayerRef.GetCurrentLocation().HasKeyword(LocTypeInn) || PlayerRef.GetCurrentLocation().HasKeyword(LocTypePlayerHouse)
		ORD_Alt_VancianMagic_Global_Count.SetValue(NewMax)
		ORD_Alt_VancianMagic_Message_Full.Show(NewMax, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	elseIf ORD_Alt_VancianMagic_Global_Count.GetValue() >= NewMax * ORD_HalfMult
		ORD_Alt_VancianMagic_Message_HalfFail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	else
		ORD_Alt_VancianMagic_Global_Count.SetValue(NewMax * ORD_HalfMult)
		ORD_Alt_VancianMagic_Message_Half.Show(NewMax * ORD_HalfMult, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	endIf
endFunction
