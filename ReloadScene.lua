local composer = require("composer")
local scene = composer.newScene()
local gameData = require("GameData")



function scene:create(event)

	local levelselector = gameData.levelselector
	local LevelArray2 = gameData.LevelArray2


	composer.removeScene(LevelArray2[levelselector])
	composer.removeScene("characterselector")
	composer.gotoScene(LevelArray2[levelselector])
end

scene:addEventListener("create", scene)

return scene