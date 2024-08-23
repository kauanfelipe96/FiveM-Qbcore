local Ran = false

AddEventHandler("playerSpawned", function ()
	if not Ran then
		ShutdownLoadingScreenNui()
		Ran = true
	end
end)

AddEventHandler("load:finish", function ()
	if not Ran then
		ShutdownLoadingScreenNui()
		Ran = true
	end
end)