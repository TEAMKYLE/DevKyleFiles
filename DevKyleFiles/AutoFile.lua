local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_ky(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
Devky:del(DevKyle.."ky:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_ky(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
Devky:set(DevKyle.."ky:Lock:AutoFile",true) 
end 
end

if (text and not Devky:get(DevKyle.."ky:Lock:AutoFile")) then
Time = Devky:get(DevKyle.."ky:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = Devky:smembers(DevKyle..'ky:Groups') 
local BotName = (Devky:get(DevKyle.."ky:NameBot") or 'بروكس')
local GetJson = '{"BotId": '..DevKyle..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = Devky:get(DevKyle.."ky:Groups:Links"..v)
Welcomes = Devky:get(DevKyle..'ky:Groups:Welcomes'..v) or ''
kyConstructors = Devky:smembers(DevKyle..'ky:kyConstructor:'..v)
BasicConstructors = Devky:smembers(DevKyle..'ky:BasicConstructor:'..v)
Constructors = Devky:smembers(DevKyle..'ky:Constructor:'..v)
Managers = Devky:smembers(DevKyle..'ky:Managers:'..v)
Admis = Devky:smembers(DevKyle..'ky:Admins:'..v)
Vips = Devky:smembers(DevKyle..'ky:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #kyConstructors ~= 0 then
GetJson = GetJson..'"kyConstructors":['
for k,v in pairs(kyConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..DevKyle..'.json', "w")
File:write(GetJson)
File:close()
local abbas = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. abbas .. '" -F "chat_id='..DevId..'" -F "document=@'..DevKyle..'.json' .. '" -F "caption=⌁︙يحتوي الملف على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..DevKyle..'.json')
Devky:set(DevKyle.."ky:AutoFile:Time",os.date("%x"))
end
else 
Devky:set(DevKyle.."ky:AutoFile:Time",os.date("%x"))
end
end

end
return {
DevKyle = AutoFile
}