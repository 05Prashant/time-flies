-- import "CoreLibs/graphics"
-- import "CoreLibs/timer"
-- import "CoreLibs/ui"
-- import "CoreLibs/sprites"
-- import "CoreLibs/crank"
-- import "CoreLibs/nineslice"

-- local pd <const> = playdate
-- local gfx <const> = playdate.graphics

-- local gridsize = 44
-- local gridcontainerwidth = 190
-- local gridcontainerheight = 210

-- local gridview = pd.ui.gridview.new(gridsize, gridsize)
-- gridview:setCellPadding(2, 2, 2, 2)
-- gridview:setNumberOfColumns(8)
-- gridview:setNumberOfRows(2, 3)
-- gridview:setContentInset(4, 4, 4, 4)

-- gridview:setSectionHeaderHeight(44)

-- gridview.backgroundImage = gfx.nineSlice.new("images/bg", 4, 4, 59, 59)

-- local gridviewSprite = gfx.sprite.new()
-- gridviewSprite:setCenter(0,0)
-- gridviewSprite:moveTo(10, 10)
-- gridviewSprite:add()

-- function gridview:drawSectionHeader(section, x, y, width, height)
--   local fontHeight = gfx.getSystemFont():getHeight()
--   gfx.drawTextAligned("*Part "..section.."*", x + width / 2, y + (height/2 - fontHeight/2) + 2 , kTextAlignment.center)
-- end

-- function gridview:drawCell(section, row, column, selected, x, y, width, height)
--   if selected then
--     gfx.fillCircleInRect(x,y,width,height)
--     gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
--   else
--     gfx.drawCircleInRect(x,y,width,height)
--     gfx.setImageDrawMode(gfx.kDrawModeCopy)
--   end

--   local cellText = tostring(row) .. "-" .. tostring(column)
--   local fontHeight = gfx.getSystemFont():getHeight()
--   gfx.drawTextInRect(cellText, x, y + (height/2 - fontHeight/2) + 2 , width, height, nil, nil, kTextAlignment.center)
-- end

-- function pd.update()

--   if pd.buttonJustPressed(pd.kButtonUp) then
--     gridview:selectPreviousRow(true)
--   elseif pd.buttonJustPressed(pd.kButtonDown) then
--     gridview:selectNextRow(true)
--   elseif pd.buttonJustPressed(pd.kButtonLeft) then
--     gridview:selectPreviousColumn(false)
--   elseif pd.buttonJustPressed(pd.kButtonRight) then
--     gridview:selectNextColumn(false)
--   end

--   local crankTicks = pd.getCrankTicks(2)

--   if crankTicks == 1 then
--     gridview:selectNextRow(true)
--   elseif crankTicks == -1 then
--     gridview:selectPreviousRow(true)
--   end

--   if gridview.needsDisplay then
--     local gridviewImage = gfx.image.new(gridcontainerwidth, gridcontainerheight)
--     gfx.pushContext(gridviewImage)
--       gridview:drawInRect(0,0,gridcontainerwidth,gridcontainerheight)
--     gfx.popContext()
--     gridviewSprite:setImage(gridviewImage)
--   end

--   gfx.sprite.update()
--   pd.timer.updateTimers()
-- end