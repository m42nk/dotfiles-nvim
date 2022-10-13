local ok, db = pcall(require, "dashboard")

if not ok then
  return
end

db.custom_header = {
    '',
    'B                                                B',
    '                                                  ',
    '                                                  ',
    '                                                  ',
    '                               G                  ',
    '                       GBB#######BG               ',
    '               GG      B#######&###               ',
    '             GBGGGGGGBBY77!??J57~J#GGB            ',
    '            GB?~~7B#G 7~~?55!:?55J Y?YB           ',
    '            B :^~^^BJ7^!7Y7Y5?YJYJ:^~YB           ',
    '            BB!:^:^  !:775GJ~~Y557^7 B            ',
    '             B5YJJ5#B55Y?Y?!^!!!?  GG             ',
    '               GGGG#GG B!::^:~!::JG               ',
    '                  B#GB ~::::::7^::JG              ',
    '                  GBBB!:::::::^7^:^               ',
    '                    J 7:^::::::~?^!               ',
    '                   B Y55 Y?77777YJ5G              ',
    '                  GB G5?Y##                       ',
    '                 GBBY BJ?BBG                      ',
    '             GGGBBB5 GBBBBGBBGG                   ',
    '          GBBG GBGY BBGBBBBGGBB GG                ',
    '         B#G5 BBB5GB GBBBBBBB G#BB                ',
    '        G#BGBBGBGJJ~^^!?Y GGJ:^ B#B               ',
    'B       G#BG55 B5~:::::::^^7^::^5 B              B',
    '',
    '',
}
