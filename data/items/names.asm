; PureRGBnote: names here were converted to a jump table to reduce execution time in getting an item name
; the downside is it takes up extra space
ItemNameJumpTable::
	table_width 2
	dw MASTERBALLName
	dw ULTRABALLName
	dw GREATBALLName
	dw POKEBALLName
	dw HYPERBALLName
	dw BICYCLEName
	dw SURFBOARDName
	dw SAFARIBALLName
	dw POKEDEXName
	dw MOONSTONEName
	dw ANTIDOTEName
	dw BURNHEALName
	dw ICEHEALName
	dw AWAKENINGName
	dw PARLYZHEALName
	dw FULLRESTOREName
	dw MAXPOTIONName
	dw HYPERPOTIONName
	dw SUPERPOTIONName
	dw POTIONName
	dw BAITName
	dw ROCKName
	dw OLDCOINName
	dw TOPSECRETKEYName
	dw CAMERAName
	dw UNUSED4Name
	dw UNUSED5Name
	dw UNUSED6Name
	dw ESCAPEROPEName
	dw REPELName
	dw OLDAMBERName
	dw FIRESTONEName
	dw THUNDERSTONEName
	dw WATERSTONEName
	dw HPUPName
	dw PROTEINName
	dw IRONName
	dw CARBOSName
	dw CALCIUMName
	dw RARECANDYName
	dw DOMEFOSSILName
	dw HELIXFOSSILName
	dw SECRETKEYName
	dw POCKETABRAName
	dw BIKEVOUCHERName
	dw XACCURACYName
	dw LEAFSTONEName
	dw CARDKEYName
	dw NUGGETName
	dw APEXCHIPName
	dw POKEDOLLName
	dw FULLHEALName
	dw REVIVEName
	dw MAXREVIVEName
	dw GUARDSPECName
	dw SUPERREPELName
	dw MAXREPELName
	dw DIREHITName
	dw COINName
	dw FRESHWATERName
	dw SODAPOPName
	dw LEMONADEName
	dw SSTICKETName
	dw GOLDTEETHName
	dw XATTACKName
	dw XDEFENDName
	dw XSPEEDName
	dw XSPECIALName
	dw LOSTWALLETName
	dw OAKSPARCELName
	dw ITEMFINDERName
	dw SILPHSCOPEName
	dw POKEFLUTEName
	dw LIFTKEYName
	dw BOOSTERCHIPName
	dw OLDRODName
	dw GOODRODName
	dw SUPERRODName
	dw PPUPName
	dw ETHERName
	dw MAXETHERName
	dw ELIXERName
	dw MAXELIXERName
	assert_table_length NUM_ITEMS

MASTERBALLName:
	db "Master Ball@"
ULTRABALLName:
	db "Ultra Ball@"
GREATBALLName:
	db "Great Ball@"
POKEBALLName:
	db "<poke> Ball@"
HYPERBALLName:
	db "Hyper Ball@"
BICYCLEName:
	db "Bicycle@"
SURFBOARDName:
	db "?????@" ; SURFBOARD
SAFARIBALLName:
	db "Safari Ball@"
POKEDEXName:
	db "<poke>dex@"
MOONSTONEName:
	db "Moon Stone@"
ANTIDOTEName:
	db "Antidote@"
BURNHEALName:
	db "Burn Heal@"
ICEHEALName:
	db "Ice Heal@"
AWAKENINGName:
	db "Awakening@"
PARLYZHEALName:
	db "Parlyz Heal@"
FULLRESTOREName:
	db "Full Restore@"
MAXPOTIONName:
	db "Max Potion@"
HYPERPOTIONName:
	db "Hyper Potion@"
SUPERPOTIONName:
	db "Super Potion@"
POTIONName:
	db "Potion@"
BAITName:
	db "Bait@"
ROCKName:
	db "Rock@"
OLDCOINName:
	db "Old Coin@"
TOPSECRETKEYName:
	db "TopSecretKey@"
CAMERAName:
	db "Camera@"
UNUSED4Name:
	db "Unused4@"
UNUSED5Name:
	db "Unused5@"
UNUSED6Name:
	db "Unused6@"
ESCAPEROPEName:
	db "Escape Rope@"
REPELName:
	db "Repel@"
OLDAMBERName:
	db "Old Amber@"
FIRESTONEName:
	db "Fire Stone@"
THUNDERSTONEName:
	db "ThunderStone@"
WATERSTONEName:
	db "Water Stone@"
HPUPName:
	db "HP Up@"
PROTEINName:
	db "Protein@"
IRONName:
	db "Iron@"
CARBOSName:
	db "Carbos@"
CALCIUMName:
	db "Calcium@"
RARECANDYName:
	db "Rare Candy@"
DOMEFOSSILName:
	db "Dome Fossil@"
HELIXFOSSILName:
	db "Helix Fossil@"
SECRETKEYName:
	db "Secret Key@"
POCKETABRAName:
	db "Pocket Abra@"
BIKEVOUCHERName:
	db "Bike Voucher@"
XACCURACYName:
	db "X Accuracy@"
LEAFSTONEName:
	db "Leaf Stone@"
CARDKEYName:
	db "Card Key@"
NUGGETName:
	db "Nugget@"
APEXCHIPName:
	db "Apex Chip@"
POKEDOLLName:
	db "<poke> Doll@"
FULLHEALName:
	db "Full Heal@"
REVIVEName:
	db "Revive@"
MAXREVIVEName:
	db "Max Revive@"
GUARDSPECName:
	db "Guard Spec.@"
SUPERREPELName:
	db "Super Repel@"
MAXREPELName:
	db "Max Repel@"
DIREHITName:
	db "Dire Hit@"
COINName:
	db "Coin@"
FRESHWATERName:
	db "Fresh Water@"
SODAPOPName:
	db "Soda Pop@"
LEMONADEName:
	db "Lemonade@"
SSTICKETName:
	db "S.S. Ticket@"
GOLDTEETHName:
	db "Gold Teeth@"
XATTACKName:
	db "X Attack@"
XDEFENDName:
	db "X Defend@"
XSPEEDName:
	db "X Speed@"
XSPECIALName:
	db "X Special@"
LOSTWALLETName:
	db "Lost Wallet@"
OAKSPARCELName:
	db "Oak's Parcel@"
ITEMFINDERName:
	db "Itemfinder@"
SILPHSCOPEName:
	db "Silph Scope@"
POKEFLUTEName:
	db "<poke> Flute@"
LIFTKEYName:
	db "Lift Key@"
BOOSTERCHIPName:
	db "Booster Chip@"
OLDRODName:
	db "Old Rod@"
GOODRODName:
	db "Good Rod@"
SUPERRODName:
	db "Super Rod@"
PPUPName:
	db "PP Up@"
ETHERName:
	db "Ether@"
MAXETHERName:
	db "Max Ether@"
ELIXERName:
	db "Elixer@"
MAXELIXERName:
	db "Max Elixer@"
