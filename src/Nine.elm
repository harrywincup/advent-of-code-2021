module Nine exposing (main)

import Array exposing (Array)
import Debug
import Html exposing (text)



--input =
--    "2199943210\n3987894921\n9856789892\n8767896789\n9899965678"
--
-- Correct answer
-- 1103130


input =
    "9876543298765698956789545678992103976545976323678910997879876432123679765323567894679434987654596521\n7998789129854987545697658789789212985439765454567899876568976569012489874212779943598929976653987432\n6429898934943496434589769894658924976929898765679969965345698798923456976433567892456998765432196543\n5210987899874987645678979943547895989899989898789357893234599987894678986547678901349899896563987656\n4329896798765797657889989652126789998798967999899969954345989876789989797698789316498766987854598787\n5498755679876798968997699643015678987676759899999898965959878965878997649899899997987654298976689898\n7987834656997899878976578932123789998545745799998787899898767854567998798965969898999743109987789999\n9896321345698998989965489543456999867623234567897676789789854343456799987654358799298654312398898989\n8765430234999987697896789654567899954310123456998545785678963212567898992101245690129796453479987978\n7654321345899986576997999876778978965421236567895431234789654345678957895212767789298987894567896669\n9785532456799765434989643987989569877654345878976544345698765456789548954329878999987798979878975456\n9876743767987654323679932198995476988765456989987655466899896787891239765434989989865679654989764367\n0999899878998743212567893999674365699986567898998767877894949898962678986676799878654589943499876458\n1989998989987654501457899876543234799897679987859878988943234999853467897897899867723457892398976567\n9879867991099865212345789989656125789649899876545989999654345998765679998998987654012349910987987989\n8768756689987654323456897298743239891234989765534597898798759879876789569989998632134598929876599096\n8653344578999865784587976349994345910199878964523456789929898764987893498977987545245987999965432145\n6542123469764986895678965499879966899989867893212345698939987653498902987856798767959876989996543234\n7752056778953497898789878987769899998767656989101234567898765432459919876545689878998785678989654546\n9854145789101298989899989876545768989654545679914348978997654321347898765434799989679654545678965687\n7543236993212349878998998765432459876543234567895567889459865432456987654323988995498763234589896789\n7654747894523498767897999654321345998769102678976988992398999545767899765499867894309982123456789999\n8765678965654976654456899865210236799898993589987899101987978996988979876987658989219873256798999989\n9876789998799865432345678994321346789987889998698978919876456789699767997996545678934965345789789778\n4987899989891974321234789986545456899876777897569567898765347897432356989987439789549876956797674567\n3298978978910985445445891297669767998785656789423456789653298976545469879876598999656989897896523456\n3129469568899876656566990998798978989654345893214567898764989897656798767987987988978998679999314567\n2012395436789987767678989899987899876543212379201879969889978789987987656799876877899976567898901238\n2193989325679898978989579768976789965432101268912989456998965678999896547898765656999875456567895449\n3989878934589769989793498959895689876743412347894592347987854567898786434569654547989765345478989567\n9978968895699654997652987645784789987954523456789693469876432457897654321298763239876543217345678978\n8867846789898969876543498732123678998766634787899989978994321367999865432598654567987982101234589989\n7654437999987899989754989643034567899898745678998767899989993479899987543498765678999878212345678997\n6542323899876789598769876542137878987999859899987656798767789598789897655679986799698765433456789876\n4321016789765679349989987756756789876789878910199545987656698997655789796789997894549977567567898765\n5633225899954598956799899867897897765689989429298769876845457986543456989899898943534988978678979987\n8764334567893487897898789998998976454568997998999998765432356978532349878956769892123499989789459998\n9875765789932346798997634569989432323467996987999989887845779865431234669545458789012943299892398989\n5987876894321457989989429979874321012399875676889876998956889978560123458932345699129892109901987878\n4598987899430349979678998899965456133987764545778965698768995989999294567890458798998789298319876567\n3219399978921298767587897679876967845976543234667894539878954399878989698921239997987699987423965456\n4301234567932987656456796567989878956965432133456793124989876498767878999432549876796589876539874347\n5412345789743597542345895434593989869874321012349891013999999987654567898643498765987678987698765458\n6523656897654987656556789323901299998765442123457999229878987896543456998789569979998789498789876769\n5439787898765698787667893219892398999879543434568978998767986797855669999897689989879899349999987899\n7656898919896789899878954398789987999989698545679567893457895498966798986998789394567988998789898989\n8967999323987897976989765987679876889998787686893467892124789349997997895429893233459867999698769678\n9698999934598956795499899876598765778999998797912349951015689123989876796210932012399756896569954599\n6549387895999987989323902965439874355698789898909498932123478939876765989929993243987646789459893989\n6321236789898999878919999876323943234987676989898987993234567899965434567898989349998789894398789878\n5433345998797898767897889987213495349876565677797656789446889999876515698987678998999899965987698767\n6985469899545989654665678999901989498765434545698768998658992398965106789976567987898999987976569656\n7876798795439876543234889569899878999876323434569979569769321987654345678989456976447688999895498767\n8987987654321989754015679499798767898983210128789989498999210398765656789654319895323567998789349878\n9098999876510199863126789987652358997654321247899796987578931239976768899965498789212348987679257989\n2129998995431239765257891099543768998765432656789545995467892946988979987896796568901236896578998996\n3679976789542398954348999198959879999876558767893239876567899897899989896997987699322345985456789125\n4599865679954987895459998987899989987998769879992123987678976789976799765989698789533959876348993234\n5989234567899876799567897956789890196549878989789544998989765678965698943476569897659896987257899345\n9976123456798765678989986844456789987698989395678959899895454567894567892565456998998765432125678976\n8765277567987654569998765432349999898987693234569998789654323456923478921012345679539854321034567897\n7654356679599987678999654321267898789965432145698987678943210147898569543235789794323969834245688998\n8765467989459899789998874210158999679876541016987894599964521234997679659347898989019879765766899899\n9876579894398789899987654332345696567987662929876793488895435349898989798959987879123989989877899787\n3987698789298678967998965453456789349898799899985932376789655456789599987899976768934599999999989656\n2498987679976543459019879867899892198789987789984321245698767567893498876789895457995678999878767938\n1349876567895432398999989988957989987679876698765540356789878678932987545456789346889789998767656899\n0198765456789321256789099899545678976598765549854321456899989799891095432347993275678992987654545789\n1987674345699592345679129654334688965499994321965545567998999896789194321236892164568921298543237898\n9876543234598989456989298743212567894389986539876667679567954965678987210235791013569432987654568956\n5987621023987679867895497652101345789579876547988798789678942134567976521256789123456943498765678945\n4997732654976598978996598764212345678989989656799899899989653655679876432345898235597894569876789534\n9876543459865467899987987654325766789799999789899965957899879769989997543456797546678965778989899325\n4988654598764348998998999766434589994598999898998654345678998998799987676567897667799796989999998934\n3298797679974245697999429887847893212987898987987434234789897567688999789878998778945689998999987896\n2129898989765134976878999998956789109876987656896510123498765434567899899989469899434567897898756789\n3298959398754299865757889979767899912985436445689323234569854323776789998794357986523479956989434599\n4987643239965987654345679869878999894976721336578935446798765612845899987654219875612396549876526989\n9876543129876799765234889754999998789987530123489976557999976701234599998764329874323489932987789878\n1995432035987999832123598932101989699998432236599987698999964312345678989876598765435567893499898767\n3989654124599898641034567893219876568999543445679998899989899423456989879987699897576789965689989656\n9878965435698765432155678965898765432987657656789999999875678954567999765698989998798999986789878543\n8767896776789986749878789896799987621298767767899899989654579765678989854799878999939998997898765432\n5456789987899987856989896789986798532349898898965778976543459879889875423999967894321987898969987643\n2345678999998998767998945999965987643656929969434569198754678992994989567898656976439876749456898765\n1234589923457899879987899889894398784789019654323691019867899921012398978997645897899985432345679876\n2365699894578923989875987676789249895899998766513589129878987892124987899876536789999876521236789987\n5456789689989012399954298545892134976999899895405678934989656789439876987654324679998787210123996798\n7687893578899234569895987699976549899999789984312389545694545696598765699765312567899654323245695459\n9798932345688965998769898987898799768987698765423578999943234789987674198653202469998765534367789568\n9899321234567899899654679876789988657899579877567678987890125679876583019765313578929878946978897679\n3976532345678945798753498765698976545986467988678789876789236798989432123984323489212989897889998989\n2987645456789659987654579874987654324985358999799899765698945987998943439876534794343598789999999990\n1298756569898798798765989989876543219876469999899988954567899876587894646987645679654987678999889891\n2349869698999997659877996593987655424976567895999876543456998765456789656798789789769887567998768789\n3567998987898989541988987432998966565987678934598765432567899854345699787899899899898765456789657679\n7678987676487678932399998949899879677898989323459876554678998743234678998976989944999854346996545568\n9899878554345568943567899898799998788969793212589988965689987664145699999765678932499710157895433477\n1998765443123459956789998765678969899654579323679999878799876543234589987654567943987621238997312556\n0197654321012367897991019834789456998765678954568954989899987654545678998765678954598534567898101245"


