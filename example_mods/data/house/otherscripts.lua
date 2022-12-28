function onCreate()
    setProperty("skipCountdown", true)
end
function onCreatePost()
    cameraFlash('game', '000000', 99999, false)
end

function onSongStart()
    cameraFlash('game', '000000', 5, true)
    setProperty('camHUD.alpha', 0)
end
function opponentNoteHit()
    setProperty('camHUD.alpha', 1)
end