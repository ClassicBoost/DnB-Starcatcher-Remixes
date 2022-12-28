function onStepHit()
	if curStep == 512 then
		noteTweenX('moveNoteX0', 0, -300, 0.5, 'ease');
        noteTweenX('moveNoteX1', 1, -300, 0.5, 'ease');
        noteTweenX('moveNoteX2', 2, -300, 0.5, 'ease');
        noteTweenX('moveNoteX3', 3, -300, 0.5, 'ease');
    
        noteTweenX('moveNoteX4', 4, 416, 0.5, 'ease');
        noteTweenX('moveNoteX5', 5, 528, 0.5, 'ease');
        noteTweenX('moveNoteX6', 6, 640, 0.5, 'ease');
        noteTweenX('moveNoteX7', 7, 752, 0.5, 'ease');
	end
	if curStep == 896 then
		noteTweenX('moveNoteX0', 0, defaultOpponentStrumX0, 0.5, 'ease');
        noteTweenX('moveNoteX1', 1, defaultOpponentStrumX1, 0.5, 'ease');
        noteTweenX('moveNoteX2', 2, defaultOpponentStrumX2, 0.5, 'ease');
        noteTweenX('moveNoteX3', 3, defaultOpponentStrumX3, 0.5, 'ease');
    
        noteTweenX('moveNoteX4', 4, defaultPlayerStrumX0, 0.5, 'ease');
        noteTweenX('moveNoteX5', 5, defaultPlayerStrumX1, 0.5, 'ease');
        noteTweenX('moveNoteX6', 6, defaultPlayerStrumX2, 0.5, 'ease');
        noteTweenX('moveNoteX7', 7, defaultPlayerStrumX3, 0.5, 'ease');
	end
end