type alias LocationMap =
    Array (Array Location)


type alias Location =
    { x : Int, y : Int, height : Int }


getKeyForLocation : Location -> String
getKeyForLocation location =
    String.fromInt location.x ++ "-" ++ String.fromInt location.y


findLowPoints : LocationMap -> List Location
findLowPoints locationMap =
    locationMap
        |> Array.toList
        |> List.concatMap Array.toList
        |> List.filter (isLowPoint locationMap)


isLowPoint : LocationMap -> Location -> Bool
isLowPoint locationMap location =
    getAdjacentLocations location locationMap
        |> List.filter (\al -> al.height <= location.height)
        |> List.isEmpty


getLocationAtCoordinates : LocationMap -> ( Int, Int ) -> Maybe Location
getLocationAtCoordinates locationMap ( x, y ) =
    locationMap
        |> Array.get y
        |> Maybe.withDefault Array.empty
        |> Array.get x


getAdjacentLocations : Location -> LocationMap -> List Location
getAdjacentLocations { height, x, y } locationMap =
    let
        locations =
            [ ( x, y + 1 )
            , ( x, y - 1 )
            , ( x + 1, y )
            , ( x - 1, y )
            ]
    in
    locations
        |> List.filterMap (getLocationAtCoordinates locationMap)


calculateBasinSize : LocationMap -> List String -> Location -> ( Int, List String )
calculateBasinSize locationMap processed location =
    getAdjacentLocations location locationMap
        |> List.foldr
            (\al ( sum, done ) ->
                if List.member (getKeyForLocation al) done == True || al.height == 9 then
                    ( sum, done )

                else
                    calculateBasinSize locationMap (getKeyForLocation al :: done) al
                        |> Tuple.mapFirst ((+) sum)
            )
            ( 1, getKeyForLocation location :: processed )


main =
    let
        locationMap =
            input
                |> String.lines
                |> List.map (String.split "" >> List.filterMap String.toInt)
                |> Array.fromList
                |> Array.map Array.fromList
                |> Array.indexedMap
                    (\y row ->
                        Array.indexedMap (\x height -> Location x y height) row
                    )
                |> Debug.log "locationMap"

        lowPoints =
            findLowPoints locationMap
                |> Debug.log "lowPoints"

        partOne =
            lowPoints
                |> List.map (.height >> (+) 1)
                |> List.sum
                |> Debug.log "Part one:"

        partTwo =
            lowPoints
                |> List.drop 0
                --|> List.take 1
                --|> List.map (calculateBasinSize locationMap [] >> Tuple.first)
                |> List.map (calculateBasinSize locationMap [] >> Tuple.first)
                |> List.sort
                |> List.reverse
                |> List.take 3
                |> Debug.log "Basins"
                |> List.product
                |> Debug.log "Part two:"
    in
    text "See console for results"
