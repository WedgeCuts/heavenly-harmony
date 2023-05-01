local speed = 60
local i =0
local xx = 908.78
local yy = 760
local xx2 = 1357.77
local yy2 = 760
local ofs = 0
local followchars = true
local hankdown = false

function onCreate()
	-- background shit
	
	-- Scrolling Objects
	makeLuaSprite('mts', 'bg/bonusBG1', -3283, 300)
	scaleObject('mts', 0.6, 0.6)
	makeLuaSprite('mts2', 'bg/bonusBG2', 0, 300)
	scaleObject('mts2', 0.6, 0.6)

	addLuaSprite('mts', false)
	addLuaSprite('mts2', false)
	
	--letterboxing
	makeLuaSprite('bartop', nil, 0, -15)
	makeLuaSprite('barbot', nil, 0, 620)
	makeGraphic('bartop', screenWidth, 100, '000000')
	makeGraphic('barbot', screenWidth, 100, '000000')
	setObjectCamera('bartop', 'hud')
	setObjectCamera('barbot', 'hud')
	addLuaSprite('bartop', false)
	addLuaSprite('barbot', false)
	
end

function onUpdate(elapsed)
i = i + 1

	DALAPSED = elapsed/0.016 --Thanks Holiday Mod Part II
	speed = 5*DALAPSED
	
	setProperty('mts.x',getProperty('mts.x')+speed)
	if getProperty('mts.x') > 3283 then
		setProperty('mts.x',-3283)
	end
	setProperty('mts2.x',getProperty('mts2.x')+speed)
	if getProperty('mts2.x') > 3283 then
		setProperty('mts2.x',-3283)
	end
	
	
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