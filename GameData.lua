local Unlocked = {}
Unlocked.LevelUnlocked = {true,true,true,true,true,false,false,false,false,false,false,false,false,false,false}
-- Unlocked.LevelUnlocked = {true,true,true,true,true,true,true,true,true,true,true,true,true,true,true}
Unlocked.CharacterUnlocked = {true, true, true, true, false, false, false}
Unlocked.LevelArray = {"LEVEL_ONE 1.png", "MOON_LEVEL.png","SOCCER_LEVEL.png","BEACH_LEVEL.png", "cloudlevel1.png", "underwater.png", "volcanolevel.png", "zoo.png","WALL.png"}
Unlocked.LevelArray2 = {"BasicLevel","moonlevel","soccerlevel", "beachlevel", "cloudlevel", "underwaterlevel", "volcanolevel", "zoolevel","walllevel"}
math.randomseed(os.time())
Unlocked.levelselector = math.random(9)
Unlocked.Player1WinCount = 0
Unlocked.Player2WinCount = 0
Unlocked.GameCount = {0}
Unlocked.TrumpGameCount = {0}
Unlocked.JumpCount = {0}
Unlocked.PlayerScore = {0,0}
Unlocked.PlayerCollisions = {0}
Unlocked.MusicBool = 1


return Unlocked