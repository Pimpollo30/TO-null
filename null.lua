 executeSQLQuery("CREATE TABLE IF NOT EXISTS null_Bitch (serial INT)")

--09/03/2017

local excludeSerials = {
["01361348E5EA6A0E8387CBDDAF7ED644"] = true,
["BDAFDE181C5A1AB772A849C05CC8FB12"] = true,
["56376F71F3BF38685D1038847CDB02E3"] = true,
["B3C8AA76BB2C52C1AB7EBA72A8B2FEA3"] = true,
["0383B5412E806E3A16DFB06A57EF7C62"] = true,
["134FA854FA746B0BD81FEACB6AE37C13"] = true,
["0F66289EE4226072919F4F1BFFD464A2"] = true,
["AA3F52D9ACCFDFE21B7C581B695CBAB2"] = true,
["748F851AB0783927950C78B74B242434"] = true,
["94B0F03EBA8468C1EE99FFB07B0289B2"] = true,
}



function bitchConnect(playerNick, playerIP, playerUsername, playerSerial, playerVersionNumber)
local flag = exports.admin:getPlayerCountry (getPlayerFromName(playerNick))
if flag then
if flag == "PE" then
if excludeSerials[playerSerial] then
--//Exclude!
else
cancelEvent(true,"You were kicked from the game (SD #4 LNK8. [Trainer])")
query = executeSQLQuery("SELECT * FROM null_Bitch WHERE serial = ?",playerSerial)
if (#query == 0) then
executeSQLQuery("INSERT INTO null_Bitch VALUES ('"..playerSerial.."')")
end
end
end
end
end
addEventHandler("onPlayerConnect",root,bitchConnect)


function connect2(playerNick, playerIP, playerUsername, playerSerial, playerVersionNumber)
query = executeSQLQuery("SELECT * FROM null_Bitch WHERE serial = ?",playerSerial)
if (#query > 0) then
cancelEvent(true,"You were kicked from the game (SD #4 LNK8. [Trainer])")
end
end
addEventHandler("onPlayerConnect",root,connect2)

function start()
for i,v in ipairs(getElementsByType("player")) do
playerSerial = getPlayerSerial(v)
local flag = exports.admin:getPlayerCountry (v)
if flag then
if flag == "PE" then
if excludeSerials[playerSerial] then
--//Exclude!
else
kickPlayer(v,"You were kicked from the game (SD #4 LNK8. [Trainer])")
query = executeSQLQuery("SELECT * FROM null_Bitch WHERE serial = ?",playerSerial)
if (#query == 0) then
executeSQLQuery("INSERT INTO null_Bitch VALUES ('"..playerSerial.."')")
end
end
end
end
end
end
addEventHandler("onResourceStart",root,start)



