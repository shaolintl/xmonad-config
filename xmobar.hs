-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:DejaVu Sans Mono:size=8",
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = Top, --Static { xpos = 0, ypos = 0, width = 2560, height = 16 },
    border =       BottomB,
    borderColor =  "#646464",
    lowerOnStart = True,
    commands = [
        Run Weather "LFPG" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        Run MultiCpu ["-t","Cpu: <total0>%|<total1>%|<total2>%|<total3>%","-L","50","-H","85","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Volume "default" "Master" [] 5,

        Run CoreTemp       [ "--template" , "Temp: <core0>°C|<core1>°C|<core2>°C"
                             , "--Low"      , "70"        -- units: °C
                             , "--High"     , "80"        -- units: °C
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 50,

        Run Battery [
          "-t", "<acstatus>: <left>% - <timeleft>",
          "--",
          "-O", "AC",
          "-o", "Bat",
          "-h", "green",
          "-l", "red"
           ] 10,

        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,

        Run DynNetwork     [ "--template" , "<dev>: <tx>kB/s|<rx>kB/s"
                             , "--Low"      , "1000"       -- units: kB/s
                             , "--High"     , "5000"       -- units: kB/s
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 10,

        Run Network "em1" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %H:%M" "date" 10,
        Run Com "getMasterVolume" [] "volumelevel" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%battery% || %multicpu% || %coretemp% || %memory% || %swap% || %dynnetwork% || %StdinReader% }{ || %default:Master% || %date% ||         "
    --template = "%StdinReader% }{ %multicpu%  %coretemp% %memory%   %swap%  %em1% |  <fc=#FFFFCC>%date%</fc>   | %battery% Volume: <fc=#b2b2ff>%volumelevel%</fc>"
}
