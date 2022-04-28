local QBCore = exports['qb-core']:GetCoreObject()
local ActivePoliceSmall = Config.CopsSmallJob 	--<< needed policemen to activate the small mission
local ActivePoliceMedium = Config.CopsMediumJob		--<< needed policemen to activate the medium mission
local ActivePoliceLarge = Config.CopsLargeJob	--<< needed policemen to activate the large mission
local cashAS = 250 				--<<how much minimum you can get from a robbery
local cashBS = 500
local cashAM = 750 				--<<how much minimum you can get from a robbery
local cashBM = 1000
local cashAL = 1250 				--<<how much minimum you can get from a robbery
local cashBL = 1500		--<< how much maximum you can get from a robbery
local ActivationCostSmall = Config.ActivationCostSmall --<< how much is the activation of the mission (clean from the bank)
local ActivationCostMedium = Config.ActivationCostMedium --<< how much is the activation of the mission (clean from the bank)
local ActivationCostLarge = Config.ActivationCostLarge	--<< how much is the activation of the mission (clean from the bank)
local ResetTimer = Config.CooldownTime * 60000  --<< timer every how many missions you can do, default is 600 seconds
local ActiveMission = 0

RegisterServerEvent('AttackTransport:StartSmall')
AddEventHandler('AttackTransport:StartSmall', function()
	local copsOnDuty = 0
	local src = source
	local ply = QBCore.Functions.GetPlayer(src)
	local accountMoney = 0
	accountMoney = ply.PlayerData.money["bank"]
if ActiveMission == 0 then
	if accountMoney < ActivationCostSmall then
	TriggerClientEvent('QBCore:Notify', src, "You need $"..ActivationCostSmall.." in the bank to accept the job")
	else
		for k, v in pairs(QBCore.Functions.GetPlayers()) do
			local Player = QBCore.Functions.GetPlayer(v)
			if Player ~= nil then
				if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
					copsOnDuty = copsOnDuty + 1
				end
			end
		end
	if copsOnDuty >= ActivePoliceSmall then
		MissionStart = 1
		TriggerClientEvent("AttackTransport:Small", src)
		ply.Functions.RemoveMoney('bank', ActivationCostSmall, "armored-truck")
		ply.Functions.RemoveItem(Config.RequiredItem, 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RequiredItem], "remove")

		OdpalTimer()
    else
		TriggerClientEvent('QBCore:Notify', src, 'Need at least '..ActivePoliceSmall.. ' cops to activate the job.')
    end
	end
else
TriggerClientEvent('QBCore:Notify', src, 'Someone is already carrying out this job')
end
end)

