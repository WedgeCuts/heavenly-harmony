local xx = 465.00
local yy = 500
local xx2 = 900
local yy2 = 500
local ofs = 50
local followchars = true

function onCreate()
	-- background shit, reuse it and stuff if needed
	makeLuaSprite('bg', 'bg/sunset-bg', -600, -200)
	makeLuaSprite('stall1', 'bg/sunset-stall1', -600, -200)
	makeLuaSprite('stall2', 'bg/sunset-stall2', -600, -200)
	makeLuaSprite('stall3', 'bg/sunset-stall3', -600, -200)
	makeLuaSprite('stage', 'bg/sunset-stage', -600, -200)
	makeLuaSprite('banderitas', 'bg/sunset-yay', -600, -200)
	setScrollFactor('banderitas', 0.3, 0.3)

	makeLuaSprite('bopfg', 'bg/fgboppers', -600, -200)
	
	addLuaSprite('bg', false)
	addLuaSprite('stall1', false)
	addLuaSprite('stall2', false)
	addLuaSprite('stall3', false)
	addLuaSprite('stage', false)
	addLuaSprite('bopfg', true)
	addLuaSprite('banderitas', true)
	
	initLuaShader('agabeebopAssShaderSoft')
	setSpriteShader('boyfriend', 'agabeebopAssShaderSoft')
	setSpriteShader('dad', 'agabeebopAssShaderSoft')
	initLuaShader('dropShadow')
	setSpriteShader('boyfriend', 'dropShadow')
	setSpriteShader('dad', 'dropShadow')
	
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
	setProperty('bopfg.y',getProperty('bopfg.y')+20)
	doTweenY('charbounce2','bopfg',getProperty('bopfg.y')-20,0.15,'circOut')
end