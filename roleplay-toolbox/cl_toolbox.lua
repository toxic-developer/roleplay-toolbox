-----------------------
-- GrimDesigns 
-- Copyrighted © GrimDesigns 2019
-- Do not redistribute or edit in any way without my permission.
----------------------

--[[------------------------------------------------------------------------

	ActionMenu 
	Created by GrimDesigns
	Additional help from lowheartrate, TheStonedTurtle, and Briglair. 

------------------------------------------------------------------------]]--

--[[------------------------------------------------------------------------
    Resource Rename Fix -- (Via Rhys19)
------------------------------------------------------------------------]]--
Citizen.CreateThread( function()
    Citizen.Wait( 1000 )
    local resourceName = GetCurrentResourceName()
    SendNUIMessage( { resourcename = resourceName } )
end )

-- Define the variable used to open/close the menu 
local menuEnabled = false 

local leoSkins = {
	"s_m_y_cop_01",
    "s_m_y_hwaycop_01",
    "s_m_y_sheriff_01",
    "s_m_y_swat_01",
    "s_m_m_ciasec_01"
}

local fdSkins = {
    "s_m_y_fireman_01",
	"s_m_m_paramedic_01",
}

--[[------------------------------------------------------------------------
	ActionMenu Toggle
	Calling this function will open or close the ActionMenu. 
------------------------------------------------------------------------]]--
function ToggleActionMenu()
	-- Make the menuEnabled variable not itself 
	-- e.g. not true = false, not false = true 
	menuEnabled = not menuEnabled

	if ( menuEnabled ) then 
		-- Focuses on the NUI, the second parameter toggles the 
		-- onscreen mouse cursor. 
		SetNuiFocus( true, true )

		-- Sends a message to the JavaScript side, telling it to 
		-- open the menu. 
		SendNUIMessage({
			showmenu = true 
		})
	else 
		-- Bring the focus back to the game
		SetNuiFocus( false )

		-- Sends a message to the JavaScript side, telling it to
		-- close the menu.
		SendNUIMessage({
			hidemenu = true 
		})
	end 
end 

