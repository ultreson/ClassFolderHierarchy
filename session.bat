@echo off
setlocal enabledelayedexpansion
echo veuillez executer ce fichier dans le dossier parent de la hierarchie de fichiers
pause
SET /P session=Nom de la session?
SET /P nbcours=Combien de cours?
md "%session%"
cd "%session%"
FOR /L %%G IN (1,1,%nbcours%) DO (
	SET /P nomcours=Nom du cours %%G?
	@echo !nomcours!
	SET /P nbjours=Combien de jours?
	md "!nomcours!"
	cd "!nomcours!"
	FOR /L %%H IN (1,1,15) DO (
		SET numSemaine=%%H
		IF 1%%H LSS 100 SET numSemaine=0%%H
		md "semaine !numSemaine!"
		cd "semaine !numSemaine!"
		set VAR=set
::		IF "!nbjours!" NEQU "1" (
		FOR /L %%I IN (1,1,!nbjours!) DO (
			if "%%H"=="1" (
				set /P nomjours%%I=Nom du jour %%I?
			)
			md "!nomjours%%I!"
		)
	  ::)
		cd ..
	)
	tree
	@echo cours "!nomcours!" fait
	cd..
	pause
)
@echo dossiers faits, quitter?
pause
exit