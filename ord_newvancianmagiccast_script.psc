;/ Decompiled by Champollion V1.0.1
Source   : ORD_NewVancianMagicCast_Script.psc
Modified : 2017-02-01 03:28:48
Compiled : 2017-02-01 03:28:49
User     : Maximilian
Computer : MARUNAE
/;
scriptName ORD_NewVancianMagicCast_Script extends activemagiceffect

;-- Properties --------------------------------------
message property ORD_Alt_NewVancianMagic_Message_AlmostDepleted auto
actor property PlayerRef auto
globalvariable property ORD_Alt_NewVancianMagic_Global_Count auto
message property ORD_Alt_NewVancianMagic_Message_Depleted auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnSpellCast(Form akSpell)

	if !akSpell as scroll && (PlayerRef.GetEquippedSpell(0) as Form == akSpell || PlayerRef.GetEquippedSpell(1) as Form == akSpell)
		ORD_Alt_NewVancianMagic_Global_Count.Mod(-1 as Float)
		Int SpellSlots = ORD_Alt_NewVancianMagic_Global_Count.GetValue() as Int
		if SpellSlots == 0
			ORD_Alt_NewVancianMagic_Message_Depleted.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			PlayerRef.InterruptCast()
		elseIf SpellSlots == 10
			ORD_Alt_NewVancianMagic_Message_AlmostDepleted.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	endIf
endFunction
