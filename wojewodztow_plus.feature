Feature: Aplikowanie na oferty z pogłebionym splitem

  Scenario Outline: Aplikowania na ofertę z formą aplikowania erecruiter
        Given   Ogłoszenie ma wypełnione obowiązkowe pola w szablonie 'Specjaliści IT'
            And ogłoszenie ma miejse pracy <lokalizacja>
            And ogłoszenie posiada włączony dodatek 'republikacja it'
            And ogłoszenie ma wybraną kateogrię 'It - rozwój oprgramowania / testowanie'
            And Ogłoszenie ma formę aplikowania 'strefa'
        When Opublikowana ofertę
        Then 
            @relax
            And Ogłoszenie wyszukuje się na pracuj.pl i pracuj 3.0 dla frazy <fraza_wyszukiwania>
            @relax, @eryk
            And Da zaplikowac się na ofertę pracy <WebId>
            @eryk
            And Aplikacja kandydata powjaia się w erecruiterze
            @noname
            And Ogłoszenie wyszukuje się w aplikacji mobilnej dla frazy <fraza_wyszukiwania>
            @noname
            And Da zaplikowac się na ofertę pracy w aplikacji mobilnej <WebId>
            @eryk
            And Aplikacja kandydata powjaia się w erecruiterze
            @stem
            And Ogłoszenie wyszukuje się na theprotocol.it dla frazy <fraza_wyszukiwania>
            @stem
            And Da zaplikowac się na ofertę pracy na theprotocol.it
            @eryk
            And Aplikacja kandydata powjaia się w erecruiterze


            Examples:
            | lokalizacja                                                                   | fraza_wyszukiwania | WebId        | SyriuszId |
            | Osiek (pow. strzelecki), Cierzpięty (pow. piski) 1, Cierzpięty (pow. piski) 3 | w1                 | x1a, x1b,x1c | y1        |
            | Cierzpięty (pow. piski) 1                                                     | x1                 | y1           | y2        |


    Scenario Outline: Aplikowanie na ofertę z formą aplikowania strefa
        Given   Ogłoszenie ma wypełnione obowiązkowe pola w szablonie 'Specjaliści IT'
            And ogłoszenie ma miejse pracy <lokalizacja>
            And ogłoszenie posiada włączony dodatek 'republikacja it'
            And ogłoszenie ma wybraną kateogrię 'It - rozwój oprgramowania / testowanie'
            And Ogłoszenie ma formę aplikowania 'strefa'
        When Opublikowana ofertę
        Then 
            @relax
            And Ogłoszenie wyszukuje się na pracuj.pl i pracuj 3.0 dla frazy <fraza_wyszukiwania>
            @relax
            And Da zaplikowac się na ofertę pracy <WebId>
            @dywizjon
            And Aplikacja kandydata powjaia się w strefie pracuj
            @noname
            And Ogłoszenie wyszukuje się w aplikacji mobilnej dla frazy <fraza_wyszukiwania>
            @noname
            And Da zaplikowac się na ofertę pracy w aplikacji mobilnej <WebId>
            @dywizjon
            And Aplikacja kandydata powjaia się w strefie pracuj
            @stem
            And Ogłoszenie wyszukuje się na theprotocol.it dla frazy <fraza_wyszukiwania>
            @stem
            And Da zaplikowac się na ofertę pracy na theprotocol.it
            @stem
            And Aplikacja kandydata jest dostarczona do pracodawcy


            Examples:
            | lokalizacja                                                                   | fraza_wyszukiwania | WebId        | SyriuszId |
            | Osiek (pow. strzelecki), Cierzpięty (pow. piski) 1, Cierzpięty (pow. piski) 3 | w1                 | x1a, x1b,x1c | y1        |
            | Cierzpięty (pow. piski) 1                                                     | x1                 | y1           | y2        |



Feature: Pogłebiony split
dwie lokalizacje z tego samego miasta
dwie elokalizacje z innych miast ale tego samego wojewodz
dwie lokalizacje z innych woj

Feature: Aplikowanie na oferty w ramach pringu 3.0


Feature: Zużycie kredytów na produkty w ramch pricingu

@manual
Feature: Super oferta

    Scenario Outline: Na wynikach wyszukiwania oferta jest oznaczona wyróznikiem 'super oferta'
        Given Ogłoszenie jest w szablonie 'Specjalisci i managerowie' 
            And Ogłoszenie ma wypełnione obowiązkowe pola
            And ogłoszenia posiada dodatek 'superoferta'
        When Opublikowana ofertę
        Then 
            @relax
            And Ogłoszenie wyszukuje się na pracuj.pl, jego reprezentacja właściwie uwzglednia dodatek super oferta
            @noname
            And Ogłoszenie wyszukuje się w aplikacji mobilnej, jego reprezentacja właściwie uwzglednia dodatek super oferta

 Examples:
            | WebId    | SyriuszId |
            | x        | y         |