--[[------------------------------------------------------------------------
	ActionMenu HTML Callbacks
	This will be called every single time the JavaScript side uses the
	sendData function. The name of the data-action is passed as the parameter
	variable data. 
------------------------------------------------------------------------]]--
--[[RegisterNUICallback( "ButtonClick", function( data, cb ) 

	-- [Whitelisting] To remove this add "--[[" on line 77 and "--]]" on line 213.

	-- [Law Enforcement Officer]

	--[[if ( data == "cuff") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
	    drawNotification("~r~You are not a Police officer!")
	elseif ( data == "uncuff") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
	    drawNotification("~r~You are not a Police officer!")
	elseif ( data == "drag") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
	    drawNotification("~r~You are not a Police officer!")
	elseif ( data == "seat") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
	    drawNotification("~r~You are not a Police officer!")
	elseif ( data == "unseat") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
	    drawNotification("~r~You are not a Police officer!")
	elseif ( data == "radar") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "loadout") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "swat") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "hat") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "glasses") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "radio") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "radiogun") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "stance") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "investigate") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "holster") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "citation") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "notes") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "traffic") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "medic") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "weld") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")
	elseif ( data == "notes") and not IsAllowedPed("leo") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not a Police officer!")

	--[[-- [Fire Department/Emergency Services]

	elseif ( data == "seat2") and not IsAllowedPed("fd") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not Fire or EMS!")
	elseif ( data == "unseat2") and not IsAllowedPed("fd") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not Fire or EMS!")
	elseif ( data == "fire") and not IsAllowedPed("fd") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not Fire or EMS!")
	elseif ( data == "medicloadout") and not IsAllowedPed("fd") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not Fire or EMS!")
	elseif ( data == "hat2") and not IsAllowedPed("fd") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not Fire or EMS!")
	elseif ( data == "mask2") and not IsAllowedPed("fd") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not Fire or EMS!")
	elseif ( data == "gloves2") and not IsAllowedPed("fd") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not Fire or EMS!")
	elseif ( data == "glasses2") and not IsAllowedPed("fd") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not Fire or EMS!")
	elseif ( data == "medic2") and not IsAllowedPed("fd") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not Fire or EMS!")
	elseif ( data == "weld2") and not IsAllowedPed("fd") then
		ToggleActionMenu()
	    return
		drawNotification("~r~You are not Fire or EMS!")
	elseif ( data == "notes2") and not IsAllowedPed("fd") then
		ToggleActionMenu()
	    return
	      drawNotification("~r~You are not Fire or EMS!")--]]

   -- [Civ Toolbox]

	elseif ( data == "hands" ) then 
		ToggleActionMenu()
	    return
		TriggerEvent( 'Handsup2' )
	elseif ( data == "kneel" ) then 
		ToggleActionMenu()
	    return
		TriggerEvent( 'KneelHU2')
	elseif ( data == "dropweap") then
		ToggleActionMenu()
		return
		dropweap()

   -- [Civ Toolbox]

   -- [LEO Toolbox]

	elseif ( data == "cuff") then
	    ToggleActionMenu()
		return
		TriggerEvent('cuff')
	elseif ( data == "uncuff") then
	    ToggleActionMenu()
		return
		TriggerEvent('uncuff')
	elseif ( data == "drag") then
		ToggleActionMenu()
		return
		DragPlayer()
	elseif ( data == "seat") then
		ToggleActionMenu()
		return
		PutInVehicle()
	elseif ( data == "unseat") then
		ToggleActionMenu()
		return
		UnseatVehicle()
	elseif ( data == "radar" ) then 
		ToggleActionMenu()
		return
        TriggerEvent( 'wk:radarRC' )

	-- [LEO Toolbox]

	-- [Fire/EMS Toolbox]

    elseif ( data == "seat2") then
	    ToggleActionMenu()
	    return
	    PutInVehicle()
    elseif ( data == "unseat2") then
	    ToggleActionMenu()
	    return
	    UnseatVehicle()

  -- [Vehicle]
    	
	elseif ( data == "engine" ) then 
		EngineToggle()
	elseif ( data == "trunk" ) then 
		TriggerEvent( "openTrunk" )
	elseif ( data == "hood" ) then 
		TriggerEvent( "openHood" )
	elseif ( data == "fleft" ) then 
		TriggerEvent( "frontLeft" )
	elseif ( data == "fright" ) then 
		TriggerEvent( "frontRight" )
	elseif ( data == "rleft" ) then 
		TriggerEvent( "rearLeft" )
	elseif ( data == "rright" ) then
		TriggerEvent( "rearRight" )
	elseif ( data == "fwindows" ) then 
		TriggerEvent( "frontWindow" )
	elseif ( data == "rwindows" ) then 
		TriggerEvent( "rearWindow" )
	elseif ( data == "fix" ) then
	    TriggerEvent( 'fixCar' )
	elseif ( data == "delete" ) then
	    TriggerEvent( 'deleteVehicle' )

  -- [Vehicle]

   -- [Adverts]

   elseif ( data == "ad1" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad1" )
	elseif ( data == "ad2" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad2" )
	elseif ( data == "ad3" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad3" )
	elseif ( data == "ad4" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad4" )
	elseif ( data == "ad5" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad5" )
	elseif ( data == "ad6" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad6" )
	elseif ( data == "ad7" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad7" )
	elseif ( data == "ad8" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad8" )
	elseif ( data == "ad9" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad9" )
	elseif ( data == "ad10" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad10" )
	elseif ( data == "ad11" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad11" )
	elseif ( data == "ad12" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad12" )
	elseif ( data == "ad13" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad13" )
	elseif ( data == "ad14" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad14" )
	elseif ( data == "ad15" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad15" )
	elseif ( data == "ad16" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad16" )
	elseif ( data == "ad17" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad17" )
	elseif ( data == "ad18" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad18" )
	elseif ( data == "ad19" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad19" )
	elseif ( data == "ad20" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad20" )
	elseif ( data == "ad21" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad21" )
	elseif ( data == "ad22" ) then 
	    ToggleActionMenu()
	    return
		TriggerEvent( "ad22" )

   -- [Adverts]

   -- [Emotes]

    elseif ( data == "radio" ) then
	    ToggleActionMenu()
	    return
	    TriggerEvent( 'Radio' )
	elseif ( data == "radiogun" ) then 
		ToggleActionMenu()
	    return
		TriggerEvent( "RadioGunPoint" )
	elseif ( data == "stance" ) then 
		ToggleActionMenu()
	    return
		TriggerEvent( "Stance" )
	elseif ( data == "investigate" ) then 
		ToggleActionMenu()
	    return
		TriggerEvent( "Investigate" )
	elseif ( data == "holster" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Holster' )
	elseif ( data == "citation" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Citation' )
	elseif ( data == "traffic" ) then 
		ToggleActionMenu()
	    return
		TriggerEvent( 'Traffic' )
	elseif ( data == "notes2" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Notes' )
	elseif ( data == "medic2" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Medic' )
	elseif ( data == "weld2" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Weld' )
	elseif ( data == "smoke" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Smoke' )
	elseif ( data == "party" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Party' )
	elseif ( data == "drink" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Drink' )
	elseif ( data == "pushups" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Pushups' )
	elseif ( data == "phone" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Phone' )
	elseif ( data == "injured" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Injured' )
	elseif ( data == "weed" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Weed' )
	elseif ( data == "coffee" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Coffee' )
	elseif ( data == "photo" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Photo' )
	elseif ( data == "binoculars" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Binoculars' )
	elseif ( data == "situps" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Situps' )
	elseif ( data == "film" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Film' )
	elseif ( data == "weights" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Weights' )
	elseif ( data == "flex" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'Flex' )
	elseif ( data == "cancel" ) then 
		ToggleActionMenu()
	    return
	    TriggerEvent( 'cancelEmote' )

   -- [Emotes]

   -- [Outfits]

	elseif ( data == "loadout" ) then 
		leoLoadout()
	elseif ( data == "swat" ) then 
		swatLoadout()
    elseif ( data == "fire" ) then 
		fireLoadout()
	elseif ( data == "medicloadout" ) then 
		emsLoadout()
		--[LEO]
	elseif ( data == "hat" ) then 
		TriggerEvent("haton")
	elseif ( data == "mask" ) then 
		TriggerEvent("maskon")
	elseif ( data == "gloves" ) then 
		TriggerEvent("gloveson")
	elseif ( data == "glasses" ) then 
		TriggerEvent("glasseson")
        --[Fire/EMS]
	elseif ( data == "hat2" ) then 
		TriggerEvent("haton")
	elseif ( data == "mask2" ) then 
		TriggerEvent("maskon")
	elseif ( data == "gloves2" ) then 
		TriggerEvent("gloveson")
	elseif ( data == "glasses2" ) then 
		TriggerEvent("glasseson")

	elseif ( data == "exit" ) then 
		-- We toggle the ActionMenu and return here, otherwise the function 
		-- call below would be executed too, which would just open the menu again 
		ToggleActionMenu()
		return 
	end 

	-- This will only be called if any button other than the exit button is pressed
--	ToggleActionMenu() Uncomment this if you want the menu to close, after selecting an option.
end )

function IsAllowedPed(class)
	success = false
	if class == "leo" then
		for i=1,#leoSkins do
			if GetEntityModel(PlayerPedId()) == GetHashKey(leoSkins[i]) then
				success = true
			end
		end
	elseif class == "fd" then
		for i=1,#fdSkins do
			if GetEntityModel(PlayerPedId()) == GetHashKey(fdSkins[i]) then
				success = true
			end
		end
	end

	return success
end



--[[------------------------------------------------------------------------
	ActionMenu Control and Input Blocking 
	This is the main while loop that opens the ActionMenu on keypress. It 
	uses the input blocking found in the ES Banking resource, credits to 
	the authors.
------------------------------------------------------------------------]]--
Citizen.CreateThread( function()
	-- This is just in case the resources restarted whilst the NUI is focused. 
	SetNuiFocus( false )

	while true do 
		-- Control ID 20 is the 'Z' key by default 
		-- Use https://wiki.fivem.net/wiki/Controls to find a different key 
		if ( IsControlJustReleased( 0, 118 ) or IsDisabledControlJustReleased( 0, 118 ) ) and GetLastInputMethod( 0 ) then 
			ToggleActionMenu()
		end 

	    if ( menuEnabled ) then
            local ped = GetPlayerPed( -1 )	

            DisableControlAction( 0, 1, true ) -- LookLeftRight
            DisableControlAction( 0, 2, true ) -- LookUpDown
            DisableControlAction( 0, 24, true ) -- Attack
            DisablePlayerFiring( ped, true ) -- Disable weapon firing
            DisableControlAction( 0, 142, true ) -- MeleeAttackAlternate
            DisableControlAction( 0, 106, true ) -- VehicleMouseControlOverride
        end

		Citizen.Wait( 0 )
	end 
end )

---------------- Put your hands up ----------------

RegisterNetEvent("Handsup2")
AddEventHandler("Handsup2", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict("random@arrests")
			while not HasAnimDictLoaded("random@arrests") do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, "random@arrests", "idle_2_hands_up", 3) then
				ClearPedSecondaryTask(lPed)
				SetEnableHandcuffs(lPed, false)
			else
				TaskPlayAnim(lPed, "random@arrests", "idle_2_hands_up", 8.0, -8, -1, 49, 0, 0, 0, 0)
				SetEnableHandcuffs(lPed, true)
			end
		end)
	end
end)

---------------- Put your hands up ----------------

--------------- Kneel with hands up ----------------

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent( 'KneelHU2' )
AddEventHandler( 'KneelHU2', function()
    local player = GetPlayerPed( -1 )
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        loadAnimDict( "random@arrests" )
		loadAnimDict( "random@arrests@busted" )
		if ( IsEntityPlayingAnim( player, "random@arrests", "kneeling_arrest_idle", 3 ) ) then 
			TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (3000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			--[[Wait (500)
			TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )--]]
        end     
    end
end )

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(0,21,true)
		end
	end
end)

---------------- Kneel with hands up ----------------


function drawNotification(text) --Just Don't Edit!
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

--[LEO Animations Start]

-- Hand on Radio Start

RegisterNetEvent('Radio')
AddEventHandler('Radio', function()

local ped = GetPlayerPed( -1 )
    
if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 

Citizen.CreateThread( function()
	RequestAnimDict( "random@arrests" )
	   while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
                Citizen.Wait( 100 )
            end
				if IsEntityPlayingAnim(ped, "random@arrests", "generic_radio_chatter", 3) then
				ClearPedSecondaryTask(ped)
				SetCurrentPedWeapon(ped, GetHashKey("GENERIC_RADIO_CHATTER"), true)
				else
				TaskPlayAnim(ped, "random@arrests", "generic_radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetCurrentPedWeapon(ped, GetHashKey("GENERIC_RADIO_CHATTER"), true)
            end 
        end )
    end 
end )

-- Hand on Radio End

-- Hand on Radio W/ Gun Start

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent( 'RadioGunPoint' )
AddEventHandler( 'RadioGunPoint', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
        loadAnimDict( "random@arrests" )
        if ( IsEntityPlayingAnim( ped, "random@arrests", "radio_chatter", 3 ) ) then
				ClearPedSecondaryTask(ped)
				SetEnableHandcuffs(ped, false)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
				TaskPlayAnim(ped, "random@arrests", "radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_PISTOL"), true)
        end    
    end
end )
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "radio_chatter", 3) then
            DisableControlAction(0, 21, true)
			DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

-- Hand on Radio W/ Gun End

-- LEO Stance Start

RegisterNetEvent('Stance')
AddEventHandler('Stance', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_COP_IDLES", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- LEO Stance End

-- Investigate Start

RegisterNetEvent('Investigate')
AddEventHandler('Investigate', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GUARD_STAND", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Investigate End

-- Holster Start

RegisterNetEvent( 'Holster' )
AddEventHandler( 'Holster', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
        loadAnimDict( "move_m@intimidation@cop@unarmed" )
        if ( IsEntityPlayingAnim( ped, "move_m@intimidation@cop@unarmed", "idle", 3 ) ) then
				ClearPedSecondaryTask(ped)
				SetEnableHandcuffs(ped, false)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
				TaskPlayAnim(ped, "move_m@intimidation@cop@unarmed", "idle", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetEnableHandcuffs(ped, true)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        end    
    end
end )
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "move_m@intimidation@cop@unarmed", "idle", 3) then
            DisableControlAction(0, 21, true)
			DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

-- Holster End

-- Citation Start


RegisterNetEvent('Citation')
AddEventHandler('Citation', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_TIME_OF_DEATH", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Citation End

-- Take Notes Start


RegisterNetEvent('Notes')
AddEventHandler('Notes', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Take Notes End


-- Welding Start

RegisterNetEvent('Weld')
AddEventHandler('Weld', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_WELDING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Welding End

-- Direct Traffic Start


RegisterNetEvent('Traffic')
AddEventHandler('Traffic', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CAR_PARK_ATTENDANT", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Direct Traffic End

-- Medic Observe Start


RegisterNetEvent('Medic')
AddEventHandler('Medic', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Medic Observe End

-- Cancel Emote

RegisterNetEvent( 'cancelEmote' )
AddEventHandler( 'cancelEmote', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
	    ClearPedSecondaryTask(ped)
        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)  
    end
end )

--[LEO Animations End]

-- Drop Weapon

function dropweap()
    local ped = PlayerPedId()
            local wep = GetSelectedPedWeapon(ped)
            SetPedDropsWeaponsWhenDead(ped, true)
            RequestAnimDict("mp_weapon_drop")
            if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) and not IsPauseMenuActive() and IsPedArmed(ped, 7) then -- INPUT_DROP_WEAPON (F7)
            TaskPlayAnim(ped, "mp_weapon_drop", "drop_bh", 8.0, 2.0, -1, 0, 2.0, 0, 0, 0 )
            SetPedDropsInventoryWeapon(ped, wep, 0, 2.0, 0, -1)
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
			drawNotification("~w~You dropped your weapon.")
        end
end

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

-------------------------------------]

---------------- LEO Functions ----------------

function leoLoadout()
    Citizen.CreateThread(function()
		local ped = GetPlayerPed(-1)
	    GiveWeaponToPed(ped, 1593441988, 1000, true, false)
        GiveWeaponComponentToPed(ped, 1593441988, 899381934)
        GiveWeaponToPed(ped, 911657153, 1000, true, false)
        GiveWeaponToPed(ped, 1737195953, 1000, true, false)
        GiveWeaponToPed(ped, 2343591895, 1000, true, false)
    end)
end

function swatLoadout()
    Citizen.CreateThread(function()
        local swatModel = GetHashKey("s_m_y_swat_01")
        RequestModel(swatModel)
        while not HasModelLoaded(swatModel) do
            Wait(0)
        end
        if HasModelLoaded(swatModel) then
            SetPlayerModel(PlayerId(), swatModel)
        else
	   drawNotification("The model could not load - if you see this contact development.")
		end
		local ped = GetPlayerPed(-1)
	    GiveWeaponToPed(ped, 1593441988, 1000, true, false)
        GiveWeaponComponentToPed(ped, 1593441988, 899381934)
        GiveWeaponToPed(ped, 911657153, 1000, true, false)
        GiveWeaponToPed(ped, 1737195953, 1000, true, false)
        GiveWeaponToPed(ped, 2343591895, 1000, true, false)
	    GiveWeaponToPed(ped, 4256991824, 1000, true ,false)
	    GiveWeaponToPed(ped, 2210333304, 1000, true ,false)
	    GiveWeaponComponentToPed(ped, 2210333304, 0xC164F53)
	    GiveWeaponComponentToPed(ped, 2210333304, 0x7BC4CDDC)
	    GiveWeaponToPed(ped, 487013001, 1000, true ,false)
	    GiveWeaponComponentToPed(ped, 487013001, 0x7BC4CDDC)
	    GiveWeaponToPed(ped, 736523883, 1000, true ,false)
	    GiveWeaponToPed(ped, 1305664598, 1000, true ,false)
    end)
end

function fireLoadout()
    Citizen.CreateThread(function()
		local ped = PlayerPedId()
	    GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
	    GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_STUNGUN"), 1000, false)
		GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_FIREEXTINGUISHER"), 1000, false)
		GiveWeaponToPed(PlayerPedId(), 1233104067, 1000, false)
		GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), 1000, false)
    end)
end

function emsLoadout()
    Citizen.CreateThread(function()
		local ped = PlayerPedId()
	    GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
	    GiveWeaponToPed(PlayerPedId(), 1233104067, 1000, false)
    end)
end

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)

	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end

	return closestPlayer, closestDistance
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

local isHandcuffed = false

local drag = false
local playerStillDragged = false
local officerDrag = -1

RegisterNetEvent('cuff')
AddEventHandler('cuff',function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("cuffGranted", GetPlayerServerId(t))
	else
    	drawNotification("There is no nearby player to cuff!")
	end
end)

RegisterNetEvent('uncuff')
AddEventHandler('uncuff',function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("uncuffGranted", GetPlayerServerId(t))
	else
    	drawNotification("There is no nearby player to uncuff!")
	end
end)

RegisterNetEvent('getCuffed')
AddEventHandler('getCuffed', function()
	local ped = GetPlayerPed(-1)
	RequestAnimDict('mp_arresting')
	while not HasAnimDictLoaded('mp_arresting') do
		Citizen.Wait(100)
	end
	
	TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
	SetEnableHandcuffs(ped, true)
	SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
	DisablePlayerFiring(ped, true)
	FreezeEntityPosition(ped, true)
	DisableControlAction(0,32, true) -- W
	DisableControlAction(0,33, true) -- S
       DisableControlAction(0,34, true) -- A
	DisableControlAction(0,35, true) -- D
	
	isHandcuffed = true
end)

RegisterNetEvent('getUncuffed')
AddEventHandler('getUncuffed', function()
	local ped = GetPlayerPed(-1)

	ClearPedSecondaryTask(ped)
	SetEnableHandcuffs(ped, false)
	SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
	FreezeEntityPosition(ped, false)
	
	isHandcuffed = false
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
		
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			if IsPedInAnyVehicle(GetPlayerPed(PlayerId()), false) then
				DisableControlAction(0, 59, true)
			end
		end

		if drag then
			local ped = GetPlayerPed(GetPlayerFromServerId(officerDrag))
			local myped = GetPlayerPed(-1)
			AttachEntityToEntity(myped, ped, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			playerStillDragged = true

			RequestAnimDict('mp_arresting')

			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(0)
			end

			local myPed = PlayerPedId(-1)
			local animation = 'idle'
			local flags = 49

			while(IsPedBeingStunned(myPed, 0)) do
				ClearPedTasksImmediately(myPed)
			end
			TaskPlayAnim(myPed, 'mp_arresting', animation, 8.0, -8, -1, flags, 0, 0, 0, 0)

		else
			if(playerStillDragged) then
				DetachEntity(GetPlayerPed(-1), true, false)
				playerStillDragged = false
			end
		end
		
end
end)

function DragPlayer()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("dragRequest", GetPlayerServerId(t))
	else
    	drawNotification("There is no nearby player to drag!")
	end
end

RegisterNetEvent('toggleDrag')
AddEventHandler('toggleDrag', function(t)

		drag = not drag
		officerDrag = t
end)

Citizen.CreateThread(function()
	while true do
		if drag then
			local ped = GetPlayerPed(GetPlayerFromServerId(playerPedDragged))
			plyPos = GetEntityCoords(ped,  true)
			SetEntityCoords(ped, plyPos.x, plyPos.y, plyPos.z)
		end
		Citizen.Wait(1000)
	end
end)

function PutInVehicle()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		local v = GetVehiclePedIsIn(GetPlayerPed(-1), true)
		TriggerServerEvent("forceEnterAsk", GetPlayerServerId(t), v)
	else
    	drawNotification("There is no nearby player to seat!")
	end
end

RegisterNetEvent('forcedEnteringVeh')
AddEventHandler('forcedEnteringVeh', function(veh)

		local pos = GetEntityCoords(GetPlayerPed(-1))
		local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

		local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
		local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)

		if vehicleHandle ~= nil then
			SetPedIntoVehicle(GetPlayerPed(-1), vehicleHandle, 1)
		end
end)

function UnseatVehicle()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("confirmUnseat", GetPlayerServerId(t))
	else
    	drawNotification("There is no nearby player to unseat!")
	end
end

RegisterNetEvent('unseatme')
AddEventHandler('unseatme', function(t)
	local ped = GetPlayerPed(t)
	ClearPedTasksImmediately(ped)
	plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
	local xnew = plyPos.x+2
	local ynew = plyPos.y+2

	SetEntityCoords(GetPlayerPed(-1), xnew, ynew, plyPos.z)
end)

-- [Credit to Monty Piper]

local hwaycop = GetHashKey("s_m_y_hwaycop_01")
local cop = GetHashKey("s_m_y_cop_01")
local sheriff = GetHashKey("s_m_y_sheriff_01")
local fireman = GetHashKey("s_m_y_fireman_01")
local medic = GetHashKey("s_m_m_paramedic_01")

hat = false

RegisterNetEvent( 'haton' )
AddEventHandler( 'haton', function()
	hat = not hat
	if(GetEntityModel(PlayerPedId()) == hwaycop) then
		if hat then
			SetPedPropIndex(PlayerPedId(), 0, 01, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 0)
		end
	elseif(GetEntityModel(PlayerPedId()) == cop) then
		if hat then
			SetPedPropIndex(PlayerPedId(), 0, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 0)
		end
	elseif(GetEntityModel(PlayerPedId()) == sheriff) then
		if hat then
			SetPedPropIndex(PlayerPedId(), 0, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 0)
		end
	elseif (GetEntityModel(PlayerPedId()) == fireman) then
		if hat then
			SetPedPropIndex(PlayerPedId(), 0, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 0)
		end
	elseif (GetEntityModel(PlayerPedId()) == medic) then
		if hat then
			SetPedPropIndex(PlayerPedId(), 0, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 0)
		end
	end
end)

vest = false

RegisterNetEvent('veston')
AddEventHandler('veston', function()
	vest = not vest
	if (GetEntityModel(PlayerPedId()) == hwaycop) then
		if vest then
			SetPedComponentVariation(PlayerPedId(), 8, 1, 1, 1)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
		end
	elseif (GetEntityModel(PlayerPedId()) == cop) then
		if vest then
			SetPedComponentVariation(PlayerPedId(), 9, 2, 0, 1)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
		end
	elseif (GetEntityModel(PlayerPedId()) == sheriff) then
		if vest then
			SetPedComponentVariation(PlayerPedId(), 9, 2, 0, 1)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
		end
	end
end)

mask = false

RegisterNetEvent( 'maskon' )
AddEventHandler( 'maskon', function()
	    if (GetEntityModel(PlayerPedId()) == fireman) then
		mask = not mask
		if mask then
			SetPedComponentVariation(PlayerPedId(), 8, 1, 1, 1)
			SetPlayerInvincible(PlayerPedId(), true)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
			SetPlayerInvincible(PlayerPedId(), false)
		end
	end
end)

gloves = false

RegisterNetEvent( 'gloveson')
AddEventHandler( 'gloveson', function()
	if (GetEntityModel(PlayerPedId()) == medic) then
		gloves = not gloves
		if gloves then
			SetPedComponentVariation(PlayerPedId(), 5, 1, 0, 1)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
		end
	end
end)

glasses = false

  RegisterNetEvent( 'glasseson' )
AddEventHandler( 'glasseson', function()
	glasses = not glasses
	if(GetEntityModel(PlayerPedId()) == hwaycop) then
		if glasses then
			SetPedPropIndex(PlayerPedId(), 1, 0, 1, 2)
		else
			ClearPedProp(PlayerPedId(), 1)
		end
	elseif(GetEntityModel(PlayerPedId()) == cop) then
		if glasses then
			SetPedPropIndex(PlayerPedId(), 1, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 1)
		end
	elseif(GetEntityModel(PlayerPedId()) == sheriff) then
		if glasses then
			SetPedPropIndex(PlayerPedId(), 1, 1, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 1)
		end
	elseif(GetEntityModel(PlayerPedId()) == medic) then
		if glasses then
			SetPedPropIndex(PlayerPedId(), 1, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 1)
		end
	end
end)

-- [Credit to Monty Piper]

---------------- LEO Functions ----------------

-- [Adverts]

-- ADVERTISMENTS
RegisterNetEvent("ad1")
AddEventHandler("ad1",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad1', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad1')
AddEventHandler('displayad1',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "247", true, 1, "~y~24/7 Store~s~", "Phone Notification");
DrawNotification(false, true);

end)

--
RegisterNetEvent("ad2")
AddEventHandler("ad2",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad2', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad2')
AddEventHandler('displayad2',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_AMMUNATION", "CHAR_AMMUNATION", true, 1, "~y~Ammunation~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad3")
AddEventHandler("ad3",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad3', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad3')
AddEventHandler('displayad3',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "NEWS", true, 1, "~y~Weazel News~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad4")
AddEventHandler("ad4",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad4', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad4')
AddEventHandler('displayad4',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_MP_STRIPCLUB_PR", "CHAR_MP_STRIPCLUB_PR", true, 1, "~y~Vanilla Unicorn~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad5")
AddEventHandler("ad5",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad5', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad5')
AddEventHandler('displayad5',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_TAXI", "CHAR_TAXI", true, 1, "~y~Downtown Cab Co.~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad6")
AddEventHandler("ad6",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad6', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad6')
AddEventHandler('displayad6',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_LS_TOURIST_BOARD", "CHAR_LS_TOURIST_BOARD", true, 1, "~y~Los Santos Traffic Info~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad7")
AddEventHandler("ad7",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad7', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad7')
AddEventHandler('displayad7',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "~y~Los Santos Customs~s~", "Phone Notification");
DrawNotification(false, true);

end)

--
RegisterNetEvent("ad8")
AddEventHandler("ad8",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad8', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad8')
AddEventHandler('displayad8',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "ACE", true, 1, "~y~Ace Liquor~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad9")
AddEventHandler("ad9",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad9', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad9')
AddEventHandler('displayad9',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "LTD", true, 1, "~y~Limited Gasoline~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad10")
AddEventHandler("ad10",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad10', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad10')
AddEventHandler('displayad10',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "POSTAL", true, 1, "~y~GoPostal~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad11")
AddEventHandler("ad11",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad11', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad11')
AddEventHandler('displayad11',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "NA", true, 1, "~y~Hayes Auto~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad12")
AddEventHandler("ad12",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad12', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad12')
AddEventHandler('displayad12',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "VAN", true, 1, "~y~Vangelico~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad13")
AddEventHandler("ad13",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad13', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad13')
AddEventHandler('displayad13',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "BELL", true, 1, "~y~Cluckin' Bell~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad14")
AddEventHandler("ad14",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad14', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad14')
AddEventHandler('displayad14',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "BUG", true, 1, "~y~Bugstars~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad15")
AddEventHandler("ad15",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad15', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad15')
AddEventHandler('displayad15',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_BANK_FLEECA", "CHAR_BANK_FLEECA", true, 1, "~y~Fleeca Bank~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad16")
AddEventHandler("ad16",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad16', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad16')
AddEventHandler('displayad16',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "NA", true, 1, "~y~Echo Sechs~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad17")
AddEventHandler("ad17",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad17', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad17')
AddEventHandler('displayad17',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_MP_MORS_MUTUAL", "CHAR_MP_MORS_MUTUAL", true, 1, "~y~Mors Mutual Insurance~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad18")
AddEventHandler("ad18",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad18', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad18')
AddEventHandler('displayad18',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "OP", true, 1, "~y~PostOP~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad19")
AddEventHandler("ad19",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad19', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad19')
AddEventHandler('displayad19',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "EXOTIC", true, 1, "~y~Auto Exotic~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad20")
AddEventHandler("ad20",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad20', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad20')
AddEventHandler('displayad20',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "LSWP", true, 1, "~y~Los Santos Water and Power~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
--
RegisterNetEvent("ad21")
AddEventHandler("ad21",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad21', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad21')
AddEventHandler('displayad21',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "D8", true, 1, "~y~Dynasty 8~s~", "Phone Notification");
DrawNotification(false, true);

end)

RegisterNetEvent("ad22")
AddEventHandler("ad22",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad22', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad22')
AddEventHandler('displayad22',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "UBER", true, 1, "~y~Uber~s~", "Phone Notification");
DrawNotification(false, true);

end)

-- END OF ADVERTISMENTS

-- [Outfits]

---------------- Engine Vehicle ----------------

function EngineToggle()

    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
	
	if IsPedInAnyVehicle(ped) then
        if IsVehicleEngineOn(veh) then
            SetVehicleEngineOn(veh, false, false, true)
            SetVehicleUndriveable(veh, true)
		    drawNotification('~r~Your engine has been turned off.')
        else
            SetVehicleEngineOn(veh, true, false, true)
            SetVehicleUndriveable(veh, false)
		    drawNotification('~g~Your engine has been turned on.')
        end
	else
	    drawNotification('~r~You are not in a vehicle.')
	end
end

---------------- Engine Vehicle ----------------

---------------- Windows ----------------

-- Front Windows Start

local windowup = true
RegisterNetEvent("frontWindow")
AddEventHandler('frontWindow', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
		
			if ( windowup ) then
				RollDownWindow(playerCar, 0)
				RollDownWindow(playerCar, 1)
				drawNotification("You rolled down your front windows.")
				windowup = false
			else
				RollUpWindow(playerCar, 0)
				RollUpWindow(playerCar, 1)
				drawNotification("You rolled up your front windows.")
				windowup = true
			end
		end
	else
		drawNotification('~r~You are not in a vehicle.')
	end
end )

-- Front Windows End

-- Rear Windows Start

local windowup = true
RegisterNetEvent("rearWindow")
AddEventHandler('rearWindow', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
		
			if ( windowup ) then
				RollDownWindow(playerCar, 2)
				RollDownWindow(playerCar, 3)
				drawNotification("~w~You rolled down your rear windows.")
				windowup = false
			else
				RollUpWindow(playerCar, 2)
				RollUpWindow(playerCar, 3)
				drawNotification("~w~You rolled up your rear windows.")
				windowup = true
			end
		end
	else
		drawNotification('~r~You are not in a vehicle.')
	end
end )

-- Rear Windows End

---------------- Windows ----------------

---------------- Doors ----------------

-- Front Left
RegisterNetEvent( 'frontLeft' )
AddEventHandler( 'frontLeft', function()

    local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)

	if IsPedInAnyVehicle(ped) then
	    if veh ~= nil and veh ~= 0 and veh ~= 1 then
            if GetVehicleDoorAngleRatio(veh, 0) > 0 then
                SetVehicleDoorShut(veh, 0, false)
			    drawNotification("~w~You closed the front left door.")
            else
                SetVehicleDoorOpen(veh, 0, false, false)
			    drawNotification("~w~You opened the front left door.")
			end
		end
	else
		drawNotification('~r~You are not in a vehicle.')
	end
end, false)

-- Front Right

RegisterNetEvent( 'frontRight' )
AddEventHandler( 'frontRight', function()

    local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)

	if IsPedInAnyVehicle(ped) then
	    if veh ~= nil and veh ~= 0 and veh ~= 1 then
            if GetVehicleDoorAngleRatio(veh, 1) > 0 then
                SetVehicleDoorShut(veh, 1, false)
			    drawNotification("~w~You closed the front right door.")
            else
                SetVehicleDoorOpen(veh, 1, false, false)
			    drawNotification("~w~You opened the front right door.")
			end
		end
	else
		drawNotification('~r~You are not in a vehicle.')
	end
end, false)

-- Rear Left

RegisterNetEvent( 'rearLeft' )
AddEventHandler( 'rearLeft', function()

    local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)

	if IsPedInAnyVehicle(ped) then
	    if veh ~= nil and veh ~= 0 and veh ~= 1 then
            if GetVehicleDoorAngleRatio(veh, 2) > 0 then
                SetVehicleDoorShut(veh, 2, false)
			    drawNotification("~w~You closed the rear left door.")
            else
                SetVehicleDoorOpen(veh, 2, false, false)
			    drawNotification("~w~You opened the rear left door.")
			end
		end
	else
		drawNotification('~r~You are not in a vehicle.')
	end
end, false)

-- Rear Right

RegisterNetEvent( 'rearRight' )
AddEventHandler( 'rearRight', function()

    local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)

	if IsPedInAnyVehicle(ped) then
	    if veh ~= nil and veh ~= 0 and veh ~= 1 then
            if GetVehicleDoorAngleRatio(veh, 3) > 0 then
                SetVehicleDoorShut(veh, 3, false)
			    drawNotification("~w~You closed the rear right door.")
            else
                SetVehicleDoorOpen(veh, 3, false, false)
			    drawNotification("~w~You opened the rear right door.")
			end
		end
	else
		drawNotification('~r~You are not in a vehicle.')
	end
end, false)

-- Trunk

RegisterNetEvent( 'openTrunk' )
AddEventHandler( 'openTrunk', function()

    local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)

	if IsPedInAnyVehicle(ped) then
	    if veh ~= nil and veh ~= 0 and veh ~= 1 then
            if GetVehicleDoorAngleRatio(veh, 5) > 0 then
                SetVehicleDoorShut(veh, 5, false)
			    drawNotification("~w~You closed your trunk.")
            else
                SetVehicleDoorOpen(veh, 5, false, false)
			    drawNotification("~w~You opened your trunk.")
			end
		end
	else
		drawNotification('~r~You are not in a vehicle.')
	end
end, false)

-- Hood

RegisterNetEvent( 'openHood' )
AddEventHandler( 'openHood', function()

    local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)

	if IsPedInAnyVehicle(ped) then
	    if veh ~= nil and veh ~= 0 and veh ~= 1 then
            if GetVehicleDoorAngleRatio(veh, 4) > 0 then
                SetVehicleDoorShut(veh, 4, false)
			    drawNotification("~w~You closed your hood.")
            else
                SetVehicleDoorOpen(veh, 4, false, false)
			    drawNotification("~w~You opened your hood.")
			end
		end
	else
		drawNotification('~r~You are not in a vehicle.')
	end
end, false)

---------------- Doors ----------------

---------------- Fix ----------------

RegisterNetEvent("fixCar")
AddEventHandler("fixCar", function()
	local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsIn(ped)
		EngineRepair()
		FreezeEntityPosition(GetVehiclePedIsUsing(ped), true)
		    drawNotification("~g~The mechanic's working on your car. It should take around 15 seconds to complete.")
			Citizen.Wait(15000)
		FreezeEntityPosition(GetVehiclePedIsUsing(ped), false)
		SetVehicleEngineHealth(vehicle, 9999)
		SetVehiclePetrolTankHealth(vehicle, 9999)
		SetVehicleFixed(vehicle)
		EngineRepair()
		    drawNotification("~g~Your vehicle has been fixed.")
	else
		drawNotification("~r~You are not in a vehicle.")
	end
end)

function EngineRepair()
    ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
    if IsVehicleEngineOn(veh) then
        SetVehicleEngineOn(veh, false, false, true)
        SetVehicleUndriveable(veh, true)
    else
        SetVehicleEngineOn(veh, true, false, true)
        SetVehicleUndriveable(veh, false)
    end
end

---------------- Fix ----------------

---------------- Delete Vehicle ----------------

RegisterNetEvent( 'deleteVehicle' )

local distanceToCheck = 5.0

AddEventHandler( 'deleteVehicle', function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then
                	ShowNotification( "~r~Unable to delete vehicle, try again." )
                else
                	ShowNotification( "~g~Success: ~w~Vehicle deleted." )
                end
            else
                ShowNotification( "You must be in the driver's seat!" )
            end
        else
            local playerPos = GetEntityCoords( ped, 1 )
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then
                	ShowNotification( "~r~Unable to delete vehicle, try again." )
                else
                	ShowNotification( "~g~Success: ~w~Vehicle deleted." )
                end
            else
                ShowNotification( "You must be in or near a vehicle to delete it." )
            end
        end
    end
end )

-- Delete car function borrowed frtom Mr.Scammer's model blacklist, thanks to him!
function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

---------------- Delete Vehicle ----------------

-- Civ Emotes Start  --

RegisterNetEvent('Smoke')
AddEventHandler('Smoke', function()

local emotePlaying = IsPedActiveInScenario(GetPlayerPed(-1))
local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )
--]]
RegisterNetEvent('Party')
AddEventHandler('Party', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PARTYING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Drink')
AddEventHandler('Drink', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_DRINKING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Pushups')
AddEventHandler('Pushups', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PUSH_UPS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Phone')
AddEventHandler('Phone', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_MOBILE", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Injured')
AddEventHandler('Injured', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SUNBATHE_BACK", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Weed')
AddEventHandler('Weed', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Coffee')
AddEventHandler('Coffee', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_AA_COFFEE", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Photo')
AddEventHandler('Photo', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PAPARAZZI", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Binoculars')
AddEventHandler('Binoculars', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_BINOCULARS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Situps')
AddEventHandler('Situps', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SIT_UPS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Film')
AddEventHandler('Film', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Weights')
AddEventHandler('Weights', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Flex')
AddEventHandler('Flex', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MUSCLE_FLEX", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

-- Civ Emotes End --

-- Emote Cancel Functions

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_PARTYING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_PUSH_UPS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_STAND_MOBILE") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SUNBATHE_BACK") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_AA_COFFEE") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_PAPARAZZI") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_BINOCULARS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SIT_UPS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_MOBILE_FILM_SHOCKING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_MUSCLE_FLEX") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_COP_IDLES") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_GUARD_STAND") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TIME_OF_DEATH") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasdwks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_CLIPBOARD") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_WELDING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_CAR_PARK_ATTENDANT") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_KNEEL") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

-- Emote Cancel Functions

function drawNotification(text) --Just Don't Edit!
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
 
function tablelength(T) --Just Don't Edit!
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end
 
function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

-----------------------
-- GrimDesigns 
-- Copyrighted © GrimDesigns 2019
-- Do not redistribute or edit in any way without my permission.
----------------------
