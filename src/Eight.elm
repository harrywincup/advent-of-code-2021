module Eight exposing (main)

import Debug
import Dict exposing (Dict)
import Html exposing (text)
import Stat



--input =
--    "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"
--input =
--    "be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe\nedbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc\nfgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg\nfbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb\naecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea\nfgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb\ndbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe\nbdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef\negadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb\ngcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce"


input =
    "dbc gfecab afcdg dfebcag bd dgbe bcaeg dcefab ecgadb agcbd | acdgb gbcda gdecfba bacge\nbacdegf aefbdc ebf fdbcag edbfa gdaeb acfdb cdegbf face fe | ebf ecdabf fcbad afcdbg\ncabgde gd becgfd dgfe cebgf gfdeacb fdbac bcgaef bgdfc gdc | cbfad dg dgef ecfbdg\nadecgf egfdc cgeadb adbfce dafg bcfeg dge dg fadec dcbegaf | dg dcegf cdgafe gbacfed\nbadeg gdbfcea acgef fgdc bgcaef cd ebcfda gadce edcgaf edc | dce efcga dbgea dc\nbgfec dbfgec ebgafc afegcdb fca af cgdabf aegf badce cfabe | caf ebacf bafgec cbfeag\nbegacd bd cfadbeg fbecg begfd bgd cdfeag gbaedf fdba agefd | cbgfe fdab efbdg bd\nbg gfdebc beg gabd fcbae fgaeb afegd gafdce dacbfge efgbda | gdba dfgae dgba gb\ncfd edcfbg abfcg gfdcb gbcefda dgcbe defg df acebfd caedbg | agedcbf dgbfaec gbfecd cdf\nbdcag acgebfd eac ae bade abcdgf bdacge bcgea aedgcf efcbg | cfdagb degacb eac edab\nga ebcadgf gdaf bga fgecb dfabcg adcfb gadecb fecdab gbacf | fgda gdaf agb gfda\ngbcdaf fabdceg gbe ebfgad bfdga eg cefabg fdge adegb cedba | ge fcaedbg ebg aecbdfg\nab bdeag gbdefc cgafdb fgedb agb befa bagfdec ecgda agfedb | ab aefb abg ab\nfgceab fcgdb fdcebg cbf gafbd cegfd bced cb cadfge cbdgafe | ecbagf cbfdeg cb bc\nfgb eafdgcb cefg ebdgac fcbged fbade fg gbfed gbecd fcabdg | fg eadfcgb fgcbda gedcb\necgfda faebc cb fadeb adecbg edfgabc bfgc cab gecaf ecbfag | fcgb bca gbcf cgbf\ngfaed cg cgab abdcf fabcgd gcfda fgc fdgacbe cbdaef fcebdg | fgc cfdageb cbfgad degfa\nfbacd gedfac fadegbc gbf degb ecgdf gb bdecfg gcdbf efbcag | cgedfb gb bcdfa cfdagbe\ndceg deacbg acfbeg egdafbc ebfda dc bcd cgabe gbdafc dbace | cged fabegc febad ebgcfa\ngbdcae cfgade dc dgbface fdage cbgfa adc gdafc dcfe gbdaef | fedc adgcf fcde dgacbfe\nafdgbe cgfabe dcgeab aef feacb fbgcade bgace cgef bcafd fe | ebacf abfdegc dbfac facgeb\nfbeg dgfecba cfgabd eafcb gb edacg gecfab aebcdf ebcag gcb | cfadeb gecda bg gb\nbfcaeg gd fbagc fgad fgcaedb fdgbac cdaeb dgfecb cagdb bdg | cbfgda dg afcedgb egfacb\ngd dcafgb dacfbe edbgacf gfbdc fbceg dbg dfag bdfca begdac | aecfdb eagdcfb fdcbgea fgdbc\ngf dfgc ebfgac bfdace gabfd adgfbc acbfd ecfagbd bgf aedgb | dfgc fdcg gfb gbf\ngbdae ebadf dbcfag acfdb dfec feacdbg geafcb dcbafe fe fae | efa bdcfa eaf debacgf\ndeafgc fbgedca gfd dcga dcgbef aecfg dg agfebc adgfe dfabe | dgf badgcef fgace cabefgd\nbadcg bagdce bdafgce efgbc df cbgfda cfdbg edgfac fgd adbf | dfcbg df cgbdae bdfgc\ndgabe beagc gbd gfcbdae gd bdegfa bgfedc fbcdae bafde fagd | bcdfge bgd bcage dfga\nadgf adgfce aecfg cdega dbgaecf abcgfe egd egcdfb dg deabc | cdgae dafg dfag afdg\nfbadec afcbg begac be ebcgda dceag edgb efdcga ebdacgf cbe | adfcebg ecafbd debgac edcafg\ncbd dcga cagbf dcafb cd cdebfg dgafcb baefd cbfaeg cfdgeab | fcdab geacbf gfbdce dgcafb\nbecd abfdc cgbaf efcda bd ebdcaf gdfaceb bdf bdgeaf cedfga | ebdc fbd bdf fbgdae\ngefacd adcg fedbc cdgfe egd dg dbfega cgbfeda aecfg bcefga | defbcga efcga afgced gdecf\ngfacbd fbcgde cefba efdcga bfgcead egcdf gfb gcfbe bg edgb | gb fdegc gfb fgb\nag agfdcb egfad fag adefb fdgec bdfgcae acfegd gebfdc aecg | fga ag egafd fcgebd\ncadgbf cd gefbac cdfba fbead cedagb gdcf adc gacbf fgebcda | gcbafd bdcaf gfcd abdfe\nfgebda fd afceb fcdeb fcad cgbed gabfcde dcabfe def befagc | eacfb efd efagcb def\nbeaf gfcaebd fdeag dae acdgeb gcdfa dgabef gbedf ea dcbgef | ae aed ae ade\ngb dgeca gecab gcdfaeb ceafb bgc fagb adfceb baegcf gebfdc | fgba bg fecgab bg\ndaf gbfda afcedg geadfb fbcdg fgaebc ad dbagefc dbae aebgf | aebd eadcbgf dfa beda\ndcbaef cabfd efgcba cbdgfa aedfg abecfdg ace cbde dfcae ce | cbefag ebcd cdabgf cbfda\nbcgefa bgfcead cd fcbadg bdcga dac gbaed gafdce cfbd bcagf | cbfag acd cfbd bdfc\ndgfcb aebgd gadefc bgfdec cbafgd cgbad egbdafc ac acbf cga | ca ac cabf abcf\ncgaed gafbdec fgaedc ba baegcd edfbg agcb bcdeaf ebdag bea | gfceda ecabfgd defgacb aeb\ncbfag cgdaf dcefab bac ba bdfceg cfgeb eagb cbfgea abcfdge | ba bac gabe cfbeda\nefcgd ecbafdg fgabed edb ebcg adcfb be efcdgb dfcgae dbefc | dcgef ebd becg gdfaebc\nfgedabc dafeb eg ged aegfbd afbecd fbgdc edfgb egaf dacegb | gaecdb cbegad fega fega\nbgfcdae fbcda df eafd gbcaed bdeca gfbac gfdbce bfadce bdf | afcbdeg gabfcde deaf cbeda\nfcgebda fcga bgfcd ebdfcg degba baf bafgd dfagbc bfcade af | afb agfc af cfegabd\ncbfg bfd eabfdg facbdg edfcgab bf fcabd aedcf ebgdac badcg | eafdc bdf bf fbcg\nfbdgce eagbfd dbacfeg dagb geabf cdeaf ebd bd fgbcae afebd | defac bed edb db\naegcd bad gdaebcf cabfg db ecbd gafdce gcabd gbcade faebdg | dab dba dba cgfba\necdba bedacfg cdgeba dagcb bdge gdbfac fcadeg ced de acfeb | ed badfgc beacf bcgdafe\nfg abdeg fgebdca agdceb gfbd gdfae fga cdefa efagbc febgad | fg bgaefc gf bgafcde\nbeadc gcbfed fdc bacf fc cbadefg feadc dgfea dcbefa dcgeba | cdf gefda dfc fbca\nbd bgcedf decafg gafcdb acgdf agbce bafd gaefbcd cdb acbdg | fcdga afbd cbfdeg cafdgb\ndabe bgcda egcdb fcdage dcebga bcfge dafgebc gdafcb ed ecd | ebad deba de gcbde\nga gadcb ebcfdg egbcd agebdc eagb afcedg dbfca dfceagb dga | dabgc ga agd adbcg\ncbfagde ecdgf eabgfc fbd egbdf fageb edba dacbgf bdaegf bd | beda deab abgfe cegfd\ngcdfa gfea ef bdacfeg aedbc efc gfebdc adgbcf fecad aefcdg | feadc fe efc fgcad\ngdcae fga af acegfb fbda gfead edfgbc agdfecb dbgafe fdbge | fabd gfaed efgbd dagce\nafdebg febc cdbae abe eb dbfcea dabcfeg aecgdf dabgc dafce | cefb cedgaf eab acefd\nfgc dcabg gbdefac dfeg ecfdgb bfgcd gebcaf beafdc fg edbfc | cdfeb fcagbe fgbdace febdc\naegfbd gacdeb fdeacgb dea dgcefb faeg bdfac dgefb ae debaf | debfg dea ea ead\nacgedb cfgae egfcbda fdeac eacbfd fd bdagfe dabec def fdcb | fed fd fcbd fde\ndba bgcfde da cdaf acfbgde fbgdc fgadeb dcbag agbec acgfdb | gacbdef adfgbe bgcad fcdabge\nacdfe cfgdab cdgea afgcebd dcgbae daf gfea fa egdfac bedfc | fa fad fa cedga\ncaedg bafgde egcba dabegc agd fecdbga bcfeag fecdg ad abdc | gad cbeag dag cabd\nadfebg fedcagb fagdc gda eadc degcf gdafec ad cdbfge facbg | da aedc cbfgdea ad\necfdba dg dgafec gcabdfe fbadg fadcb gbdfca gfd bgefa dgbc | cgbd dbcaf cgdb dbgcfa\nebacg eb begd dcebaf cdgea gafdce ecb cagfb bfadcge egcdba | bgdaecf bedacg dbeg cbdgae\nebdagcf cgbea fe agefbc abgdf agfeb egafdc bcef feg deabcg | cegabd ecgafbd ef fe\ncd cgebdfa fgeabd cbd cabed gfbdec adcf abgce eafbd fcebad | efabcdg bcefgd baedc abfde\nacfg gbacfd edgfabc bdcaf dca caebdg dafbe gbcdf ac dfbgec | bgcfed cda dbgfc acd\nagdbefc abdc ecd gfcae aedbf gbcdef ebafdg ecadbf efadc cd | afdeb cde dbafce bfadge\nbegad de fged gfbea dbe gbdac ebfgdac efgabd cadfbe fegabc | de dgfe cgfaeb gadbc\ngefdc gdfb gdbcaef deb ebfcd gcebad bd dacefg gdcbef fabce | gfedabc deb gcfade fdgb\nbdec dagcf cefbg bfgace bgedfc edacfbg fgdec fde adgefb de | dbfaegc cedb edfabcg fcdeg\neaf gabed cabegdf fe ecbgaf fadeg gadfc fcdega cfde cbgafd | adgef fced cgdbafe fae\nfcbaedg gadce abcg ceb bgedf adfbec decagf bc dbceg eabdcg | ceb bgafecd cabg acefbd\ndagb cfgde acgfeb fbgac fcgdb bd dbf cbfagd fcbeda bcefgad | db fegdbca dbceafg aedbfc\nedagb da dab fbdge cgdfbe acegb adfe abdgfce dfgeab bfgcad | abd dab gfbead eagbc\nbdfega dcbgf efcgabd ce fec fcegd agce fegad daebfc efdcga | ec ecf dgacef bfecad\ncdabgef bgdfe aecgb gcfa fc acgebf dcaebf dcbgae cfgeb efc | fc fcga bfecga faecbdg\ndfeac gdfcea fcg acdebf cdge cgefa bdcgaf cg fegbdac bfage | cfg cfg gfeca fegac\nbfad bcf bedcga cadeb bf bceafd bcegfd dbaegfc ecfga cfbae | efacdb afbd bcf fb\naegfcd bcdeg abcefg gcfea bcgafed bga afbe bagec ab fbdgac | gceba gacbe gbacef gab\ndca ebda bdfaceg acgdb gbcdea begcd efbdcg efacgd bfagc ad | adcbeg ad cbfga cfbgeda\nfadebc gcfbea becgf gf fgc abfg ecgbd dfecabg fcedag eafcb | ebfgc gaedfc bgcef gedabfc\nfadg eafgb gbead bdaec ecagbf dg gdb agfebd aedcgfb cfgbde | bfecdag bgd badce gd\negcd efadb gacbfd bcaeg ecadgb adc bacegf adecb dc agedcfb | fcgabe degc acd cd\nbedfcag gc fagdec gfabce bfgec acgb befac gfc bgdef aecfbd | cg ebfdg cfg gc\naegbdf gfabced fadebc gfde ed bcaeg fbgda eadbg fgbacd bde | dbcefag bed afcbged aegdb\nagd fagec cfbgda bfceagd fgeacb cdae gdbef dagef da efcdga | edbgf gda gedaf cdgfaeb\nfgaec eb fcgbd agfdeb cedb fabcdeg egb febcg dfbgec cdfgab | fgbcde dbeafg egcfdba gcbfd\ngfe fdbae ge bfgdc dgfaec cgeb dcfgbe dabfgc fdegb eabgcdf | gebc gceb defbcag afbcedg\ndfce cgbed fbcagd bcdgf ged bdfgae ed bdfceg agebc fabdegc | fcde gde gecdbf de\ndba dcafbg gcdefb fbged dgeab bfegad gaecd ba aebf egafdcb | beadg cfdbage bgafde acdge\nbcgdef cbdgeaf ae fbdace afbde gcdabe gdbfa edbcf fcea bea | dgafb adbfce ea fbdecga\nafdg fgebc fdeacbg fd gadcb fdcgb gfacbd gbeacd acdfeb dfc | fd bdcafeg caefbd dafg\ndfebag defa bdgfa beafg agbcfd eab cbagefd cfgbe ea acbgde | abdcge abe ae fecbg\nef bgfdeac bdcefg cfdba ecf dgecba gfae abgefc ecbga acefb | debcag afge efag fe\ncg gbfc gabcd bgade dgc gbecafd egdfac dfbac abdcfe gabfdc | gcbad degfabc cgafbd adbgcf\nedbcgf acgbf fbaedc cbfae gfc agcdb dagecfb fg fcgbea eagf | fg adcbef fbeac fadcgeb\ndeacg daeb dagbce ecdbgf edc ed bgaefc gecba dagcf abdgecf | cdaeg abcge dec ecd\nfcgadb caged bedc cdabeg dfaecbg befag db dgb eagbd gacdef | fecagdb begad dgb db\nfbcdga fgcad fecdg gcedab bfca adc ac bfdga dbfega eafbcdg | adc cbgade fgcadb ceabgd\ncefdbg gde bgfeac ed begcd cbefg bfde aedcgf cbafegd gacbd | fegbdac gcbefd cbgef bgedc\nbfdagc afdc bagcf gbfdc begcd begdaf beafgc dbefgac gfd fd | fcda df dfac dcbfg\ngcbfe bfeacg cedbf ge bfcga gfe gfecda ecbgdfa bgfadc bage | feg eagb gef abfgc\nbgfec bac abecdfg ab gdcea ebgcfa fagb aebcg caebfd gfcbed | ab ab cba acgbe\ngdbcf cbedg ce ceg abcgde adbeg efgcab bdfegac adec adfbeg | gaecdfb bedga cge cead\neafcb cfdbe aeb acfeg ab dcgbfe adfb fgacedb ecabgd fdbcae | fbcde aedfcbg bea edcbf\nebdca egc cgabe fbge cgbfda ge bacfg geacbf afdgec gebacfd | badce cge bgfcea ge\ngdfecb bdge gdf dgbcaf aefbgc bfecg fgdec dg ecdbfga deacf | dgf fedcagb gd gcedf\nagdeb cfdbag gcabd ed dacegbf gebfa eagbdc acde efcgbd edb | ed eagdb de de\nfeag cfgbed feacbdg cfgade efcdg fcgdab afd dfeac af abedc | cbagfde dbagfc faeg dgabcf\ncdg efgbcd decgfa dcegb dgbf gd ebdcfga adebc gbcfe cefagb | bfecg dgbf gdbf dg\ngab dfceag gdcb bg gbead agdefbc gcabef acged efdba agdceb | gdcb bgdc edbfa bag\nbgafde afdgc gcafed efgdc ceda gdcebfa gdbacf de gbcef edg | edg gde eadfcbg cade\ngdb egcfadb gdef abcfd dg ebfag gadbef abdgf aefbgc cbgaed | fedgba dbegfac bfeagd gefcdba\ngad bdcag becdg gceabd dceafbg fgdeca fcgab ad baed dfcbge | cfaegdb gda ad gaedcfb\ndafbeg eadgbfc fgd bagcf gedb abdfce gafdb fcdgea gd efbda | gebd fdg gaefcd deagcf\ncdbe adefb ecfgbad bfcgad bacdf agcefd efd cdeafb aegfb de | gacebdf bdce fbcagd dcefab\ncb acdgbe bce cdegabf bgdefa aegdb cdbg acbde fcebga fdace | ebc abfdecg ceb gbacdfe\ncg fcedg edfbag ceag fdbec gdc faedcg bdcefag gbafcd dfeag | geca dgfacb cgd cg\nbcafde defac dcage dgfbce gafc cgaedf cgd cg fgcedab gdeab | cdg ebadg aedgcf fagc\nbdec dagbf ecagfb decbfa aefdc aeb dcegfa adefcbg ebadf be | cdbe gfadb eadfc dcbe\nbcgeda fc badfe gbfdaec fcge cfd bedfc cedbg adfgbc dcgebf | cf ebacgfd fgce fdbceag\ngd fgbdea dbg badce gdcab fcagedb fbacg beacfg cgfd dcafbg | fcdg gdcbfa dbg gdfc\ncag cdfa cgade edgcbf fcebga begfcad gfdcae egabd defgc ac | ca agc fgbace gac\necabf geacfb eabdcf dec cd bgecfda gfdbce edcba cdaf adgeb | ced aedfgbc dc gbeda\nfbdac ea cadefg fae beag facbe bfgeacd cfdegb bgfec gfecba | agbe ea bafce egbdcf\nbdc dbega abcdg gbcfa dc gcde cgbaefd cdfbae eagdbf ebgadc | adefcb agcfb cdb gced\nceb ce debfca abgdfe bdaeg cabegd caeg dbgec dcbfg bdecgfa | ce abegd gdfcb fcbdgae\ncafedgb dgf bcfd cgdfbe acedfg gbfed agedb aecgfb bfgec fd | fdgbec feacdg df bgcfe\nef abgfc cagfeb gdebfc fbae bcadfg defgabc feg gefac gceda | degac gfbac gabfc gfcea\nbfdeca bd eabfgc degbcfa cgdb gefbc dbf ecfbgd gaedf edgfb | dbfge bdf egbfca db\nfac cbdfg eacfbg gaecfdb bacfd bfeda acgd ac gbfecd cgfadb | dagc ac dcga bedfa\negfbca aegcf gdcfab fdc adce fcedg cd cfgead fdebg cedagbf | dcgfe fdgbcea aedc cfebga\nda bfged afedcb gcebdf gefda fedbga edgbfca gdba eagfc eda | ead dcfebg defcgb efgbcd\nadefgb ecgf gcedb fedacb bec fbecdg cdfaebg gedfb gcbad ce | dcbfeag cfbged efgbad bcdfage\ndfec gcd agdbe bdafgc afcbge bgecfad bgcde bgfce bgedfc cd | fbecag beagdfc cgd cedf\nedbc agcfbe adefg cd defca gfabdc cad dgabefc dfebac bceaf | dbce ebdc febcdga cdgbefa\necdb eb acgebdf ebf dcfebg bgdefa fcgbd gcdbaf feacg cfebg | bef ecfbg egdcbfa cdgfb\nebfcgd aefcb bfadge efd ed adfcgb fbgdc bfedagc fcebd dcge | gced fbcgd edgc ed\nbeagf cefbag ebafc gfce gdfeab fcaedbg ec dfcba ecb gbadec | ce acfdb dbgcafe ec\nabegfc fbcged bgfea fecabdg gef ge abdgf gaec afecb cfbdea | cbfaedg bface gfe efabgc\nbdg bacd edagb fbegac fgaed bdgcae cgbea dfbegc ecgafdb bd | gdeaf cfdgbe gbcaed bd\nfbce fdegca egafb aef egdcfba eabgc fe ecdabg agfbd ecgbaf | fadgb cbage bcgdea abfgec\ndbafge fedgcab efgdbc bc fbac fbdea gceda bfceda bdcea ebc | eadcb fcdeab cafb bdecgf\ncbgae fec aefgcb acfeg fe efgcbd bgceafd fbea cagbed dcfga | edbagfc acefg gbdface ecf\ncbfdga bae ebdf fbadge afdgb gfeac acbdge bdacfeg eb agfeb | edbf bea efdcbag aeb\nefdcgab bedgaf aecbgf cgfe gfaeb cbgea ecbfad ec gdcab ecb | cgfe eabfg eabgf ec\nbdefa dfebgca bfe eadfcb dcbage bfgad debca cgebaf ef cdfe | gacdbe eagcfbd afcgebd dfgbace\ngca ebdcfa fdcgea acedb bdcgf eabg gbacde bcgdeaf ga gacdb | ebag abge gac aecdb\nabcgf afgcbe baeg gbc ecdbgf gafce facbd cfgade bg egabdfc | aegb cgb bcdgef abcgf\necagbf bdfgca ecgfd gbe fecgb dafgecb bacfg bgadec efba eb | geb cadfebg beaf be\nagcdb bgcaf bf fadebgc daecbf gbdf fbc ebgcda afegc bgcafd | facgdeb dbfg fb bf\nfdbeag cgd bdefcag afegd eacgdf dc dgefc ebcagd gfebc facd | geadf dc dc cdg\nadcgfe cgebf acdbf abcedf dgfbaec edba cabef ea afe dfagcb | bfgec bfeca ae deba\nadegb bgcd cbdfgea dc cedba cagefd dcbgae gebdaf faebc ced | egadb ced dcbg dc\nfdeg gd fdbaec bfacg dgcfa ecfdga fadcegb fdcea dceabg gda | efgd eacdfb bcfadeg dag\naf ebgfda ecagdb febgc afe dabce cfda febcda baecf becafdg | fa dbfega fa bfeagd\ndebagfc cbdgfe dcb fdbeg cegb fbced fcead cbdfga bc fabdeg | dcb efadgb dgcfeab ebafdg\ncgfdae bdef becfg gcbefa ed abcdg gedcb cgbdef bdcgefa ecd | cde dec bfed bfcgdea\ndcfegab becdg gcaedb egd bcdaef gcfdb eg eafcdg cdeab ageb | ged cegafbd egd eg\nba eafcd fcbegda acfgbd bedcgf ebgcfa fabdc dcgfb bagd baf | ba cafed efdbcag efdac\naebcdgf cd efbgac bfcgd cbfga gbefd bfdcga bcad geafcd dgc | fabcged fgaceb cbda dc\ncgbaedf fbceg eafbcd degcf gfdcae gdcfa dbagcf dgae edf ed | fcgeb efd ed gdea\nac agfdcbe gcea dgecf fgdca efgcad dfbeac fca fdgba gcebfd | agbdf ca ac gbdfa\ngbedaf dbgfc cbg abdfgc geadbc fecbd ebcgafd cafg gc dafbg | cdbfg gcfbad gcbdea fadcegb\nbagfec efg bfcdga egac abfecdg afdbge dbefc ge cgbfe acfbg | fbdeag eg eg cbdfe\nedbgcf dgbac bdceag dbagf cgd ecagb bceagf cd adce cgbafed | aecd egdbca gacbe gcd\nbgfdc gdfbe afdbgc gc fbdac bacg gbafdec cdg cbdefa defagc | egdfb gcabdef cdbfa dgacfb\nadgcfb gcd dfecgb cgebfa bgcaf adgcf cdbafeg dg ecafd adbg | bcgaf fadcgeb gd cgbaedf\nbafgd cfaebg cefa cfbgead bcf bgcea defgcb bgacf ebcgda cf | fcbgae adfbg cdfgeb adgbf\nbecfa bcgdf gbceadf gebcfa defa adbcge de dec cebdf bdefac | faed fdcagbe edc bfacge\nebfgd gabd gd gfbcaed abgfec faegb dge aefdbg agdfec cfebd | faecdg cgaedf baefgd dcfeb\necabd ged aebgfc ecagd dg fdcegb afgce dgaf dcaegf cedbgaf | edcga gfda gd dge\ndfg fg eafdb aegdc faged gfba debafg ebgfcad gfbdce acedbf | fedagb edbfac gf fgd\ndbgca fedca bfgcad adgcf agdecb dgf cefdgba bgaedf fcgb gf | acefdgb beafdg gfd cfbg\nedgacf adegcb fd dbacgfe fabd dfbce egcfb edfbac cbeda fde | dafb bafd acefbd fd\nbcefa gbfd eadcgb bgfdae gedcfa abefd efd df gedba fbdgeac | bfdae fgeacdb bacfe gdceba\nbdcefg aefgcd gadcb gfb decbfag dfecg bfdgc defb cefagb fb | defb fbcged dbfegac egfdc\nfe cedgab cbfe dacbfge cedba fed gafcd dfaec edbfac efdgab | abgedf efcb bedac gefbad\nafcgbe cf fbc cegadb bfcdea fcgabed aebdc adfgb cedf cfadb | dafbc bfeagc bcf deacbgf\nebcafdg ecfbg bae dgcabf bcaedg dfbeca ae ebcag gdacb dage | cadbeg gbacd bfdegca eba\ncadbe efgbc feacbg dgfecb bgd dg bgfcad ebdgc dgef gbdefca | aefcgb gd bfagced dgb\nedgcfa dgbecfa bgedac dfbaec acgdf dg abfgc egdf adcef gdc | cgd cbgfa eacgdb gcafd\ncad cfbead abceg edfa fadbcg becad edgfcb bgfaedc cdbfe da | egcab afde dcabfe ecfabd\nfgbdc be egb bcdefag ceba gedbac egcda dcfgae debcg gbdaef | ceba edgac eadcfg bcdaeg\ncg adcfgbe edbcga gbead cbdfa cga bgedaf faecdg dbacg cebg | gcdabfe fdacge cga bcgad\ngacf gf bgeafd gef gefbc efbagc bdceag fdebc acfbedg gbaec | bcgaedf egf gcefb cafdegb\nfgbadce cdbag agcfd faec acfegd fa fag cfged fdabeg dbfcge | agf bagefd edgfc gdbacef\nagcdb gcadfb dgfcb gfdbec adebg adc ac cfab beagdcf daecfg | ac ca bedga ca\ndfa abdcfg agbf cfabd dacgb dcebf eadgcb fa gbdafce ecfgad | af fa bcdaf bgaf\nebdfc cgbaed eg edabfc gefb adfgc gdfec deg ebdfgc debgcaf | abfcde bfge gde dge\ndabfegc dfegb cbgf cf fdebgc dcbaef gcfed adecg fbdgea fce | cf gbfc fgcb begcadf"


