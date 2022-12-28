function onUpdate(elapsed)
setPropertyFromClass('ClientPrefs', 'middleScroll', false)
if middleScroll == true then
endSong()
end
songPos = getSongPosition()
		local currentBeat = (songPos/5000)*(curBpm/60)

		if getPropertyFromClass('ClientPrefs', 'allowModcharts') == true and difficulty == 1 then
		noteTweenX(defaultPlayerStrumX0, 15, defaultPlayerStrumX0 - 50*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX1, 20, defaultPlayerStrumX1 - 350 + 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)
		noteTweenX(defaultPlayerStrumX2, 25, defaultPlayerStrumX2 - 50*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX3, 30, defaultPlayerStrumX3 - 350 + 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)

		noteTweenX(defaultOpponentStrumX0, 35, defaultOpponentStrumX0 + 50*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultOpponentStrumX1, 40, defaultOpponentStrumX1 + 350 - 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)
		noteTweenX(defaultOpponentStrumX2, 45, defaultOpponentStrumX2 + 50*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultOpponentStrumX3, 50, defaultOpponentStrumX3 + 350 - 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)
		end
setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 0.6))
function onMoveCamera(focus)
	if focus == 'boyfriend' then
		-- called when the camera focus on boyfriend
	elseif focus == 'dad' then
		setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') > (0.025 * (difficulty + 1)) then
	setProperty('health', getProperty('health') - (0.025 * (difficulty + 1)) * ((getProperty('health')/22)))
	end
end
end