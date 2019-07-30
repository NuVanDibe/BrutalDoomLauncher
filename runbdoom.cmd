@ECHO off

rem  =====================================================
rem | Poking around, eh? Try option '0' at the main menu. |
rem |                                                     |
rem | Script created by Alex (alex@aforcedynamic.com)     |
rem | Version: 0604182214                                 |
rem  =====================================================

rem changelog: update bmod name to bd21testApr25.pk3

rem wads to add:

rem doom2f.wad: doom 2 french version
rem todo: third party, officially licensed iwads
rem heretic1.wad: heretic shareware
rem heretic.wad: heretic
rem hexen.wad: hexen demo OR commercial versions
rem hexdd.wad: hexen: deathkings of the dark citadel, requires hexen.wad
rem strife0.wad: strife: quest for the sigil demo
rem strife1.wad: strife commercial version OR veteran edition
rem voices.wad: voices for strife1.wad
rem chex.wad: chex quest
rem chex2.wad: chex quest 2

rem nonlicensed iwads:
rem chex3.wad: chex quest 3
rem wolfenstein 3d tc: https://www.afadoomer.com/wolf3d/default.php


IF EXIST game GOTO game

:nogame
ECHO.
ECHO  Error: 'game' subfolder not found. Create?
set choice=
set /p choice=Y/N: 
if not '%choice%'=='' set choice=%choice:~0,1%
if /I '%choice%'=='Y' (
MD game
IF EXIST game GOTO game
ECHO.
ECHO  Error: 'game' subfolder could not be created. Check file and folder permissions and then
ECHO         run this launcher again.
ECHO.
PAUSE
goto eof
) else (
ECHO.
ECHO    This launcher requires important DOOM game data to be copied into a subfolder called 'game'
ECHO    Please move this launcher to the directory where you would like your game data folder to
ECHO    reside, and run the launcher again.
ECHO.
PAUSE
ECHO.
GOTO eof
)

:game
cd game
rem Check if config file exists
IF NOT EXIST settings.cfg (
ECHO   Config file not found. Creating...
GOTO makeconfig
)
(
set /p bmod=
set /p brutal=
set /p mmod=
set /p metal=
set /p cmod=
set /p custom=
set /p d2wad=
set /p iwadname=
)<settings.cfg
rem Change how the launcher reports boolean values here. example: on/off, enabled/disabled, true/false
set onoption=ON
set offoption=OFF
IF NOT EXIST gzdoom.exe goto HELPME
goto start

:makeconfig

IF EXIST doom2.wad (SET d2wad=doom2.wad) else (IF EXIST plutonia.wad (SET d2wad=plutonia.wad) else (IF EXIST tnt.wad (SET d2wad=tnt.wad) else (IF EXIST freedoom2.wad (SET d2wad=freedoom2.wad) ELSE (set d2wad=.))))
rem If no config file exists, create with default settings

(
echo brutalv21.pk3
echo true
echo DoomMetalVol5.wad
echo true
echo .
echo false
echo %d2wad%
echo .
)>settings.cfg
ECHO.
IF NOT EXIST settings.cfg GOTO cantmake
(
set /p bmod=
set /p brutal=
set /p mmod=
set /p metal=
set /p cmod=
set /p custom=
set /p d2wad=
set /p iwadname=
)<settings.cfg
ECHO    Done.
ECHO.

GOTO game

