local xx = 465.00
local yy = 450
local xx2 = 900
local yy2 = 450
local ofs = 50
local followchars = true

function onCreate()
	-- background shit
	makeLuaSprite('bg', 'bg/noon-bg', -600, -200)
	makeLuaSprite('stall11', 'bg/noon-stall11', -600, -200)
	makeLuaSprite('stall12', 'bg/noon-stall12', -600, -200)
	makeLuaSprite('stall2', 'bg/noon-stall2', -600, -200)
	makeLuaSprite('stall3', 'bg/noon-stall3', -600, -200)
	makeLuaSprite('stage', 'bg/noon-stage', -600, -200)
	makeLuaSprite('banderitas', 'bg/noon-yay', -600, -200)
	setScrollFactor('banderitas', 0.3, 0.3)

	makeLuaSprite('bopbg1', 'bg/bgboppers1', -600, -200)
	makeLuaSprite('bopbg2', 'bg/bgboppers2', -600, -200)
	
	addLuaSprite('bg', false)
	
	addLuaSprite('stall2', false)
	addLuaSprite('stall11', false)
	addLuaSprite('bopbg2', false)
	addLuaSprite('stall12', false)
	addLuaSprite('bopbg1', false)
	
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

function onBeatHit()
	--BG chars boppin!
	setProperty('bopbg1.y',getProperty('bopbg1.y')+5)
	doTweenY('charbounce1','bopbg1',getProperty('bopbg1.y')-5,0.15,'circOut')
	setProperty('bopbg2.y',getProperty('bopbg2.y')+5)
	doTweenY('charbounce2','bopbg2',getProperty('bopbg2.y')-5,0.15,'circOut')
end