RegisterServerEvent('AttackTransport:StartMedium')
AddEventHandler('AttackTransport:StartMedium', function()
	local copsOnDuty = 0
	local src = source
	local ply = QBCore.Functions.GetPlayer(src)
	local accountMoney = 0
	accountMoney = ply.PlayerData.money["bank"]
if ActiveMission == 0 then
	if accountMoney < ActivationCostMedium then
	TriggerClientEvent('QBCore:Notify', src, "You need $"..ActivationCostMedium.." in the bank to accept the job")
	else
		for k, v in pairs(QBCore.Functions.GetPlayers()) do
			local Player = QBCore.Functions.GetPlayer(v)
			if Player ~= nil then
				if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
					copsOnDuty = copsOnDuty + 1
				end
			end
		end
	if copsOnDuty >= ActivePoliceMedium then
		MissionStart = 1
		TriggerClientEvent("AttackTransport:Medium", src)
		ply.Functions.RemoveMoney('bank', ActivationCostMedium, "armored-truck")
		ply.Functions.RemoveItem('bonds_mazebank', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bonds_mazebank'], "remove")
		OdpalTimer()
    else
		TriggerClientEvent('QBCore:Notify', src, 'Need at least '..ActivePoliceMedium.. ' cops to activate the job.')
    end
	end
else
TriggerClientEvent('QBCore:Notify', src, 'Someone is already carrying out this job')
end
end)

RegisterServerEvent('AttackTransport:StartLarge')
AddEventHandler('AttackTransport:StartLarge', function()
	local copsOnDuty = 0
	local src = source
	local ply = QBCore.Functions.GetPlayer(src)
	local accountMoney = 0
	accountMoney = ply.PlayerData.money["bank"]
if ActiveMission == 0 then
	if accountMoney < ActivationCostLarge then
	TriggerClientEvent('QBCore:Notify', src, "You need $"..ActivationCostLarge.." in the bank to accept the job")
	else
		for k, v in pairs(QBCore.Functions.GetPlayers()) do
			local Player = QBCore.Functions.GetPlayer(v)
			if Player ~= nil then
				if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
					copsOnDuty = copsOnDuty + 1
				end
			end
		end
	if copsOnDuty >= ActivePoliceLarge then
		MissionStart = 1
		TriggerClientEvent("AttackTransport:Large",src)
		ply.Functions.RemoveMoney('bank', ActivationCostLarge, "armored-truck")
		ply.Functions.RemoveItem('bonds_unionbank', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bonds_unionbank'], "remove")
		OdpalTimer()
    else
		TriggerClientEvent('QBCore:Notify', src, 'Need at least '..ActivePoliceLarge.. ' cops to activate the job.')
    end
	end
else
TriggerClientEvent('QBCore:Notify', src, 'Someone is already carrying out this job')
end
end)

function OdpalTimer()
ActiveMission = 1
Wait(ResetTimer)
ActiveMission = 0
TriggerClientEvent('AttackTransport:CleanUp', -1)
end

RegisterServerEvent('AttackTransport:smallreward')
AddEventHandler('AttackTransport:smallreward', function()
	local src = source
	local ply = QBCore.Functions.GetPlayer(src)
	local bags = Config.PayoutSmall
	local info = {
		worth = math.random(cashAS, cashBS)
	}
	ply.Functions.AddItem('markedbills', bags, false, info)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add")

	local chancebonds = math.random(1, 3)
	if chancebonds == 3 then
	ply.Functions.AddItem('bonds_mazebank', 1, false)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bonds_mazebank'], "add")
	end

	local chance = math.random(1, 300)
	TriggerClientEvent('QBCore:Notify', src, 'You took '..bags..' bags of marked bills from the van')

	if chance >= 295 then
	ply.Functions.AddItem(Config.RewardItem, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RewardItem], "add")
	end


Wait(2500)
end)

RegisterServerEvent('AttackTransport:mediumreward')
AddEventHandler('AttackTransport:mediumreward', function()
	local src = source
	local ply = QBCore.Functions.GetPlayer(src)
	local bags = Config.PayoutMedium
	local info = {
		worth = math.random(cashAM, cashBM)
	}
	ply.Functions.AddItem('markedbills', bags, false, info)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add")

	local chancebonds = math.random(1, 5)
	if chancebonds == 5 then 
	ply.Functions.AddItem('`', 1, false)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bonds_unionbank'], "add")
	end

	local chance = math.random(1, 200)
	TriggerClientEvent('QBCore:Notify', src, 'You took '..bags..' bags of marked bills from the van')

	if chance >= 195 then
	ply.Functions.AddItem(Config.RewardItem, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RewardItem], "add")
	end

Wait(2500)
end)

RegisterServerEvent('AttackTransport:largereward')
AddEventHandler('AttackTransport:largereward', function()
	local src = source
	local ply = QBCore.Functions.GetPlayer(src)
	local bags = Config.PayoutLarge
	local info = {
		worth = math.random(cashAL, cashBL)
	}
	ply.Functions.AddItem('markedbills', bags, false, info)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add")

	local chancebonds = math.random(1, 10)
	if chancebonds == 10 then 
	ply.Functions.AddItem('bonds_unionbank', 1, false)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bonds_unionbank'], "add")
	end

	if chancebonds == 1 then
	ply.Functions.AddItem('bonds_mazebank', 1, false)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bonds_mazebank'], "add")
	end

	local chance = math.random(1, 100)
	TriggerClientEvent('QBCore:Notify', src, 'You took '..bags..' bags of marked bills from the van')

	if chance >= 95 then
	ply.Functions.AddItem(Config.RewardItem, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RewardItem], "add")
	end

Wait(2500)
end)