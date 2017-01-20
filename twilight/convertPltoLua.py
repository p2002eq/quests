#used to convert basic pl to lua for quests I made it for event_say and event_trade might add more later
import linecache
import glob
import re


def writeFunction(file_in, line_num):
    isText = False
    isTrade = False
    bracketInWrongSpot = False
    openBrack = 1
    str = linecache.getline(file_in.name, line_num)
    if "{" not in str:
        bracketInWrongSpot = True
    str = str.replace("{", "")
    str = str.replace("sub", "")
    if "SAY" in str:
        isText = True
        out.write("function event_say(e)\n")
    elif "ITEM" in str:
        out.write("function event_trade(e)\n")
        out.write("local item_lib = require('items');\n")
        isTrade = True

    while openBrack != 0:
        line_num+=1
        str = linecache.getline(file_in.name, line_num)
        if isText:
            if "$text" in str:
                textToSay = re.search('=~|=~ \/(.*)/', str)
                if textToSay is not None:
                    textToSay = textToSay.group(1)
                    out.write("\tif(e.message:findi(\"%s\")) then\n" % (textToSay))
            elif "quest::say" in str:
                textToSay = re.search('quest::say\(\"([^\"]*)', str)
                textToSay = textToSay.group(1)
                out.write("\t\te.self.Say(\"%s\");\n" % (textToSay))
                out.write("\tend\n")
            elif "quest::emote" in str:
                textToSay = re.search('quest::emote\(\"([^\"]*)', str)
                textToSay = textToSay.group(1)
                out.write("\t\te.self.Emote(\"%s\");\n" % (textToSay))
                out.write("\tend\n")
        elif isTrade:
            if "plugin::check_handin" in str:
                itemCount = 0
                out.write("\tif (item_lib.check_turn_in(e.self, e.trade, {") 
                textToTrade = re.search('check_handin\(\\\\%itemcount,(.*)\)', str)
                if textToTrade is not None:
                    textToTrade = textToTrade.group(1)
                    items = textToTrade.split(",")
                    #print the items
                    for item in items:
                        itemCount+=1
                        regex = "(\d+) => (\d)"
                        search = re.search(regex, item)
                        if search is not None:
                            itemNum = search.group(1)
                            itemQuan = search.group(2)
                            if int(itemQuan) > 1:
                                print(str)
                            if itemCount != len(items):
                                out.write("item%d = %s, " % (itemCount, itemNum))
                            else:
                                out.write("item%d = %s})) then\n" % (itemCount, itemNum))
            elif "quest::" in str:
                regex = "quest::(\w+)\((.*)\)"
                textToSay = re.search(regex, str)
                text = textToSay.group(1)
                param = textToSay.group(2)
                if text.lower() == "summonitem":
                    out.write("\t\te.other:SummonItem(%s);\n" % (param))
                elif text.lower() == "exp":
                    out.write("\t\te.other:AddEXP(%s);\n" % (param))
                elif text.lower() == "say" or text.lower() == "emote":
                    if "$name" in param:
                        param = param.replace("$name", "\".. e.other:GetName() .. \"")
                    out.write("\t\te.self:%s(%s);\n" % (text.capitalize(), param));
        if "{" in str:
            if bracketInWrongSpot == False:
                openBrack += 1

        elif "}" in str:
            openBrack -= 1
            if(openBrack != 0 and isTrade):
                out.write("\tend\n")
        if(openBrack == 0 and isTrade):
            out.write("\titem_lib.return_items(e.self, e.other, e.trade)\n")
            out.write("end\n")
        elif openBrack == 0 and isText:
            out.write("end\n")

files = "Frantip_Dalonus.pl"

#set path here
fileList = glob.glob("P:\\eqemu\\quests\\twilight/*.pl")
for files in fileList:
    f = open(files, 'r')
    out = open(f.name.rstrip(".pl") + ".lua", 'w')
    print(files)
    lineNum = 0
    for line in f:
        lineNum+=1
        #is a function in lua
        if "EVENT" in line:
            writeFunction(f, lineNum)
    out.close()
    f.close()
