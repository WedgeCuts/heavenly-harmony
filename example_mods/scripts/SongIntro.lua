--easy script configs
IntroTextSize = 40	--Size of the text for the Now Playing thing.
IntroSubTextSize = 35 --size of the text for the Song Name.
IntroTagColor = '8300c3'	--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
songCredits = 'DatDavi' --songcredits, doing it ghetto style
Font = 'Eina01-Bold.ttf'
--easy script configs

--actual script
function onCreate()

	if songName == 'Wistful' then
		songCredits = 'LuvSeals, DatDavi'
	elseif songName == 'Heavenbound' then
		songCredits = 'DatDavi'
	elseif songName == 'Revelation' then
		songCredits = 'LiterallyNoOne'
	elseif songName == 'Chikahan' then
		songCredits = 'LuvSeals'
	end

	--the box
	makeLuaSprite('JukeBox', 'menus/songcred', -811, 286)
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', songName, 600, -646, 320)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	setTextFont('JukeBoxText', Font)
	addLuaText('JukeBoxText')
	
	--text for the song name
	makeLuaText('JukeBoxSubText', songCredits, 600, -576, 385)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	setTextFont('JukeBoxSubText', Font)
	addLuaText('JukeBoxSubText')
end

--motion functions
function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxText', 165, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', 235, 1, 'CircInOut')
	
	runTimer('JukeBoxWait', 3, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutTwo', 'JukeBox', -811, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -646, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -576, 1.5, 'CircInOut')
	end
end