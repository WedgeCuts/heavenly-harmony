local xx = 465.00
local yy = 500
local xx2 = 900
local yy2 = 500
local ofs = 50
local followchars = true

function onCreate()
	-- background shit, reuse it and stuff if needed
	makeLuaSprite('bg', 'bg/night-bg', -600, -200)
	makeLuaSprite('stall11', 'bg/night-stall11', -600, -200)
	makeLuaSprite('stall12', 'bg/night-stall12', -600, -200)
	makeLuaSprite('stall2', 'bg/night-stall2', -600, -200)
	makeLuaSprite('stall3', 'bg/night-stall3', -600, -200)
	makeLuaSprite('stage', 'bg/night-stage', -600, -200)
	makeLuaSprite('banderitas', 'bg/night-yay', -600, -200)
	setScrollFactor('banderitas', 0.3, 0.3)

	makeLuaSprite('bopbg1', 'bg/bgboppers1', -600, -200)
	makeLuaSprite('bopbg2', 'bg/bgboppers2', -600, -200)
	makeLuaSprite('bopbg3', 'bg/bgboppers3', -600, -200)
	makeLuaSprite('bopfg', 'bg/fgboppers', -600, -200)
	
	addLuaSprite('bg', false)
	addLuaSprite('stall11', false)
	addLuaSprite('bopbg2', false)
	addLuaSprite('stall12', false)
	
	addLuaSprite('stall2', false)
	addLuaSprite('bopbg1', false)
	addLuaSprite('bopbg3', false)
	
	addLuaSprite('stall3', false)
	addLuaSprite('stage', false)
	addLuaSprite('bopfg', true)
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
	setProperty('bopbg3.y',getProperty('bopbg3.y')+5)
	doTweenY('charbounce3','bopbg3',getProperty('bopbg3.y')-5,0.15,'circOut')
	setProperty('bopfg.y',getProperty('bopfg.y')+20)
	doTweenY('charbounce4','bopfg',getProperty('bopfg.y')-20,0.15,'circOut')
end