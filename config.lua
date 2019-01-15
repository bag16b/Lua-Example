--
-- For more information on config.lua see the Corona SDK Project Configuration Guide at:
-- https://docs.coronalabs.com/guide/basics/configSettings
--
local aspectRatio = display.pixelHeight / display.pixelWidth
application =
{
	content =
	{
		width = display.contentWidth,
		height = display.contentHeight, 
		scale = "letterBox",
		fps = 30,
		xAlign = "center",
        yAlign = "center"
		
		--[[
		imageSuffix =
		{
			    ["@2x"] = 2,
			    ["@4x"] = 4,
		},
		--]]
	},
}