@manual
Feature: wyrożnienie w kanale mobilnym

    Scenario Outline: Na wynikach wyszukiwania oferta jest oznaczona wyróznikiem 'wyrożnienie w kanale mobilnym'
        Given Ogłoszenie jest w szablonie 'Specjalisci i managerowie' 
            And Ogłoszenie ma wypełnione obowiązkowe pola
            And ogłoszenia posiada dodatek 'wyrożnienie w kanale mobilnym'
        When Opublikowana ofertę
        Then 
            @relax
            And Ogłoszenie wyszukuje się na pracuj.pl, jego reprezentacja właściwie uwzglednia dodatek 'wyrożnienie w kanale mobilnym'
            @noname
            And Ogłoszenie wyszukuje się w aplikacji mobilnej, jego reprezentacja właściwie uwzglednia dodatek 'wyrożnienie w kanale mobilnym'

 Examples:
            | WebId    | SyriuszId |
            | x        | y         |


@manual
Feature: Cała polska

    Scenario Outline: Ogłoszenie jest możliwe do wyszukiwania po lokalizacji z dodatku zasięgowego 'Cała polska'
        Given   Ogłoszenie ma wypełnione obowiązkowe pola w szablonie 'Specjaliści IT'
            And ogłoszenie ma miejse pracy <lokalizacja>
            And ogłoszenia posiada dodatek 'cała polska'
            And ogłoszenia posiada dodatek 'superoferta'
            And ogłoszenia posiada dodatek 'wyroznienie w kanle mobilnym'
            And ogłoszenia posiada dodatek 'logo na listingu'
            And ogłoszenie posiada włączony dodatek 'republikacja it'
            And ogłoszenie ma wybraną kateogrię 'It - rozwój oprgramowania / testowanie'
            And Ogłoszenie ma dodatek zasięgowy wojeództow plus dla <dodatkowy_zasieg>
        When Opublikowana ofertę
        Then 
            @relax
            And Ogłoszenie wyszukuje się na pracuj.pl dla lokalizacji <lokalizacja>
            @relax
            And Ogłoszenie wyszukuje się jako dodatkowy zasięg na pracuj.pl dla <wyszukiwanie> 
                ,jego reprezentacja właściwie uwzglednia dodatek super oferta i wyróznienie w kanale mobilnym @?? co wlasciwie ma sie stac
            And Ogłoszenie wyszukuje się na theprotocol.it dla lokalizacji <lokalizacja>
            @stem
            And Ogłoszenie wyszukuje się jako dodatkowy zasięg na theprotocl.pl dla <wyszukiwanie>
                ,jego reprezentacja właściwie uwzglednia dodatek super oferta i wyroznienei logotypem @?? co wlasciwie ma sie stac
            @stem
            And informacja o dodatkowyc zasiegach <dodatkowy_zasieg> prezentowana jest na ofertach na portalu 'the protocol'
            @noname
            And Ogłoszenie wyszukuje się w aplikacji mobilnej dla lokalizacji <lokalizacja>
            @noname
            And Ogłoszenie wyszukuje się jako dodatkowy zasięg w aplikacji mobilnej dla <wyszukiwanie>
            @??
            And Co powinno stać się na it.pracuj.pl 

            Examples:
            | lokalizacja                                          | wyszukiwanie                         | Tryb pracy                    | WebId    | SyriuszId |
            | Cierzpięty (pow. piski)                              | lubuskie i świętkorzyskie            | Stacjonarna                   | x1       | y1        |
            | Cierzpięty (pow. piski)                              | lubuskie i świętkorzyskie            | Mobilna                       | x2       | y2        |
            | Cierzpięty (pow. piski)                              | lubuskie i świętkorzyskie            | Zdalna                        | x3       | y3        |
            | Cierzpięty (pow. piski)                              | lubuskie i świętkorzyskie            | Stacjonarna,Zdalna, Hybrydowa | x4       | y4        |
            | Niemcy                                               | lubuskie i świętkorzyskie            | Stacjonarna                   | x5       | y5        |
            | Niemcy                                               | lubuskie i świętkorzyskie            | Zdalna                        | x6       | y6        |
            | Cierzpięty (pow. piski) 1, Cierzpięty (pow. piski) 3 | lubuskie i świętkorzyskie            | x,xx,xxx                      | x7a, x7b | y7        |
            | Cierzpięty (pow. piski) 1, Cierzpięty (pow. piski) 3 | warmińsko-mazurskie                  | x,xx,xxx                      | x7a, x7b | y7        |
            | Cierzpięty (pow. piski) 1, Cierzpięty (pow. piski) 3 | warmińsko-mazurskie i świętkorzyskie | x,xx,xxx                      | x7a, x7b | y7        |




