* Encoding: UTF-8.

RELIABILITY
  /VARIABLES=game_frequency game_time
  /SCALE('gaming intensity') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=game_cheating_1 game_cheating_2 game_cheating_3 game_cheating_4 game_cheating_5 
    game_cheating_6 game_cheating_7 game_cheating_8 game_cheating_9
  /SCALE('gaming cheating') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=moral_disengagement_1 moral_disengagement_2 moral_disengagement_3 
    moral_disengagement_4 moral_disengagement_5 moral_disengagement_6
  /SCALE('moral disengagement') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=unethical_decision_making_1 unethical_decision_making_2 unethical_decision_making_3 
    unethical_decision_making_4 unethical_decision_making_5 unethical_decision_making_6 
    unethical_decision_making_7
  /SCALE('unethical decision-making') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=peer_cheating_1 peer_cheating_2 peer_cheating_3
  /SCALE('peer cheating') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=cynicism_1 cynicism_2 cynicism_3 cynicism_4 cynicism_5
  /SCALE('cynicism') ALL
  /MODEL=ALPHA.


RELIABILITY
  /VARIABLES=parental_mediation_1 parental_mediation_2 parental_mediation_3 parental_mediation_4
  /SCALE('parental mediation') ALL
  /MODEL=ALPHA.

FREQUENCIES VARIABLES=gender grade major
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=age
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=game_frequency game_cheating
  /STATISTICS=MEAN STDDEV MIN MAX.

FREQUENCIES VARIABLES=game_frequency game_cheating peer_cheating
  /ORDER=ANALYSIS.

CORRELATIONS
  /VARIABLES=game_intensity game_cheating moral_disengagement unethical_decision_making 
    peer_cheating
  /PRINT=TWOTAIL NOSIG
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

* Please modify the path according to the location of "process.sps"(which you get on downloading PROCESS) on your own computer, or it might not work.
INSERT file="/Users/apple/Desktop/Gaming_paper_HJ/process.sps".
process y=unethical_decision_making
    /x=game_intensity
    /m=game_cheating moral_disengagement
    /w=peer_cheating
    /cov=gender age cynicism parent_mediation
    /plot=1
    /decimals=F10.4
    /jn=1
    /moments=1
    /boot=5000
    /conf=95
    /model=84.
