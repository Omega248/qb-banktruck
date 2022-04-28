Config = {}

Config.FrontSeatsGun = "WEAPON_COMBATPISTOL"

Config.BackSeatsGun = "WEAPON_SMG"

Config.TimeToBlow = 30 -- time in Seconds

Config.PedModelSmall = 's_m_m_security_01'

Config.PedLocationSmall = vector4(-195.85, -833.05, 30.75, 298.75)  

Config.PedModelMedium = 'g_m_y_korlieut_01'

Config.PedLocationMedium = vector4(-50.63, -821.17, 44.04, 265.26)

Config.PedModelLarge = 'ig_bankman'

Config.PedLocationLarge = vector4(11.75, -661.49, 33.45, 94.29)

Config.PackingTimeLow = math.random(60,90) -- time it takes to pack all the money into the bag. Its 1000x so every 1 = 1 second

Config.PackingTimeMedium = math.random(90,150) -- time it takes to pack all the money into the bag. Its 1000x so every 1 = 1 second

Config.PackingTimeHigh = math.random(120,180) -- time it takes to pack all the money into the bag. Its 1000x so every 1 = 1 second

Config.ActivationCostSmall = 500 -- This number = $500 clean from the players bank

Config.ActivationCostMedium = 1000 -- This number = $1000 clean from the players bank

Config.ActivationCostLarge = 2000 -- This number = $2000 clean from the players bank

Config.CooldownTime = 45 -- This number = cooldowntimer on the job in mins

Config.CopsSmallJob = 0 -- Cops required to start the small job

Config.CopsMediumJob = 0 -- Cops required to start the Medium job

Config.CopsLargeJob = 0 -- Cops required to start the Large job

Config.RequiredItem = 'security_card_01'

Config.RewardItem = 'security_card_02' 

Config.PayoutSmall = math.random(1,3) -- the numbers = bags of marked bills

Config.PayoutMedium = math.random(3,5) -- the numbers = bags of marked bills

Config.PayoutLarge = math.random(5,8) -- the numbers = bags of marked bills