@manual
#Feature_code: W
Feature: Województow plus

    Scenario Outline: Ogłoszenie utworzone przez CC jest możliwe do wyszukiwania po lokalizacji z dodatku zasięgowego 'Wojewodztow plus'
    @code:cc1
        Given   Ogłoszenie ma wypełnione obowiązkowe pola w szablonie 'Specjaliści IT'
            And Ogłoszenie ma miejse pracy <lokalizacja>
            And ogłoszenia posiada dodatek 'superoferta'
            And ogłoszenia posiada dodatek 'wyroznienie w kanle mobilnym'
            And ogłoszenie posiada włączony dodatek 'republikacja it'
            And ogłoszenie ma wybraną kateogrię 'It - rozwój oprgramowania / testowanie'
            And Ogłoszenie ma dodatek zasięgowy wojeództow plus dla <dodatkowy_zasieg>
        When Opublikowana ofertę
        Then 
            @relax
            And Ogłoszenie wyszukuje się na pracuj.pl dla lokalizacji <lokalizacja>
            @relax
            And Ogłoszenie wyszukuje się jako dodatkowy zasięg na pracuj.pl dla <dodatkowy_zasieg> 
                ,jego reprezentacja właściwie uwzglednia dodatek super oferta i wyroznienei logotypem @?? co wlasciwie ma sie stac
            And Ogłoszenie wyszukuje się na theprotocol.it dla lokalizacji <lokalizacja>
            @stem @a3
            #S1
            And Ogłoszenie wyszukuje się jako dodatkowy zasięg na theprotocl.pl dla <dodatkowy_zasieg>
                ,jego reprezentacja właściwie uwzglednia dodatek super oferta i wyroznienei logotypem @?? co wlasciwie ma sie stac
            @stem
            #S2
            And informacja o dodatkowyc zasiegach <dodatkowy_zasieg> prezentowana jest na ofertach
            @noname
            And Ogłoszenie wyszukuje się w aplikacji mobilnej dla lokalizacji <lokalizacja>
            @noname
            And Ogłoszenie wyszukuje się jako dodatkowy zasięg w aplikacji mobilnej dla <dodatkowy_zasieg>
            @??
            And Co powinno stać się na it.pracuj.pl 

            Examples:
         | scenario_id | lokalizacja                                                                   | dodatkowy_zasieg              | WebId       | SyriuszId |
         | W.CC1.1     | Cierzpięty (pow. piski)                                                       | lubuskie, świętkorzyskie      | x1          | y1        |
         | W.CC1.2     | Cierzpięty (pow. piski)                                                       | wszytkie wojewodztwa          | x2          | y2        |
         | W.CC1.3     | Niemcy                                                                        | wszytkie wojewodztwa          | x3          | y3        |
         | W.CC1.4     | Osiek (pow. strzelecki), Cierzpięty (pow. piski) 1, Cierzpięty (pow. piski) 3 | warmińsko-mazurskie, opolskie | x4a,x4b,x4c | y4        |


    Scenario: CC tworzy i publikuje ogłoszenie z dodatkiem wojewodztow plus w ramach bundla
        Given Wybrany klient posiada kredyty <kredyty>
            And Ogłoszenie ma wypełnione obowiązkowe pola w szablonie Pro
            And Ogłoszenie ma miejse pracy Kraków
            And Ogłoszenie posiada jeden tryp pracy 'Praca stacjonarna'
            And Ogłoszenie posiada tryb aplikowania 'Strefa'
        When Wybraano dodatek zasięgowy wojeództow plus dla mazowieckiego i świętokrzyskiego
            And Opublikowana ofertę
        Then 
            @might 
            Zuzyto dwa kredyty na województow plus w ramach bundla
            @relax
            And Ogłoszenie wyszukuje się na pracuj.pl dla lokalizacji Kraków
            @relax
            And Ogłoszenie wyszukuje się jako dodatkowy zasięg na pracuj.pl dla lokalizacji mazowieckie i świętkorzyskie
            @stem
            And Ogłoszenie wyszukuje się na theprotocol.it dla lokalizacji Kraków
            @stem
            And Ogłoszenie wyszukuje się jako dodatkowy zasięg na theprotocl.pl dla lokalizacji mazowieckie i świętkorzyskie
            @relax
            And Możliwe jest zaaplikowanie na ofertę pracy na pracuj.pl
            @stem
            And Możliwe jest zaaplikowanie na ofertę pracy na theprotocol.it
            @dywizjon
            And Aplikacja kandydata z pracuj.pl pojawia się w strefie pracuj

            Examples:
            | kredyty        | zużyto | left |
            | 2 Bundel diamond, 0 Luznych wojewodz plus     |   5 |    7 |
            | 2 Bundel diamond, 16 Luznych wojewodz plus     |   5 |    7 |
            | 0 Bundli Diaomnd, 2 Bundel diamond u matki,  0 Luznych wojewodz plus na corce    |         |   5 |   15 |
             | 0 Bundli Diaomnd, 2 Bundel diamond u matki,  16 Luznych wojewodz plus na corce    |         |   5 |   15 |