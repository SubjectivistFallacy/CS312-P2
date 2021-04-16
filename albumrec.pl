%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% The main query for users to get albums recommendation.
get(Albums) :-
	write("\n\nWelcome to Album Recommender. This recommender will help you sort out your next album to enjoy from the best 100 albums picked by authoritative critics in the first 20 years of the 21st Century.
\nRecommendation list may be long, to see the whole list, enter set_prolog_flag(answer_write_options,[max_depth(0)]). before running get(Albums).
\nEnter 0. = get all albums released in 2000s and 2010s; or
Enter 1. = get albums released in 2000s; or
Enter 2. = get albums released in 2010s; or
Enter a year (ranging from 2000. to 2019.) = get albums released in that year
Please enter: \n"),
	read(Y),
    write("\n\nEnter 0. = get all albums regardless of critic scores; or
Enter a number(ranging from 87. to 95.) = get albums that have critic scores >= that number
Please enter: \n"),
	read(S),
    write("\n\n\nAll Genre:
\nRock, Indie Rock, Alternative Rock, Art Rock, Experimental Rock, Psychedelic Rock, Acoustic Rock, Pop Rock, Country Rock, Progressive Rock, Post-Rock, Death Metal, Sludge Metal, Avant-Garde Metal, Post-Hardcore, Blackgaze, Post-Punk, Neo-Psychedelia, 
\nElectronic, Deep House, Progressive House, Glitch, Glitch Hop, Dubstep, Grime, 
\nPop, Chamber Pop, Psychedelic Pop, Art Pop, Indie Pop, Power Pop, Electropop, Pop Rap, R&B, Country, Soul, Neo-Soul, Singer-Songwriter,
\nJazz, Vocal Jazz, Avant-Garde Jazz,
\nHip Hop, Experimental Hip Hop,
\nFolk, World, Americana, Modern Classical, Afrobeat, Drone, Free Improvisation, UK Bass, Experimental, MPB.
\nEnter 0. = get all albums regardless of genre; or
Enter a genre (e.g. 'Rock'.) = choose that genre
Please enter: \n"),
	read(G),
	write("\n\nEnter 0. = get albums of that genre
Enter 1. = open Wikipedia page of that genre
Please enter: \n"),
	read(C),
  	recommend(Y,S,G,C,Albums),
  	write("\n\nEnter listen. = listen on Spotify\n").


% Show the recommendation list or call genreWiki on a centain genre.
recommend(0,0,0,0,A) :-
	findall(N, rec(_,N,_,_,_,_), A).
recommend(Y,S,G,0,A) :-
	bagof(N, N^find(Y,S,G,N), A).
recommend(Y,S,G,1,A) :-
	genreWiki(Y,S,G,1,A).


% Find albums that fit the requirement.
find(Y,S,G,A) :-
	find_year(Y,A),
	find_score(S,A),
	find_genre(G,A).


% Find albums that fit the genre.
find_genre(0,_).
find_genre(G,A) :-
	rec(_,A,_,_,G,_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Indie Rock',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Post-Rock',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Death Metal',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Post-Hardcore',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Blackgaze',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Art Rock',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Post-Punk',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Alternative Rock',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Sludge Metal',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Neo-Psychedelia',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Psychedelic Rock',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Acoustic Rock',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Progressive Rock',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Avant-Garde Metal',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Pop Rock',_).
find_genre('Rock',A) :-
	rec(_,A,_,_,'Country Rock',_).
find_genre('Electronic',A) :-
	rec(_,A,_,_,'Dubstep',_).
find_genre('Electronic',A) :-
	rec(_,A,_,_,'Grime',_).
find_genre('Electronic',A) :-
	rec(_,A,_,_,'Deep House',_).
find_genre('Electronic',A) :-
	rec(_,A,_,_,'Glitch',_).
find_genre('Electronic',A) :-
	rec(_,A,_,_,'Glitch Hop',_).
find_genre('Electronic',A) :-
	rec(_,A,_,_,'Progressive House',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'Chamber Pop',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'Psychedelic Pop',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'Soul',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'Singer-Songwriter',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'Neo-Soul',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'Pop Rap',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'R&B',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'Country',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'Art Pop',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'Indie Pop',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'Electropop',_).
find_genre('Pop',A) :-
	rec(_,A,_,_,'Power Pop',_).
find_genre('Hip Hop',A) :-
	rec(_,A,_,_,'Experimental Hip Hop',_).
find_genre('Jazz',A) :-
	rec(_,A,_,_,'Vocal Jazz',_).
find_genre('Jazz',A) :-
	rec(_,A,_,_,'Avant-Garde Jazz',_).


% Find albums that fit the year.
find_year(0,_).
find_year(1,A) :-
	rec(_,A,1,_,_,_).
find_year(2,A) :-
	rec(_,A,2,_,_,_).
find_year(Y,A) :-
	rec(_,A,_,Y,_,_).


% Find albums that fit the score.
find_score(0,_).
find_score(85,A) :-
	rec(_,A,_,_,_,85).
find_score(85,A) :-
	rec(_,A,_,_,_,86).
find_score(85,A) :-
	rec(_,A,_,_,_,87).
find_score(85,A) :-
	rec(_,A,_,_,_,88).
find_score(85,A) :-
	rec(_,A,_,_,_,89).
find_score(85,A) :-
	rec(_,A,_,_,_,90).
find_score(85,A) :-
	rec(_,A,_,_,_,91).
find_score(85,A) :-
	rec(_,A,_,_,_,92).
find_score(85,A) :-
	rec(_,A,_,_,_,93).
find_score(85,A) :-
	rec(_,A,_,_,_,94).
find_score(85,A) :-
	rec(_,A,_,_,_,95).


find_score(86,A) :-
	rec(_,A,_,_,_,86).
find_score(86,A) :-
	rec(_,A,_,_,_,87).
find_score(86,A) :-
	rec(_,A,_,_,_,88).
find_score(86,A) :-
	rec(_,A,_,_,_,89).
find_score(86,A) :-
	rec(_,A,_,_,_,90).
find_score(86,A) :-
	rec(_,A,_,_,_,91).
find_score(86,A) :-
	rec(_,A,_,_,_,92).
find_score(86,A) :-
	rec(_,A,_,_,_,93).
find_score(86,A) :-
	rec(_,A,_,_,_,94).
find_score(86,A) :-
	rec(_,A,_,_,_,95).


find_score(87,A) :-
	rec(_,A,_,_,_,87).
find_score(87,A) :-
	rec(_,A,_,_,_,88).
find_score(87,A) :-
	rec(_,A,_,_,_,89).
find_score(87,A) :-
	rec(_,A,_,_,_,90).
find_score(87,A) :-
	rec(_,A,_,_,_,91).
find_score(87,A) :-
	rec(_,A,_,_,_,92).
find_score(87,A) :-
	rec(_,A,_,_,_,93).
find_score(87,A) :-
	rec(_,A,_,_,_,94).
find_score(87,A) :-
	rec(_,A,_,_,_,95).


find_score(88,A) :-
	rec(_,A,_,_,_,88).
find_score(88,A) :-
	rec(_,A,_,_,_,89).
find_score(88,A) :-
	rec(_,A,_,_,_,90).
find_score(88,A) :-
	rec(_,A,_,_,_,91).
find_score(88,A) :-
	rec(_,A,_,_,_,92).
find_score(88,A) :-
	rec(_,A,_,_,_,93).
find_score(88,A) :-
	rec(_,A,_,_,_,94).
find_score(88,A) :-
	rec(_,A,_,_,_,95).


find_score(89,A) :-
	rec(_,A,_,_,_,89).
find_score(89,A) :-
	rec(_,A,_,_,_,90).
find_score(89,A) :-
	rec(_,A,_,_,_,91).
find_score(89,A) :-
	rec(_,A,_,_,_,92).
find_score(89,A) :-
	rec(_,A,_,_,_,93).
find_score(89,A) :-
	rec(_,A,_,_,_,94).
find_score(89,A) :-
	rec(_,A,_,_,_,95).


find_score(90,A) :-
	rec(_,A,_,_,_,90).
find_score(90,A) :-
	rec(_,A,_,_,_,91).
find_score(90,A) :-
	rec(_,A,_,_,_,92).
find_score(90,A) :-
	rec(_,A,_,_,_,93).
find_score(90,A) :-
	rec(_,A,_,_,_,94).
find_score(90,A) :-
	rec(_,A,_,_,_,95).


find_score(91,A) :-
	rec(_,A,_,_,_,91).
find_score(91,A) :-
	rec(_,A,_,_,_,92).
find_score(91,A) :-
	rec(_,A,_,_,_,93).
find_score(91,A) :-
	rec(_,A,_,_,_,94).
find_score(91,A) :-
	rec(_,A,_,_,_,95).


find_score(92,A) :-
	rec(_,A,_,_,_,92).
find_score(92,A) :-
	rec(_,A,_,_,_,93).
find_score(92,A) :-
	rec(_,A,_,_,_,94).
find_score(92,A) :-
	rec(_,A,_,_,_,95).


find_score(93,A) :-
	rec(_,A,_,_,_,93).
find_score(93,A) :-
	rec(_,A,_,_,_,94).
find_score(93,A) :-
	rec(_,A,_,_,_,95).


find_score(94,A) :-
	rec(_,A,_,_,_,94).
find_score(94,A) :-
	rec(_,A,_,_,_,95).


find_score(95,A) :-
	rec(_,A,_,_,_,95).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Show the Wikipedia page of a certain genre.
genreWiki(Y,S,G,1,A) :-
 	wikilink(G),
	page(G, U),
	www_open_url(U),
	write("\n\n\nAll Genre:
\nRock, Indie Rock, Alternative Rock, Art Rock, Experimental Rock, Psychedelic Rock, Acoustic Rock, Pop Rock, Country Rock, Progressive Rock, Post-Rock, Death Metal, Sludge Metal, Avant-Garde Metal, Post-Hardcore, Blackgaze, Post-Punk, Neo-Psychedelia, 
\nElectronic, Deep House, Progressive House, Glitch, Glitch Hop, Dubstep, Grime, 
\nPop, Chamber Pop, Psychedelic Pop, Art Pop, Indie Pop, Power Pop, Electropop, Pop Rap, R&B, Country, Soul, Neo-Soul, Singer-Songwriter,
\nJazz, Vocal Jazz, Avant-Garde Jazz,
\nHip Hop, Experimental Hip Hop,
\nFolk, World, Americana, Modern Classical, Afrobeat, Drone, Free Improvisation, UK Bass, Experimental, MPB.
\nEnter 0. = get all albums regardless of genre; or
Enter a genre (e.g. 'Rock'.) = choose that genre
Please enter: \n"),
	read(E),
	write("\n\nEnter 0. = get albums of that genre
Enter 1. = open Wikipedia page of that genre
Please enter: \n"),
	read(C),
	recommend(Y,S,E,C,A).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Show the Spotify page of a certain album.
listen :- 
	write("\nCopy the 'artistName - albumName' above (e.g. 'Four Tet - Rounds'.) to open an album on Spotify
Remember to change all special characters to a normal one (e.g. change é to e) and to delete all the '\' in it.
Please enter: \n"),
	read(AB),
	album_link(AB, L),
	www_open_url(L).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% rec(code, artistName - albumName, decade, year, genre, score)
% code: d0r1 = decade 2000s ranking 1, etc.
% decade : 1 = 2000s; 2 = 2010s;


% 2000s
rec(d0r1, 'Brian Wilson - SMiLE', 1, 2004, 'Rock', 94).
rec(d0r2, 'Burial - Untrue', 1, 2007, 'Dubstep', 94).
rec(d0r3, 'Arcade Fire - Funeral', 1, 2004, 'Indie Rock', 93).
rec(d0r4, 'Sufjan Stevens - Illinois', 1, 2005, 'Chamber Pop', 92).
rec(d0r5, 'Animal Collective - Merriweather Post Pavilion', 1, 2009, 'Psychedelic Pop', 92).
rec(d0r6, 'Wilco - Yankee Hotel Foxtrot', 1, 2002, 'Indie Rock', 92).
rec(d0r7, 'The Wrens - The Meadowlands', 1, 2003, 'Indie Rock', 92).
rec(d0r8, 'El-P - Fantastic Damage', 1, 2002, 'Experimental Hip Hop', 92).
rec(d0r9, 'Viktor Vaughn - Vaudeville Villain', 1, 2003, 'Hip Hop', 91).
rec(d0r10, 'Dizzee Rascal - Boy in da Corner', 1, 2003, 'Grime', 91).
rec(d0r11, 'Solomon Burke - Don\'t Give Up on Me', 1, 2002, 'Soul', 91).
rec(d0r12, 'Sunn O))) - Black One', 1, 2005, 'Drone', 90).
rec(d0r13, 'OutKast - Stankonia', 1, 2000, 'Hip Hop', 90).
rec(d0r14, 'Four Tet - Rounds', 1, 2003, 'Electronic', 90).
rec(d0r15, 'Brother Ali - Shadows on the Sun', 1, 2003, 'Hip Hop', 90).
rec(d0r16, 'DJ Sprinkles - Midtown 120 Blues', 1, 2008, 'Deep House', 90).
rec(d0r17, 'Menomena - I Am the Fun Blame Monster', 1, 2003, 'Experimental Rock', 89).
rec(d0r18, 'The Streets - Original Pirate Material', 1, 2002, 'Hip Hop', 89).
rec(d0r19, 'Fennesz - Endless Summer', 1, 2001, 'Glitch', 89).
rec(d0r20, 'Prefuse 73 - One Word Extinguisher', 1, 2003, 'Glitch Hop', 89).
rec(d0r21, 'Bob Dylan - Modern Times', 1, 2006, 'Folk', 89).
rec(d0r22, 'Ali Farka Touré - Savane', 1, 2006, 'World', 89).
rec(d0r23, 'Low - Things We Lost in the Fire', 1, 2001, 'Indie Rock', 89).
rec(d0r24, 'Bassekou Kouyate & Ngoni Ba - I Speak Fula', 1, 2009, 'World', 89).
rec(d0r25, 'Godspeed You! Black Emperor - Lift Your Skinny Fists Like Antennas to Heaven', 1, 2000, 'Post-Rock', 89).
rec(d0r26, 'Antony and the Johnsons - I Am a Bird Now', 1, 2005, 'Chamber Pop', 89).
rec(d0r27, 'D\'Angelo - Voodoo', 1, 2000, 'Neo-Soul', 88).
rec(d0r28, 'Madvillain - Madvillainy', 1, 2004, 'Hip Hop', 88).
rec(d0r29, 'Modest Mouse - The Moon & Antarctica', 1, 2000, 'Indie Rock', 88).
rec(d0r30, 'The Strokes - Is This It', 1, 2001, 'Indie Rock', 88).
rec(d0r31, 'Joanna Newsom - The Milk-Eyed Mender', 1, 2004, 'Folk', 88).
rec(d0r32, 'Augie March - Strange Bird', 1, 2002, 'Indie Pop', 88).
rec(d0r33, 'Baroness - Blue Record', 1, 2009, 'Sludge Metal', 88).
rec(d0r34, 'Animal Collective - Spirit They\'re Gone, Spirit They\'ve Vanished', 1, 2000, 'Neo-Psychedelia', 88).
rec(d0r35, 'Grandaddy - The Sophtware Slump', 1, 2000, 'Indie Pop', 88).
rec(d0r36, 'Sleater-Kinney - The Woods', 1, 2005, 'Indie Rock', 88).
rec(d0r37, 'Edan - Beauty and the Beat', 1, 2005, 'Hip Hop', 88).
rec(d0r38, 'Dungen - Ta Det Lugnt', 1, 2004, 'Psychedelic Rock', 88).
rec(d0r39, 'Clipse - Hell Hath No Fury', 1, 2006, 'Hip Hop', 88).
rec(d0r40, 'Max Richter - The Blue Notebooks', 1, 2004, 'Modern Classical', 88).
rec(d0r41, 'Manitoba - Up in Flames', 1, 2003, 'Psychedelic Pop', 88).
rec(d0r42, 'Radiohead - In Rainbows', 1, 2007, 'Alternative Rock', 88).
rec(d0r43, 'Rokia Traoré - Tchamantché', 1, 2008, 'Afrobeat', 88).
rec(d0r44, 'Supersilent - 6', 1, 2003, 'Free Improvisation', 87).
rec(d0r45, 'Shackleton - Three EPs', 1, 2009, 'UK Bass', 87).
rec(d0r46, 'RJD2 - Deadringer', 1, 2002, 'Hip Hop', 87).
rec(d0r47, 'Jim O\'Rourke - The Visitor', 1, 2009, 'Experimental', 87).
rec(d0r48, 'M.I.A. - Arular', 1, 2005, 'Electropop', 87).
rec(d0r49, 'Owen - New Leaves', 1, 2009, 'Acoustic Rock', 87).
rec(d0r50, 'The Bug - London Zoo', 1, 2008, 'Dubstep', 87).


% 2010s
rec(d1r1, 'Kendrick Lamar - To Pimp a Butterfly', 2, 2015, 'Hip Hop', 95).
rec(d1r2, 'Blood Incantation - Hidden History of the Human Race', 2, 2019, 'Death Metal', 94).
rec(d1r3, 'Nick Cave & The Bad Seeds - Ghosteen', 2, 2019, 'Singer-Songwriter', 93).
rec(d1r4, 'Kendrick Lamar - DAMN.', 2, 2017, 'Hip Hop', 93).
rec(d1r5, 'Cécile McLorin Salvant - Dreams and Daggers', 2, 2017, 'Vocal Jazz', 93).
rec(d1r6, 'Anaïs Mitchell - Hadestown', 2, 2010, 'Folk', 92).
rec(d1r7, 'D\'Angelo and The Vanguard - Black Messiah', 2, 2014, 'Neo-Soul', 92).
rec(d1r8, 'Kanye West - My Beautiful Dark Twisted Fantasy', 2, 2010, 'Pop Rap', 92).
rec(d1r9, 'Frank Ocean - Channel Orange', 2, 2012, 'R&B', 91).
rec(d1r10, 'Jamey Johnson - The Guitar Song', 2, 2010, 'Country', 91).
rec(d1r11, 'Lorde - Melodrama', 2, 2017, 'Art Pop', 91).
rec(d1r12, 'Sufjan Stevens - Carrie & Lowell', 2, 2015, 'Folk', 91).
rec(d1r13, 'Mount Eerie - A Crow Looked at Me', 2, 2017, 'Singer-Songwriter', 91).
rec(d1r14, 'Nick Cave & The Bad Seeds - Skeleton Tree', 2, 2016, 'Art Rock', 91).
rec(d1r15, 'Matana Roberts - Coin Coin Chapter Two: Mississippi Moonchile', 2, 2013, 'Avant-Garde Jazz', 90).
rec(d1r16, 'Lankum - The Livelong Day', 2, 2019, 'Folk', 90).
rec(d1r17, 'Sam Lee & Friends - The Fade In Time', 2, 2015, 'Folk', 90).
rec(d1r18, 'Employed to Serve - Eternal Forward Motion', 2, 2019, 'Post-Hardcore', 90).
rec(d1r19, 'Mary Gauthier - Rifles & Rosary Beads', 2, 2018, 'Americana', 90).
rec(d1r20, 'Deafheaven - Sunbather', 2, 2013, 'Blackgaze', 90).
rec(d1r21, 'Beyoncé - Lemonade', 2, 2016, 'R&B', 90).
rec(d1r22, 'Kendrick Lamar - good kid, m.A.A.d city', 2, 2012, 'Hip Hop', 90).
rec(d1r23, 'Fontaines D.C. - Dogrel', 2, 2019, 'Post-Punk', 90).
rec(d1r24, 'Wayne Shorter Quartet - Without a Net', 2, 2013, 'Avant-Garde Jazz', 89).
rec(d1r25, 'PJ Harvey - Let England Shake', 2, 2011, 'Alternative Rock', 89).
rec(d1r26, 'Leonard Cohen - You Want It Darker', 2, 2016, 'Singer-Songwriter', 89).
rec(d1r27, 'Sleater-Kinney - No Cities to Love', 2, 2015, 'Indie Rock', 89).
rec(d1r28, 'Ry Cooder - Pull Up Some Dust and Sit Down', 2, 2011, 'Folk', 89).
rec(d1r29, 'FKA twigs - MAGDALENE', 2, 2019, 'Art Pop', 88).
rec(d1r30, 'Idles - Joy as an Act of albumistance', 2, 2018, 'Post-Punk', 88).
rec(d1r31, 'Mbongwana Star - From Kinshasa', 2, 2015, 'World', 88).
rec(d1r32, 'Swans - To Be Kind', 2, 2014, 'Experimental Rock', 88).
rec(d1r33, 'Black Peaks - All That Divides', 2, 2018, 'Progressive Rock', 88).
rec(d1r34, 'Macy Gray - Ruby', 2, 2018, 'Soul', 88).
rec(d1r35, 'Jason Moran - All Rise: A Joyful Elegy for Fats Waller', 2, 2014, 'Jazz', 88).
rec(d1r36, 'Solange - A Seat at the Table', 2, 2016, 'R&B', 88).
rec(d1r37, 'Joanna Newsom - Divers', 2, 2015, 'Single-Songwriter', 88).
rec(d1r38, 'Arcade Fire - The Suburbs', 2, 2010, 'Indie Rock', 88).
rec(d1r39, 'Julia Holter - Have You in My Wilderness', 2, 2015, 'Art Pop', 88).
rec(d1r40, 'Indoor Pets - Be Content', 2, 2019, 'Power Pop', 88).
rec(d1r41, 'Elza Soaalbum - A Mulher do Fim do Mundo', 2, 2015, 'MPB', 88).
rec(d1r42, 'Dave - Psychodrama', 2, 2019, 'Hip Hop', 88).
rec(d1r43, 'Janelle Monáe - The ArchAndroid', 2, 2010, 'R&B', 88).
rec(d1r44, 'Sigh - Heir To Despair', 2, 2018, 'Avant-Garde Metal', 88).
rec(d1r45, 'Matana Roberts - COIN COIN Chapter Four: Memphis', 2, 2019, 'Avant-Garde Jazz', 88).
rec(d1r46, 'Robyn - Honey', 2, 2018, 'Electropop', 88).
rec(d1r47, 'Ali Farka Toure & Toumani Diabate - Ali & Toumani', 2, 2010, 'World', 87).
rec(d1r48, 'Rokia Traoré - Beautiful Africa', 2, 2013, 'World', 87).
rec(d1r49, 'Steven Wilson - Hand. Cannot. Erase.', 2, 2015, 'Art Rock', 87).
rec(d1r50, 'Bon Iver - 22, A Million', 2, 2016, 'Art Pop', 87).


wikilink('Rock') :-
write("\nhttps://en.wikipedia.org/wiki/Rock_music").
wikilink('Indie Rock') :-
write("\nhttps://en.wikipedia.org/wiki/Indie_rock").
wikilink('Alternative Rock') :-
write("\nhttps://en.wikipedia.org/wiki/Alternative_rock").
wikilink('Art Rock') :-
write("\nhttps://en.wikipedia.org/wiki/Art_rock").
wikilink('Experimental Rock') :-
write("\nhttps://en.wikipedia.org/wiki/Experimental_rock").
wikilink('Psychedelic Rock') :-
write("\nhttps://en.wikipedia.org/wiki/Psychedelic_rock").
wikilink('Acoustic Rock') :-
write("\nhttps://en.wikipedia.org/wiki/Acoustic_music").
wikilink('Pop Rock') :-
write("\nhttps://en.wikipedia.org/wiki/Pop_rock").
wikilink('Country Rock') :-
write("\nhttps://en.wikipedia.org/wiki/Country_rock").
wikilink('Progressive Rock') :-
write("\nhttps://en.wikipedia.org/wiki/Progressive_rock").
wikilink('Post-Rock') :-
write("\nhttps://en.wikipedia.org/wiki/Post-rock").
wikilink('Death Metal') :-
write("\nhttps://en.wikipedia.org/wiki/Death_metal").
wikilink('Sludge Metal') :-
write("\nhttps://en.wikipedia.org/wiki/Sludge_metal").
wikilink('Avant-Garde Metal') :-
write("\nhttps://en.wikipedia.org/wiki/Avant-garde_metal").
wikilink('Post-Hardcore') :-
write("\nhttps://en.wikipedia.org/wiki/Post-hardcore").
wikilink('Blackgaze') :-
write("\nhttps://en.wikipedia.org/wiki/Blackgaze").
wikilink('Post-Punk') :-
write("\nhttps://en.wikipedia.org/wiki/Post-punk").
wikilink('Neo-Psychedelia') :-
write("\nhttps://en.wikipedia.org/wiki/Neo-psychedelia").
wikilink('Electronic') :-
write("\nhttps://en.wikipedia.org/wiki/Electronic").
wikilink('Deep House') :-
write("\nhttps://en.wikipedia.org/wiki/Deep_house").
wikilink('Progressive House') :-
write("\nhttps://en.wikipedia.org/wiki/Progressive_house").
wikilink('Glitch') :-
write("\nhttps://en.wikipedia.org/wiki/Glitch").
wikilink('Glitch Hop') :-
write("\nhttps://en.wikipedia.org/wiki/Glitch_(music)#Glitch_hop").
wikilink('Dubstep') :-
write("\nhttps://en.wikipedia.org/wiki/Dubstep").
wikilink('Grime') :-
write("\nhttps://en.wikipedia.org/wiki/Grime_(music_genre)").
wikilink('Pop') :-
write("\nhttps://en.wikipedia.org/wiki/Pop_music").
wikilink('Chamber Pop') :-
write("\nhttps://en.wikipedia.org/wiki/Chamber_pop").
wikilink('Psychedelic Pop') :-
write("\nhttps://en.wikipedia.org/wiki/Psychedelic_pop").
wikilink('Art Pop') :-
write("\nhttps://en.wikipedia.org/wiki/Art_Pop").
wikilink('Indie Pop') :-
write("\nhttps://en.wikipedia.org/wiki/Indie_pop").
wikilink('Power Pop') :-
write("\nhttps://en.wikipedia.org/wiki/Power_pop").
wikilink('Electropop') :-
write("\nhttps://en.wikipedia.org/wiki/Electropop").
wikilink('Pop Rap') :-
write("\nhttps://en.wikipedia.org/wiki/Pop_rap").
wikilink('R&B') :-
write("\nhttps://en.wikipedia.org/wiki/Rhythm_and_blues").
wikilink('Country') :-
write("\nhttps://en.wikipedia.org/wiki/Country_music").
wikilink('Soul') :-
write("\nhttps://en.wikipedia.org/wiki/Soul").
wikilink('Neo-Soul') :-
write("\nhttps://en.wikipedia.org/wiki/Neo_soul").
wikilink('Singer-Songwriter') :-
write("\nhttps://en.wikipedia.org/wiki/Singer-songwriter").
wikilink('Jazz') :-
write("\nhttps://en.wikipedia.org/wiki/Jazz").
wikilink('Vocal Jazz') :-
write("\nhttps://en.wikipedia.org/wiki/Vocal_jazz").
wikilink('Avant-Garde Jazz') :-
write("\nhttps://en.wikipedia.org/wiki/Avant-garde_jazz").
wikilink('Hip Hop') :-
write("\nhttps://en.wikipedia.org/wiki/Hip_hop").
wikilink('Experimental Hip Hop') :-
write("\nhttps://en.wikipedia.org/wiki/Alternative_hip_hop").
wikilink('Folk') :-
write("\nhttps://en.wikipedia.org/wiki/Folk").
wikilink('World') :-
write("\nhttps://en.wikipedia.org/wiki/World_music").
wikilink('Americana') :-
write("\nhttps://en.wikipedia.org/wiki/Americana_(music)").
wikilink('Modern Classical') :-
write("\nhttps://en.wikipedia.org/wiki/Modernism_(music)").
wikilink('Afrobeat') :-
write("\nhttps://en.wikipedia.org/wiki/Afrobeat").
wikilink('Drone') :-
write("\nhttps://en.wikipedia.org/wiki/Drone_music").
wikilink('Free Improvisation') :-
write("\nhttps://en.wikipedia.org/wiki/Free_improvisation").
wikilink('UK Bass') :-
write("\nhttps://en.wikipedia.org/wiki/UK_bass").
wikilink('Experimental') :-
write("\nhttps://en.wikipedia.org/wiki/Experimental_music").
wikilink('MPB') :-
write("\nhttps://en.wikipedia.org/wiki/Música_popular_brasileira").


page('Rock', "https://en.wikipedia.org/wiki/Rock_music").
page('Indie Rock', "https://en.wikipedia.org/wiki/Indie_rock").
page('Alternative Rock', "https://en.wikipedia.org/wiki/Alternative_rock").
page('Art Rock', "https://en.wikipedia.org/wiki/Art_rock").
page('Experimental Rock', "https://en.wikipedia.org/wiki/Experimental_rock").
page('Psychedelic Rock', "https://en.wikipedia.org/wiki/Psychedelic_rock").
page('Acoustic Rock', "https://en.wikipedia.org/wiki/Acoustic_music").
page('Pop Rock', "https://en.wikipedia.org/wiki/Pop_rock").
page('Country Rock', "https://en.wikipedia.org/wiki/Country_rock").
page('Progressive Rock', "https://en.wikipedia.org/wiki/Progressive_rock").
page('Post-Rock', "https://en.wikipedia.org/wiki/Post-rock").
page('Death Metal', "https://en.wikipedia.org/wiki/Death_metal").
page('Sludge Metal', "https://en.wikipedia.org/wiki/Sludge_metal").
page('Avant-Garde Metal', "https://en.wikipedia.org/wiki/Avant-garde_metal").
page('Post-Hardcore', "https://en.wikipedia.org/wiki/Post-hardcore").
page('Blackgaze', "https://en.wikipedia.org/wiki/Blackgaze").
page('Post-Punk', "https://en.wikipedia.org/wiki/Post-punk").
page('Neo-Psychedelia', "https://en.wikipedia.org/wiki/Neo-psychedelia").
page('Electronic', "https://en.wikipedia.org/wiki/Electronic").
page('Deep House', "https://en.wikipedia.org/wiki/Deep_house").
page('Progressive House', "https://en.wikipedia.org/wiki/Progressive_house").
page('Glitch', "https://en.wikipedia.org/wiki/Glitch").
page('Glitch Hop', "https://en.wikipedia.org/wiki/Glitch_(music)#Glitch_hop").
page('Dubstep', "https://en.wikipedia.org/wiki/Dubstep").
page('Grime', "https://en.wikipedia.org/wiki/Grime_(music_genre)").
page('Pop', "https://en.wikipedia.org/wiki/Pop_music").
page('Chamber Pop', "https://en.wikipedia.org/wiki/Chamber_pop").
page('Psychedelic Pop', "https://en.wikipedia.org/wiki/Psychedelic_pop").
page('Art Pop', "https://en.wikipedia.org/wiki/Art_Pop").
page('Indie Pop', "https://en.wikipedia.org/wiki/Indie_pop").
page('Power Pop', "https://en.wikipedia.org/wiki/Power_pop").
page('Electropop', "https://en.wikipedia.org/wiki/Electropop").
page('Pop Rap', "https://en.wikipedia.org/wiki/Pop_rap").
page('R&B', "https://en.wikipedia.org/wiki/Rhythm_and_blues").
page('Country', "https://en.wikipedia.org/wiki/Country_music").
page('Soul', "https://en.wikipedia.org/wiki/Soul").
page('Neo-Soul', "https://en.wikipedia.org/wiki/Neo_soul").
page('Singer-Songwriter', "https://en.wikipedia.org/wiki/Singer-songwriter").
page('Jazz', "https://en.wikipedia.org/wiki/Jazz").
page('Vocal Jazz', "https://en.wikipedia.org/wiki/Vocal_jazz").
page('Avant-Garde Jazz', "https://en.wikipedia.org/wiki/Avant-garde_jazz").
page('Hip Hop', "https://en.wikipedia.org/wiki/Hip_hop").
page('Experimental Hip Hop', "https://en.wikipedia.org/wiki/Alternative_hip_hop").
page('Folk', "https://en.wikipedia.org/wiki/Folk").
page('World', "https://en.wikipedia.org/wiki/World_music").
page('Americana', "https://en.wikipedia.org/wiki/Americana_(music)").
page('Modern Classical', "https://en.wikipedia.org/wiki/Modernism_(music)").
page('Afrobeat', "https://en.wikipedia.org/wiki/Afrobeat").
page('Drone', "https://en.wikipedia.org/wiki/Drone_music").
page('Free Improvisation', "https://en.wikipedia.org/wiki/Free_improvisation").
page('UK Bass', "https://en.wikipedia.org/wiki/UK_bass").
page('Experimental', "https://en.wikipedia.org/wiki/Experimental_music").
page('MPB', "https://en.wikipedia.org/wiki/Música_popular_brasileir").


album_link('Brian Wilson - SMiLE' , "https://open.spotify.com/album/4Uc6YCjpfyjj02rZfg2EUv").
album_link('Burial - Untrue' , "https://open.spotify.com/album/1CI5OW60s9W41YLI80Jjdr").
album_link('Arcade Fire - Funeral' , "https://open.spotify.com/album/6ZB8qaR9JNuS0Q0bG1nbcH").
album_link('Sufjan Stevens - Illinois' , "https://open.spotify.com/album/7j8lfKDdL7vE8OAM4cA3W3").
album_link('Animal Collective - Merriweather Post Pavilion' , "https://open.spotify.com/album/5O9OXl9zAWMJTzawofxuan").
album_link('Wilco - Yankee Hotel Foxtrot' , "https://open.spotify.com/album/0rPtXOMN42nsLDiShvGamv").
album_link('The Wrens - The Meadowlands' , "https://open.spotify.com/album/4Olz2cm8ncBqhnRcDwqVFK").
album_link('El-P - Fantastic Damage' , "https://open.spotify.com/album/3nYpH1H9zjeeANZv47LDap").
album_link('Viktor Vaughn - Vaudeville Villain' , "https://open.spotify.com/album/7HPjcPD2cr8E5oHvVAmBp7").
album_link('Dizzee Rascal - Boy in da Corner' , "https://open.spotify.com/album/4Xab3wViIfg4Q89HNbouRW").
album_link('Solomon Burke - Don\'t Give Up on Me' , "https://open.spotify.com/playlist/0ShmTWljvGAvocAoDdqIht").
album_link('Sunn O))) - Black One' , "https://open.spotify.com/album/3oFLD6FiLtAe1Ykq3wWuPf").
album_link('OutKast - Stankonia' , "https://open.spotify.com/album/2tm3Ht61kqqRZtIYsBjxEj").
album_link('Four Tet - Rounds' , "https://open.spotify.com/album/1ehwJGN59cUxk9LuHRHJdv").
album_link('Brother Ali - Shadows on the Sun' , "https://open.spotify.com/album/1pA2XeTWN2Y2XNP2YSzbja").
album_link('DJ Sprinkles - Midtown 120 Blues' , "https://open.spotify.com/playlist/4EAHDn4Ow2z4Hg1KdayXgj").
album_link('Menomena - I Am the Fun Blame Monster' , "https://open.spotify.com/album/2wi8wJPFkSVrXe4riTbk95").
album_link('The Streets - Original Pirate Material' , "https://open.spotify.com/album/0hkZGxfsFypXbjq15hM6U9").
album_link('Fennesz - Endless Summer' , "https://open.spotify.com/album/0xnL6goTzcRFKzbrleXfpF").
album_link('Prefuse 73 - One Word Extinguisher' , "https://open.spotify.com/album/4HxVSDIZ8rbertWVDYFz9m").
album_link('Bob Dylan - Modern Times' , "https://open.spotify.com/album/6y2WHyqRUCeHrjMXvjnRmD").
album_link('Ali Farka Toure - Savane' , "https://open.spotify.com/album/1lbT3JkVYPxbcDtebod6Ez").
album_link('Bassekou Kouyate & Ngoni Ba - I Speak Fula' , "https://open.spotify.com/album/6LfK90f2ReW6QUM5KDslrz").
album_link('Godspeed You! Black Emperor - Lift Your Skinny Fists Like Antennas to Heaven' , "https://open.spotify.com/album/2rT82YYlV9UoxBYLIezkRq").
album_link('Antony and the Johnsons - I Am a Bird Now' , "https://open.spotify.com/album/4yYa6DGzkYsAIpoE8ael1V").
album_link('D\'Angelo - Voodoo' , "https://open.spotify.com/album/2lO9yuuIDgBpSJzxTh3ai8").
album_link('Madvillain - Madvillainy' , "https://open.spotify.com/album/01FCoGEQ3NFWF4fHJzdiax").
album_link('Modest Mouse - The Moon & Antarctica' , "https://open.spotify.com/album/5SbcupirEParczvqqyUPXL").
album_link('The Strokes - Is This It' , "https://open.spotify.com/album/2yNaksHgeMQM9Quse463b5").
album_link('Joanna Newsom - The Milk-Eyed Mender' , "https://open.spotify.com/playlist/6kMijzSUWCCvxPa1OC8Oki").
album_link('Augie March - Strange Bird' , "https://open.spotify.com/album/48BZEFbmqYUFQr4llyzbYv").
album_link('Baroness - Blue Record' , "https://open.spotify.com/search/Baroness%20-%20Blue%20Record").
album_link('Grandaddy - The Sophtware Slump' , "https://open.spotify.com/album/4iUBdDlipS1BISMY5Bk2gQ").
album_link('Sleater-Kinney - The Woods' , "https://open.spotify.com/album/73ctstwnbNifu5U902X2zL").
album_link('Edan - Beauty and the Beat' , "https://open.spotify.com/episode/6WRmUeOoKU5WJfOqIGaomL").
album_link('Dungen - Ta Det Lugnt' , "https://open.spotify.com/album/3EG5tuu7kUS7IXdiyFjuX7").
album_link('Clipse - Hell Hath No Fury' , "https://open.spotify.com/album/1HftQWyKWoGsrmG5lRkJDE").
album_link('Max Richter - The Blue Notebooks' ,"https://open.spotify.com/album/0m6Zt3YJAMWwGRTPvTnY4g" ).
album_link('Manitoba - Up in Flames' , "https://open.spotify.com/playlist/7seTvP7nu4PTwbYTlxFlc2").
album_link('Radiohead - In Rainbows' , "https://open.spotify.com/album/5vkqYmiPBYLaalcmjujWxK").
album_link('Rokia Traore - Tchamantche' , "https://open.spotify.com/album/7fzlbT0KWe5H0fI0zO1f8Q").
album_link('Supersilent - 6' , "https://open.spotify.com/album/05urx7REFTNROuBIGU2t3A").
album_link('RJD2 - Deadringer' , "https://open.spotify.com/album/7DmNwRBDJRUEFUlk3oa2Aj").
album_link('M.I.A. - Arular' , "https://open.spotify.com/album/7CzEknt9gJwe0QC89ir1JX").
album_link('The Bug - London Zoo' , "https://open.spotify.com/album/0Au4HNwGtEi5iOFprP0027").
album_link('Kendrick Lamar - To Pimp a Butterfly', "https://open.spotify.com/album/7ycBtnsMtyVbbwTfJwRjSP").
album_link('Blood Incantation - Hidden History of the Human Race', "https://open.spotify.com/album/34U0n1oAE5mwgdaIBrcIck").
album_link('Nick Cave & The Bad Seeds - Ghosteen', "https://open.spotify.com/episode/7HBbpsp90DFAJ5zuvrQ4hb").
album_link('Kendrick Lamar - DAMN.', "https://open.spotify.com/album/4eLPsYPBmXABThSJ821sqY").
album_link('Cecile McLorin Salvant - Dreams and Daggers', "https://open.spotify.com/album/3RumrUNvUdGyLTyg1tyoRe").
album_link('Anais Mitchell - Hadestown', "https://open.spotify.com/album/1J1yxODbNlqKbwRqJxYJUP").
album_link('D\'Angelo and The Vanguard - Black Messiah', "https://open.spotify.com/episode/1BclvVkqo2RgTtd5EGwtaQ").
album_link('Kanye West - My Beautiful Dark Twisted Fantasy', "https://open.spotify.com/album/20r762YmB5HeofjMCiPMLv").
album_link('Frank Ocean - Channel Orange', "https://open.spotify.com/album/392p3shh2jkxUxY2VHvlH8").
album_link('Jamey Johnson - The Guitar Song', "https://open.spotify.com/album/7glcyk6Q02m2ntmmwY2CbB").
album_link('Lorde - Melodrama', "https://open.spotify.com/album/2B87zXm9bOWvAJdkJBTpzF").
album_link('Sufjan Stevens - Carrie & Lowell', "https://open.spotify.com/album/0U8DeqqKDgIhIiWOdqiQXE").
album_link('Mount Eerie - A Crow Looked at Me', "https://open.spotify.com/album/5p64XgvFREt1P6mC7Xl6XN").
album_link('Nick Cave & The Bad Seeds - Skeleton Tree', "https://open.spotify.com/episode/3Jig4PwWfbAX4TT5OC9ySJ").
album_link('Matana Roberts - Coin Coin Chapter Two: Mississippi Moonchile', "https://open.spotify.com/album/1YxAk31ubgcjfSvMBM7BhP").
album_link('Lankum - The Livelong Day', "https://open.spotify.com/album/4h6xvRg0yciHX5BidpT1yC").
album_link('Sam Lee & Friends - The Fade In Time', "https://open.spotify.com/album/0evPPH0sWUtokP05WDAe9O").
album_link('Employed to Serve - Eternal Forward Motion', "https://open.spotify.com/album/49jPlzh1ctzrab4wQAJ4Jz").
album_link('Deafheaven - Sunbather', "https://open.spotify.com/album/2kKXGWaCEl06EKZ4DxBJIT").
album_link('Beyonce - Lemonade', "https://open.spotify.com/album/7dK54iZuOxXFarGhXwEXfF").
album_link('Kendrick Lamar - good kid, m.A.A.d city', "https://open.spotify.com/album/3DGQ1iZ9XKUQxAUWjfC34w").
album_link('Fontaines D.C. - Dogrel', "https://open.spotify.com/album/7wMhg0YqDuqylEVnLQQ02R").
album_link('PJ Harvey - Let England Shake', "https://open.spotify.com/album/2JfiVMvVhdueC48EmskS7t").
album_link('Leonard Cohen - You Want It Darker', "https://open.spotify.com/album/3jeTB3j3QmUs8SPIVleHtU").
album_link('Sleater-Kinney - No Cities to Love', "https://open.spotify.com/album/7HDcY3h70X3zLjceUO874A").
album_link('Ry Cooder - Pull Up Some Dust and Sit Down', "https://open.spotify.com/album/3IVWmaFJtcx2awW1QPV8GD").
album_link('FKA twigs - MAGDALENE', "https://open.spotify.com/album/3DMR3yM5crnt1dG9lLaMTZ").
album_link('Mbongwana Star - From Kinshasa', "https://open.spotify.com/album/4jxadKQuiYYef3vwEenlZh").
album_link('Swans - To Be Kind', "https://open.spotify.com/album/4dq7JNcHKrnozzFQg5bpmn").
album_link('Black Peaks - All That Divides', "https://open.spotify.com/album/64nOhJqFoQi9P8LVjS4tuG").
album_link('Macy Gray - Ruby', "https://open.spotify.com/album/3NaRWUhsOLdHsmqJON0aiv").
album_link('Jason Moran - All Rise: A Joyful Elegy for Fats Waller', "https://open.spotify.com/album/1IJh4pZRNHDq2dzvm2F23H").
album_link('Solange - A Seat at the Table', "https://open.spotify.com/album/3Yko2SxDk4hc6fncIBQlcM").
album_link('Joanna Newsom - Divers', "https://open.spotify.com/playlist/5bYYzYZd5XdiI29c5yxh2m").
album_link('Arcade Fire - The Suburbs', "https://open.spotify.com/album/3DrgM5X3yX1JP1liNLAOHI").
album_link('Julia Holter - Have You in My Wilderness', "https://open.spotify.com/album/0EiGGBzF9wzJn2X8F0Yvjh").
album_link('Indoor Pets - Be Content', "https://open.spotify.com/album/4OnQDv9959XqtXaN9GIM4u").
album_link('Dave - Psychodrama', "https://open.spotify.com/album/4GrFuXwRmEBJec22p58fsD").
album_link('Janelle Monae - The ArchAndroid', "https://open.spotify.com/album/7MvSB0JTdtl1pSwZcgvYQX").
album_link('Matana Roberts - COIN COIN Chapter Four: Memphis', "https://open.spotify.com/album/5mIDlb3HP4bTFU7SbmuIoF").
album_link('Robyn - Honey', "https://open.spotify.com/album/6WZjFvrzwq8SOGe0r8R3qk").
album_link('Ali Farka Toure & Toumani Diabate - Ali & Toumani', "https://open.spotify.com/playlist/5ATFcDDCez4g71szihiuiv").
album_link('Rokia Traoré - Beautiful Africa', "https://open.spotify.com/album/5gCev1aMAHiG6qmS32mfzj").
album_link('Steven Wilson - Hand. Cannot. Erase.', "https://open.spotify.com/album/6P7vL4vGgyrD7q9VR9BcnV").
album_link('Bon Iver - 22, A Million', "https://open.spotify.com/album/1PgfRdl3lPyACfUGH4pquG").