:start
cls
ECHO         ________  _________   __    __   ________    _____    __
ECHO        ^|______  \ ^|______  \ ^|  ^|  ^|  ^| ^|__    __^|  /  _  \  ^|  ^|
ECHO        ^|        / ^|   __   / ^|  ^|  ^|  ^|    ^|  ^|    /  /_^|  ^| ^|  ^|
ECHO        ^|  ____  \ ^|  ^|  ^|  ^| ^|  \__/  ^|    ^|  ^|   /  /^|_   ^| ^|  ^|_____
ECHO        ^|________/ ^|__^|  ^|__^|  \______/     ^|__^|  /__/   ^|__^|  \_______^|
ECHO =================     ===============     ===============   ========  ========
ECHO \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
ECHO ^|^|. . ._____. . .^|^| ^|^|. . ._____. . .^|^| ^|^|. . ._____. . .^|^| ^|^| . . .\/ . . .^|^|
ECHO ^|^| . .^|^|   ^|^|. . ^|^| ^|^| . .^|^|   ^|^|. . ^|^| ^|^| . .^|^|   ^|^|. . ^|^| ^|^|. . . . . . . ^|^|
ECHO ^|^|. . ^|^|   ^|^| . .^|^| ^|^|. . ^|^|   ^|^| . .^|^| ^|^|. . ^|^|   ^|^| . .^|^| ^|^| . ^| . . . . .^|^|
ECHO ^|^| . .^|^|   ^|^|. _-^|^| ^|^|-_ .^|^|   ^|^|. . ^|^| ^|^| . .^|^|   ^|^|. _-^|^| ^|^|-_.^|\ . . . . ^|^|
ECHO ^|^|. . ^|^|   ^|^|-'  ^|^| ^|^|  `-^|^|   ^|^| . .^|^| ^|^|. . ^|^|   ^|^|-'  ^|^| ^|^|  `^|\_ . .^|. .^|^|
ECHO ^|^| . _^|^|   ^|^|    ^|^| ^|^|    ^|^|   ^|^|_ . ^|^| ^|^| . _^|^|   ^|^|    ^|^| ^|^|   ^|\ `-_/^| . ^|^|
ECHO ^|^|_-' ^|^|  .^|/    ^|^| ^|^|    \^|.  ^|^| `-_^|^| ^|^|_-' ^|^|  .^|/    ^|^| ^|^|   ^| \  / ^|-_.^|^|
ECHO ^|^|    ^|^|_-'      ^|^| ^|^|      `-_^|^|    ^|^| ^|^|    ^|^|_-'      ^|^| ^|^|   ^| \  / ^|  `^|^|
ECHO ^|^|    `'         ^|^| ^|^|         `'    ^|^| ^|^|    `'         ^|^| ^|^|   ^| \  / ^|   ^|^|
ECHO ^|^|            .===' `===.         .==='.`===.         .===' /==. ^|  \/  ^|   ^|^|
ECHO ^|^|         .=='   \_^|-_ `===. .==='   _^|_   `===. .===' _-^|/   `==  \/  ^|   ^|^|
ECHO ^|^|      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /^|  \/  ^|   ^|^|
ECHO ^|^|   .=='    _-'          `-__\._-'         `-_./__-'         `' ^|. /^|  ^|   ^|^|
ECHO ^|^|.=='    _-'                                                     `' ^|  /==.^|^|
ECHO =='    _-'                                                            \/   `==
ECHO \   _-'                                                                `-_   /
ECHO  `''                                                                      ``'
ECHO.



:main
rem Pulling settings from config file

(
set /p bmod=
set /p brutal=
set /p mmod=
set /p metal=
set /p cmod=
set /p custom=
set /p d2wad=
set /p iwadname=
)<settings.cfg

:checkcustom
IF "%cmod:~0,5%"=="ECHO " (
ECHO  Error reading custom wad from settings.cfg.
ECHO.
ECHO  Settings file corrupted. Attempting to delete and recreate settings.cfg...
ECHO. 
goto settingserror
)
IF "%d2wad:~0,5%"=="ECHO " (
ECHO  Error reading iwad used for Master Levels and No Rest for the Living from settings.cfg.
ECHO.
ECHO  Settings file corrupted. Attempting to delete and recreate settings.cfg...
ECHO. 
goto settingserror
)


IF %d2wad%==. IF EXIST doom2.wad (SET d2wad=doom2.wad) else (IF EXIST plutonia.wad (SET d2wad=plutonia.wad) else (IF EXIST tnt.wad (SET d2wad=tnt.wad) else (IF EXIST freedoom2.wad (SET d2wad=freedoom2.wad) ELSE (set d2wad=.))))

IF %d2wad%==doom2.wad (
SET d2wadname=Doom II
) else (
IF %d2wad%==plutonia.wad (
SET d2wadname=The Plutonia Experiment
) else (
IF %d2wad%==tnt.wad (
SET d2wadname=TNT: Evilution
) else (
IF %d2wad%==freedoom2.wad (
SET d2wadname=Freedoom Phase 2
) else (
IF %d2wad%==. (
SET d2wadname=not set
) else (
set d2wadname=custom iwad
)
)
)
)
)


:checkbrutal
IF %brutal% == true (
set bm=%onoption%
set bnot=%offoption%
ECHO    Brutal Doom mod is ON.
IF NOT EXIST %bmod% (
ECHO.
ECHO    Error: Brutal Doom mod not found.
ECHO          Either toggle this setting off, or place %bmod% in .\game, or edit
ECHO          the filename in the settings menu. (option C^)
ECHO.
)
goto checkmetal
)
IF %brutal% == false (
set bm=%offoption%
set bnot=%onoption%
ECHO    Brutal Doom mod is OFF.
goto checkmetal
)
goto settingserror

:checkmetal
IF %metal% == true (
set mm=%onoption%
set mnot=%offoption%
ECHO    Metal Soundtrack mod is ON.
IF NOT EXIST %mmod% (
ECHO.
ECHO    Error: Metal Soundtrack mod not found.
ECHO          Either toggle this setting off, or place %mmod% in .\game, or edit
ECHO          the filename in the settings menu. (option C^))
ECHO.
)
goto mainmenu
)
IF %metal% == false (
set mm=%offoption%
set mnot=%onoption%
ECHO    Metal Soundtrack mod is OFF.
goto mainmenu
)
goto settingserror

rem Error handler in case a config file is found, but the contents don't make sense
:settingserror
if %seterror%==1 goto cantread
ECHO   A config file was found, but there was an error. Attempting to delete
ECHO   and create a default settings file...
set seterror==1
del settings.cfg
IF EXIST settings.cfg goto cantdel

goto makeconfig

rem Error handler in case an attempt to create a config file fails
:cantmake
ECHO   Critical error: A config file could not be created. Check directory
ECHO   permissions and run this launcher again.
ECHO.
PAUSE
GOTO end

rem Error handler in case a corrupted file is recreated, but the contents still don't make sense
:cantread
ECHO   Critical error: A new config file was created, but the contents still could
ECHO   not be properly read. Check directory permissions and run this launcher again.
ECHO.
PAUSE
GOTO end

rem Error handler in case a corrupted config file is found but cannot be deleted
:cantdel
ECHO.
ECHO   Critical error: The settings file could not be deleted. Please manually 
ECHO   delete the settings.cfg file in .\game and run this launcher again.
ECHO.
PAUSE
GOTO end

:mainmenu
set cmodmenu=
IF %cmod%==. (set cmodmenu=not set-- set in mod settings menu) else (set cmodmenu=%cmod%)
IF %custom%==true (
ECHO    Custom .wad file is ON. ^(%cmodmenu%^)
set cload=%cmod%
) else (
ECHO    Custom .wad file is OFF. ^(%cmodmenu%^)
set cload=
)
set seterror==0
set bload=%bmod%
set mload=%mmod%

ECHO.

set canplaymaster=false
IF NOT %d2wad%==. set canplaymaster=true

ECHO  Choose which game to load:
ECHO.
IF EXIST doom1.wad (ECHO  0. Doom ^(Shareware version^))
IF EXIST doom.wad (ECHO  1. The Ultimate Doom) else (ECHO  1. The Ultimate Doom not found. Purchase?)
IF EXIST doom2.wad (ECHO  2. Doom II) else (ECHO  2. Doom II not found. Purchase?)

IF EXIST master.wad (IF %canplaymaster%==true (ECHO  3. Master Levels for Doom II ^(using %d2wadname%^)) else (ECHO  3. Master Levels for Doom II requires Doom 2, Final Doom, or Freedoom Phase 2.)) else (
ECHO  3. Master Levels for Doom II not found. Purchase? 
ECHO       ^(Did you put master.wad into the "game" folder after using the Master Levels Patch?^)
)

IF EXIST plutonia.wad (ECHO  4. Final Doom: The Plutonia Experiment) else (ECHO  4. Final Doom: The Plutonia Experiment not found. Purchase?)
IF EXIST tnt.wad (ECHO  5. Final Doom: TNT: Evilution) else (ECHO  5. Final Doom: TNT: Evilution not found. Purchase?)


IF EXIST nerve.wad (IF %canplaymaster%==true (ECHO  6. No Rest for the Living ^(using %d2wadname%^)) else (ECHO  3. No Rest for the Living requires Doom 2, Final Doom, or Freedoom Phase 2.)) else (ECHO  3. No Rest for the Living not found. Purchase?)

IF EXIST freedoom1.wad (ECHO  7. Freedoom Phase 1) else (ECHO  7. Freedoom Phase 1 not found. Download?)
IF EXIST freedoom2.wad (ECHO  8. Freedoom Phase 2) else (ECHO  8. Freedoom Phase 2 not found. Download?)
IF '%iwadname%'=='.' (
ECHO  9. Custom iwad not set. Enter settings?
) else (
ECHO  9. Run %iwadname%
)

ECHO.
ECHO  C. Configure mod settings
ECHO  H. Setup help
ECHO  D. Mod download menu
ECHO.
ECHO  X. Exit
ECHO.

set choice=
set /p choice=Type your choice: 
if not '%choice%'=='' set choice=%choice:~0,2%
if /I '%choice%'=='C' goto msets
if /I '%choice%'=='H' goto helpme
if /I '%choice%'=='D' goto download
if /I '%choice%'=='X' goto end


if %brutal% == false set bload=''
if %metal% == false set mload=''

if '%choice%'=='' goto end
if '%choice%'=='0' (IF EXIST doom1.wad (goto runshareware) else (
echo.
echo Sharing is caring! Have the shareware version? Put doom1.wad in .\game to enable this hidden option.
echo.
pause
goto start
))

if '%choice%'=='1' (IF EXIST doom.wad (goto doom) else (goto purchase))
if '%choice%'=='2' (IF EXIST doom2.wad (goto doom2) else (goto purchase))
if '%choice%'=='3' (IF EXIST master.wad (IF %canplaymaster%==true (goto master) else (goto purchase)) else (goto purchase))
if '%choice%'=='4' (IF EXIST plutonia.wad (goto plutonia) else (goto purchase))
if '%choice%'=='5' (IF EXIST tnt.wad (goto tnt) else (goto purchase))
if '%choice%'=='6' (IF EXIST nerve.wad (IF %canplaymaster%==true (goto nerve) else (goto purchase)) else (goto purchase))
if '%choice%'=='7' (IF EXIST freedoom1.wad (goto freedoom1) else (goto downloadfreedoom))
if '%choice%'=='8' (IF EXIST freedoom2.wad (goto freedoom2) else (goto downloadfreedoom))
if '%choice%'=='9' (

IF '%iwadname%'=='.' (goto msets) else (goto runcustomiwad)

)

ECHO "%choice%" is not valid, try again
pause
cls
goto start

:purchase
CLS
ECHO.
ECHO  Choose which store page to launch:
ECHO.
ECHO  1. The Ultimate Doom on GOG
ECHO  2. Doom II + Final Doom  on GOG (Includes Master Levels for Doom II)
ECHO  3. Doom 3: BFG Edition on GOG, which includes Doom, Doom II, and No Rest for the Living (nerve.wad)
ECHO.
ECHO  4. The Ultimate Doom, Doom II, Master Levels, and Final Doom pack on Steam
ECHO  5. Doom 3: BFG Edition on Steam, which includes Doom, Doom II, and No Rest for the Living (nerve.wad)
ECHO.
ECHO  Be sure to check out any applicable bundles!
ECHO.

set choice=
set /p choice=Type 1-5 or 'Enter' to go back: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto buydgog
if '%choice%'=='2' goto buyd2gog
if '%choice%'=='3' goto buyd3gog
if '%choice%'=='4' goto buysteambundle
if '%choice%'=='5' goto buyd3steam

if '%choice%'=='' goto start

ECHO "%choice%" is not valid, try again
pause
cls
goto purchase

:buydgog
start /max https://www.gog.com/game/the_ultimate_doom
goto purchase

:buyd2gog
start /max https://www.gog.com/game/doom_ii_final_doom
goto purchase

:buyd3gog
start /max https://www.gog.com/game/doom_3_bfg_edition
goto purchase

:buysteambundle
start /max https://store.steampowered.com/sub/18397/
goto purchase

:buyd3steam
start /max https://store.steampowered.com/app/208200/
goto purchase

:helpme
cls
ECHO         ________  _________   __    __   ________    _____    __
ECHO        ^|______  \ ^|______  \ ^|  ^|  ^|  ^| ^|__    __^|  /  _  \  ^|  ^|
ECHO        ^|        / ^|   __   / ^|  ^|  ^|  ^|    ^|  ^|    /  /_^|  ^| ^|  ^|
ECHO        ^|  ____  \ ^|  ^|  ^|  ^| ^|  \__/  ^|    ^|  ^|   /  /^|_   ^| ^|  ^|_____
ECHO        ^|________/ ^|__^|  ^|__^|  \______/     ^|__^|  /__/   ^|__^|  \_______^|
ECHO =================     ===============     ===============   ========  ========
ECHO \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
ECHO ^|^|. . ._____. . .^|^| ^|^|. . ._____. . .^|^| ^|^|. . ._____. . .^|^| ^|^| . . .\/ . . .^|^|
ECHO ^|^| . .^|^|   ^|^|. . ^|^| ^|^| . .^|^|   ^|^|. . ^|^| ^|^| . .^|^|   ^|^|. . ^|^| ^|^|. . . . . . . ^|^|
ECHO ^|^|. . ^|^|   ^|^| . .^|^| ^|^|. . ^|^|   ^|^| . .^|^| ^|^|. . ^|^|   ^|^| . .^|^| ^|^| . ^| . . . . .^|^|
ECHO ^|^| . .^|^|   ^|^|. _-^|^| ^|^|-_ .^|^|   ^|^|. . ^|^| ^|^| . .^|^|   ^|^|. _-^|^| ^|^|-_.^|\ . . . . ^|^|
ECHO ^|^|. . ^|^|   ^|^|-'  ^|^| ^|^|  `-^|^|   ^|^| . .^|^| ^|^|. . ^|^|   ^|^|-'  ^|^| ^|^|  `^|\_ . .^|. .^|^|
ECHO ^|^| . _^|^|   ^|^|    ^|^| ^|^|    ^|^|   ^|^|_ . ^|^| ^|^| . _^|^|   ^|^|    ^|^| ^|^|   ^|\ `-_/^| . ^|^|
ECHO ^|^|_-' ^|^|  .^|/    ^|^| ^|^|    \^|.  ^|^| `-_^|^| ^|^|_-' ^|^|  .^|/    ^|^| ^|^|   ^| \  / ^|-_.^|^|
ECHO ^|^|    ^|^|_-'      ^|^| ^|^|      `-_^|^|    ^|^| ^|^|    ^|^|_-'      ^|^| ^|^|   ^| \  / ^|  `^|^|
ECHO ^|^|    `'         ^|^| ^|^|         `'    ^|^| ^|^|    `'         ^|^| ^|^|   ^| \  / ^|   ^|^|
ECHO ^|^|            .===' `===.         .==='.`===.         .===' /==. ^|  \/  ^|   ^|^|
ECHO ^|^|         .=='   \_^|-_ `===. .==='   _^|_   `===. .===' _-^|/   `==  \/  ^|   ^|^|
ECHO ^|^|      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /^|  \/  ^|   ^|^|
ECHO ^|^|   .=='    _-'          `-__\._-'         `-_./__-'         `' ^|. /^|  ^|   ^|^|
ECHO ^|^|.=='    _-'                                                     `' ^|  /==.^|^|
ECHO =='    _-'                    Launcher for GZDoom                     \/   `==
ECHO \   _-'                                                                `-_   /
ECHO  `''                                                                      ``'
ECHO.

ECHO ==============================================================================
ECHO ^|                                                                            ^|
ECHO ^| Instructions for setup:                                                    ^|
ECHO ^|                                                                            ^|

IF EXIST gzdoom.exe (
ECHO ^| 1. GZDoom found.                                                           ^|
) else (
ECHO ^| 1. Download the latest GZDoom from:                                        ^|
ECHO ^|         https://zdoom.org/                                                 ^|
ECHO ^|    and extract it to the "game" folder.                                    ^|
)
ECHO ^|                                                                            ^|

IF EXIST %bmod% (
ECHO ^| 2. Brutal Doom mod found.                                                  ^|
) else (
ECHO ^| 2. Download the latest Brutal Doom from:                                   ^|
ECHO ^|         https://www.moddb.com/mods/brutal-doom/downloads                   ^|
ECHO ^|    and extract it to the "game" folder.                                    ^|
)
ECHO ^|                                                                            ^|

IF EXIST %mmod% (
ECHO ^| 3. Metal Soundtrack mod found.                                             ^|
) else (
ECHO ^| 3. Download the latest Doom Metal Soundtrack Mod from:                     ^|
ECHO ^|         https://www.moddb.com/mods/brutal-doom/downloads                   ^|
ECHO ^|    and extract it to the "game" folder.                                    ^|
)
ECHO ^|                                                                            ^|

IF EXIST doom.wad (
ECHO ^| 4. The Ultimate Doom found.                                                ^|
) else (
ECHO ^| 4. Find the "doom.wad" file in the installation directory for              ^|
ECHO ^|    The Ultimate Doom or Doom 3: BFG Edition and copy it to the "game"      ^|
ECHO ^|    folder.                                                                 ^|
)
ECHO ^|                                                                            ^|

IF EXIST doom2.wad (
ECHO ^| 5. Doom II found.                                                          ^|
) else (
ECHO ^| 5. Find the "doom2.wad" file in the installation directory for Doom II or  ^|
ECHO ^|    Doom 3: BFG Edition and copy it to the "game" folder.                   ^|
)
ECHO ^|                                                                            ^|

IF EXIST tnt.wad (
IF EXIST plutonia.wad (
ECHO ^| 6. Final Doom found.                                                       ^|
goto ffound
)
)
ECHO ^| 6. Find the "tnt.wad" and "plutonia.wad" files in the installation         ^|
ECHO ^|    directory for Final Doom and copy both of them to the "game" folder.    ^|
:ffound
ECHO ^|                                                                            ^|

IF EXIST nerve.wad (
ECHO ^| 7. No Rest for the Living found.                                           ^|
) else (
ECHO ^| 7. Find the "nerve.wad" file in the installation directory for Doom 3:     ^|
ECHO ^|    BFG Edition and copy it to the "game" folder.                           ^|
)
ECHO ^|                                                                            ^|

IF EXIST master.wad (
ECHO ^| 8. Master Levels for Doom II found.                                        ^|
) else (
ECHO ^| 8. Find the "wads" folder in the installation directory for Master Levels  ^|
ECHO ^|    for Doom II ^(possibly in installdir\master^) and combine them using the  ^|
ECHO ^|    Master Levels Patch ^(obtainable through this launcher's Mod Download    ^|
ECHO ^|    Menu^), and then copy master.wad to the "game" folder.                   ^|
)
ECHO ^|                                                                            ^|

ECHO ==============================================================================
ECHO.

:askgzdoom
ECHO.
ECHO  Would you like to visit the mod download menu?
ECHO.
set choice=
set /p choice=Y/N: 
if not '%choice%'=='' set choice=%choice:~0,1%
if /I '%choice%'=='Y' goto download
IF EXIST gzdoom.exe goto start
GOTO end

:download
CLS
ECHO.
ECHO  Choose which download page to launch:
ECHO.
ECHO  1. GZDoom
ECHO  2. Brutal Doom ^& Metal Soundtrack mod
ECHO  3. Master Levels Patch
ECHO  4. Freedoom
ECHO  5. Broken link?
ECHO.

set choice=
set /p choice=Type 1-5 or 'Enter' to go back: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto downloadgzd
if '%choice%'=='2' goto downloadbrutal
if '%choice%'=='3' goto downloadmpatch
if '%choice%'=='4' goto downloadfreedoom
if '%choice%'=='5' goto brokenlink
if '%choice%'=='' goto start

ECHO "%choice%" is not valid, try again
pause
cls
goto download

:downloadgzd
start /max https://zdoom.org/
goto start

:downloadbrutal
start /max https://www.moddb.com/mods/brutal-doom/downloads
goto start

:downloadmpatch
ECHO  Use this to to combine all 20 Master Levels for Doom II wad files into one patch.
ECHO  When finished, put master.wad into the .\game folder.
PAUSE
start /max http://maniacsvault.net/projects
goto start

:downloadfreedoom
start /max https://freedoom.github.io/download.html
goto start

:brokenlink
ECHO.
ECHO  Well, that's a shame. Seeing as how it's unlikely that this tool will ever
ECHO  be updated, I'll just have to list the tools and wish you luck with using
ECHO  Google to find what you need.
ECHO.
ECHO  Brutal Doom
ECHO      The main reason this launcher exists.
ECHO.
ECHO  Metal Soundtrack Mod
ECHO      A music replacement mod available from the same MODDB download page as
ECHO      Brutal Doom. Highly recommended, though optional.
ECHO.
ECHO  Freedoom
ECHO      A freeware wad file that does not contain official doom levels. Can be
ECHO      used as a base for Master Levels for Doom II.
ECHO.
ECHO  Unofficial Master Levels for Doom 2 Patch (by Blzut3)
ECHO      A tool used to combine the 20 individual .wad files included with
ECHO      Master Levels for Doom II into one WAD file, with customization options.
ECHO.
pause
goto download

:msets
rem Assign any changes to file
rem todo: translate on and off to true/false
(
echo %bmod%
echo %brutal%
echo %mmod%
echo %metal%
echo %cmod%
echo %custom%
echo %d2wad%
echo %iwadname%
)>settings.cfg

rem Pulling settings again from newly written file
(
set /p bmod=
set /p brutal=
set /p mmod=
set /p metal=
set /p cmod=
set /p custom=
set /p d2wad=
set /p iwadname=
)<settings.cfg

IF %d2wad%==doom2.wad (
SET d2wadname=Doom II
) else (
IF %d2wad%==plutonia.wad (
SET d2wadname=The Plutonia Experiment
) else (
IF %d2wad%==tnt.wad (
SET d2wadname=TNT: Evilution
) else (
IF %d2wad%==freedoom2.wad (
SET d2wadname=Freedoom Phase 2
) else (
IF %d2wad%==. (
SET d2wadname=not set
) else (
set d2wadname=custom iwad
)
)
)
)
)

IF %brutal% == true (
set bm=%onoption%
set bnot=%offoption%
goto checkmetalset
)
IF %brutal% == false (
set bm=%offoption%
set bnot=%onoption%
goto checkmetalset
)
goto settingserror

:checkmetalset
IF %metal% == true (
set mm=%onoption%
set mnot=%offoption%
goto checkcustomset
)
IF %metal% == false (
set mm=%offoption%
set mnot=%onoption%
goto checkcustomset
)
goto settingserror
:checkcustomset
IF %custom% == true (
set cm=%onoption%
set cnot=%offoption%
goto setmenu
)
IF %custom% == false (
set cm=%offoption%
set cnot=%onoption%
goto setmenu
)

goto settingserror

:setmenu
CLS
ECHO.
ECHO  Choose which settings to modify:
ECHO.
ECHO  1. Toggle Brutal Doom mod %bnot%
ECHO  2. Toggle Metal Soundtrack mod %mnot%
ECHO  3. Toggle custom wad %cnot%
ECHO  4. Change name of Brutal Doom mod file from %bmod%
ECHO  5. Change filename of Metal Soundtrack mod from %mmod%
ECHO  6. Change custom wad file string
ECHO  7. Change iwad used for Master Levels and No Rest for the Living (currently using: %d2wadname%)
if '%iwadname%'=='.' (
ECHO  8. Change custom iwad file ^(not currently set^)
) else (
ECHO  8. Change custom iwad file ^(currently using: %iwadname%^)
)
ECHO  9. Delete config file and reinitialize launcher
ECHO.
IF '%cmod%'=='.' (ECHO   Custom wad string is not currently set.) ELSE (ECHO   Custom wad string is currently: %cmod%)
ECHO.

set choice=
set /p choice=Type 1-5 or 'Enter' to go back: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto toggleb
if '%choice%'=='2' goto togglem
if '%choice%'=='3' goto togglec
if '%choice%'=='4' goto renb
if '%choice%'=='5' goto renm
if '%choice%'=='6' goto changecustom
if '%choice%'=='7' goto changed2wad
if '%choice%'=='8' goto changeiwad
if '%choice%'=='9' goto restoredefault
if '%choice%'=='' goto start

ECHO "%choice%" is not valid, try again
pause
cls
goto msets

:toggleb

IF %brutal% == false (
SET brutal=true
goto msets
)
SET brutal=false
goto msets

:togglem
IF %metal% == false (
SET metal=true
goto msets
)
SET metal=false
goto msets

:togglec
IF %custom% == false (
SET custom=true
goto msets
)
SET custom=false
goto msets

:renb

set /p input=Type filename for Brutal Doom mod file: 
if not '%input%'=='' set bmod=%input%
goto msets
:renm
set /p input=Type filename for Metal Soundtrack mod file: 
if not '%input%'=='' set mmod=%input%
goto msets

:changecustom
ECHO.
ECHO   It is possible to load multiple custom wads if separated by spaces. Example: simpson.wad music.wad manor.wad
ECHO.
set /p input=List the custom wad(s) to load: 
if '%input%'=='' (
goto msets
) else (
set cmod=%input%
)
goto msets

:changed2wad
ECHO.
IF EXIST DOOM2.WAD (
ECHO   1. Doom 2
) else (
ECHO   1. Doom 2 ^(not found^)
)
IF EXIST plutonia.wad (
ECHO   2. Final Doom: The Plutonia Experiment
) else (
ECHO   2. Final Doom: The Plutonia Experiment ^(not found^)
)
IF EXIST tnt.wad (
ECHO   3. Final Doom: TNT: Evilution
) else (
ECHO   3. Final Doom: TNT: Evilution ^(not found^)
)
IF EXIST freedoom2.wad (
ECHO   4. Freedoom Phase 2
) else (
ECHO   4. Freedoom Phase 2 ^(not found^)
)
ECHO.
ECHO   It is possible to load a custom iwad by typing the filename instead of a number.
ECHO.
set /p input=Type 1-4 or filename, or 'Enter' to go back: 
if '%input%'=='' (
goto msets
) else (

IF %input%==1 (
IF EXIST DOOM2.WAD SET d2wad=doom2.wad
) else (
IF %input%==2 (
IF EXIST plutonia.wad SET d2wad=plutonia.wad
) else (
IF %input%==3 (
IF EXIST tnt.wad SET d2wad=tnt.wad
) else (
IF %input%==4 (
IF EXIST freedoom2.wad SET d2wad=freedoom2.wad
) else (
set d2wad=%input%
)
)
)
)
)
goto msets

:changeiwad
ECHO.
ECHO   Type the name of the custom iwad to load, '.' to clear, or [enter] to go back. (Example: doom1.wad)
ECHO.
set /p input=List the custom iwad to load: 
if '%input%'=='' (
goto msets
) else (
set iwadname=%input%
)
goto msets

:restoredefault
del settings.cfg
IF EXIST settings.cfg goto cantdel
goto makeconfig

rem game run commands start here
:doom
start gzdoom.exe %bload% -iwad doom.wad -file %mload% %cload%
goto end

:doom2
start gzdoom.exe %bload% -iwad doom2.wad -file %mload% %cload%
goto end

:master
start gzdoom.exe %bload% -iwad %d2wad% -file master.wad %mload% %cload%
goto end

:plutonia
start gzdoom.exe %bload% -iwad doom2.wad -file plutonia.wad %mload% %cload%
goto end

:tnt
start gzdoom.exe %bload% -iwad doom2.wad -file tnt.wad %mload% %cload%
goto end

:nerve
rem IF EXIST doom2.wad (SET d2wad=doom2.wad) else (IF EXIST plutonia.wad (SET d2wad=plutonia.wad) else (IF EXIST tnt.wad (SET d2wad=tnt.wad) else (IF EXIST freedoom2.wad (SET d2wad=freedoom2.wad))))
start gzdoom.exe %bload% -iwad %d2wad% -file nerve.wad %mload% %cload%
goto end

:freedoom1
start gzdoom.exe %bload% -iwad freedoom1.wad %mload% %cload%
goto end

:freedoom2
start gzdoom.exe %bload% -iwad freedoom2.wad %mload% %cload%
goto end

:runcustomiwad
start gzdoom.exe %bload% -iwad %iwadname% %mload% %cload%
goto end

:runshareware
start gzdoom.exe -iwad doom1.wad
goto end

:end
cd ..
cls

:eof

