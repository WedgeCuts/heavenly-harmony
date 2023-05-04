local xx = 465.00
local yy = 450
local xx2 = 900
local yy2 = 450
local ofs = 50
local followchars = true

function onCreate()
	-- background shit
	makeLuaSprite('bg', 'bg/noon-bg', -600, -200)
	makeLuaSprite('stall1', 'bg/noon-stall1', -600, -200)
	makeLuaSprite('stall2', 'bg/noon-stall2', -600, -200)
	makeLuaSprite('stall3', 'bg/noon-stall3', -600, -200)
	makeLuaSprite('stage', 'bg/noon-stage', -600, -200)
	makeLuaSprite('banderitas', 'bg/noon-yay', -600, -200)
	setScrollFactor('banderitas', 0.3, 0.3)
	
	addLuaSprite('bg', false)
	addLuaSprite('stall2', false)
	addLuaSprite('stall1', false)
	addLuaSprite('stall3', false)
	addLuaSprite('stage', false)
	addLuaSprite('banderitas', true)
	
	setPropertyFromClass('GameOverSubstate', 'characterName', 'gfpinoy-gameover')
	
end

function onUpdate()
	if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
		else
			triggerEvent('Camera Follow Pos','','')
		end
end