type alias Entry =
    { signals : List String
    , output : List String
    }


getNumberForSegmentLength : Int -> Maybe Int
getNumberForSegmentLength length =
    case length of
        2 ->
            Just 1

        3 ->
            Just 7

        4 ->
            Just 4

        7 ->
            Just 8

        _ ->
            Nothing


parseEntry : String -> Maybe Entry
parseEntry rawEntry =
    rawEntry
        |> String.split "|"
        |> List.map String.words
        |> (\entryParts ->
                case entryParts of
                    [ s, o ] ->
                        Just (Entry s o)

                    _ ->
                        Nothing
           )


countDigitsInOutput : List String -> Int
countDigitsInOutput output =
    output
        |> List.filterMap (String.length >> getNumberForSegmentLength)
        |> List.length


countSharedChars : String -> String -> Int
countSharedChars a b =
    b
        |> String.toList
        |> List.foldl
            (\c acc ->
                case String.contains (String.fromChar c) a of
                    True ->
                        acc + 1

                    False ->
                        acc
            )
            0


determineNumberForSignal : String -> String -> String -> Maybe Int
determineNumberForSignal one four signal =
    case ( String.length signal, countSharedChars signal one, countSharedChars signal four ) of
        ( 2, 2, 2 ) ->
            Just 1

        ( 5, 1, 2 ) ->
            Just 2

        ( 5, 2, 3 ) ->
            Just 3

        ( 4, 2, 4 ) ->
            Just 4

        ( 5, 1, 3 ) ->
            Just 5

        ( 6, 1, 3 ) ->
            Just 6

        ( 3, 2, 2 ) ->
            Just 7

        ( 7, 2, 4 ) ->
            Just 8

        ( 6, 2, 4 ) ->
            Just 9

        ( 6, 2, 3 ) ->
            Just 0

        _ ->
            Nothing


decodeEntry : Entry -> Int
decodeEntry entry =
    let
        one =
            entry.signals
                |> List.filter (String.length >> (==) 2)
                |> List.head
                |> Maybe.withDefault ""

        four =
            entry.signals
                |> List.filter (String.length >> (==) 4)
                |> List.head
                |> Maybe.withDefault ""
    in
    entry.output
        |> List.filterMap (determineNumberForSignal one four >> Maybe.map String.fromInt)
        |> String.concat
        |> String.toInt
        |> Maybe.withDefault 0


main =
    let
        entries =
            input
                |> String.split "\n"
                |> List.filterMap parseEntry

        partOne =
            entries
                |> List.map (.output >> countDigitsInOutput)
                |> List.sum
                |> Debug.log "part 1:"

        partTwo =
            entries
                |> List.map decodeEntry
                |> List.sum
                |> Debug.log "part 2:"
    in
    text "See console for results"
