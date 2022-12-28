function opponentNoteHit(id,data,type,sus)
    triggerEvent('Screen Shake','0.02, 0.017','0.01, 0.00')
       health = getProperty('health')
end

function onCreate()
   setProperty("skipCountdown", true)
end  

function onCreatePost()

   makeLuaText('help','KEEP YOUR HEALTH HIGH!',0,380,180) --even with flashingLights lights off I'm still warning you
   setTextSize('help',36);
   addLuaText('help');
   setProperty('help.visible', false)

   setProperty('dad.alpha', 0)
   triggerEvent('Camera Follow Pos',600,400)

   cameraFlash('game', '000000', 9999, false)
end

function goodNoteHit()
   if curStep >= 1024 and curStep <= 1536 then
      health = getProperty('health')
      if getPropertyFromClass('ClientPrefs', 'mechanicsDifficulty') == 'Bullshit' then
      setProperty('health', health + 0.005) --it's impossible without this
      else
      setProperty('health', health + 0.02)
      end
   end
end

function onSongStart()
   setProperty('camHUD.alpha', 0)
   cameraFlash('game', '000000', 12, true)
end

function onStepHit()
   if curStep == 256 then
   triggerEvent('Camera Follow Pos',500, 300)
   doTweenAlpha('dad', 'dad', 1, 3);
   end
   if curStep == 1024 then
      if flashingLights then
      cameraFlash('game', 'FFFFFF', 1, true)
      end
      setProperty('help.visible', true)
      setProperty('shakeCam', true)
   end
   if curStep == 1536 then
      if flashingLights then
      cameraFlash('game', 'FFFFFF', 1, true)
      end
      setProperty('help.visible', false)
      setProperty('shakeCam', false)
   end
   if curStep == 2048 then
      setProperty('camHUD.alpha', 0)
      if flashingLights then
      cameraFlash('game', 'FFFFFF', 1, true)
      end
      setProperty('health', 2)
   end
end