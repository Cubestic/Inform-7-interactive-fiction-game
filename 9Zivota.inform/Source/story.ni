"9Zivota" by Andrej

Chapter 1 - Game setup

Include Vorple Notifications by Juhana Leinonen.

Include Vorple Multimedia by Juhana Leinonen.

Include Vorple Screen Effects by Juhana Leinonen.

Include Vorple Hyperlinks by Juhana Leinonen.

Include Vorple Tooltips by Juhana Leinonen.

Include Vorple Status Line by Juhana Leinonen.

Release along with the "Vorple" interpreter.

Release along with the file "heart.png".

Release along with the file "backpack.png".

Release along with the file "titlescreen.png".

Release along with the file "cardinaldirections.png".

Release along with the file "map.png".

Release along with the file "map.html".

Release along with the file "desk.png".

Release along with the file "note1.png"

Release along with the file "note1a.png"

Release along with the file "Tagesschrift-Regular.ttf".

Release along with style sheet "my.css".

Chapter 2 - Rooms

The Garage is a room. "A place where you spend your nights resting. Below the window, lies a bed without a pillow. Ahead of you stretches a dark hallway."

The Hallway is a room. It is north of the Garage. "A cold, long hallway that leads to nowhere."

The Storeroom is a room. It is east of the Garage. "Description missing."

The Entrance hall is a room. "In the distance, you hear a woman’s voice. You feel stiff and tired, as if you hadn’t slept at all last night. You decide to head toward the woman’s voice."

[!]

The Kitchen is a room. It is north of the Entrance hall. ["Here I always get something to eat, but I'm not always welcome. The way to the north and west is open.[if we have not taken the rope]  A dangerous pit with spikes blocks the way to the east.[otherwise]I think I can swing across the pit now."]

The Living room is a room. It is north of the Kitchen. ["A large room full of light. The path to the northwest is open. A pair of large red doors leads to the northeast. I'm rarely allowed to go through those doors alone.[if we have not taken the red key]They're always locked.[otherwise]The doors can be opened now."]

[!] The Library is a room. 

The Basement is a room. It is south of the Library. ["It's damp and darker than the garage. The woman's voice can't be heard in here."]

The Dining room is a room. It is west of the Kitchen. ["An old room with yellow wallpaper that leads to the attic."]

The Attic is a room. It is north of the Dining room. ["Unbearable heat. I can't stay here for more than 10 minutes. You see a friend in a black-and-white coat selling something."]

The Pantry is a room. It is east of the Study. "A small room where you usually find sweets."

The Study is a room. It is north of the Living room. [["A nicely decorated room with your picture on the table and your name on the back – Eugen." if the armor is not carried]Dangerous rotating blades block the way to the west. [otherwise]I think the armor protects me from the blades."]

[!]

The Bathroom is a room. ["I'm out of armor—there's no going back. It seems I'm stuck here."]

The Garden is a room. ["After the garage, your favorite place to relax."]

The Bedroom is a room. ["I appear in the bedroom and see my owner looking for me under the bed.[line break]Woman’s voice: Here, kitty kitty, I have something nice for you."]

Chapter 3 - Doors
 
The spike pit is a door.
It is east of the Kitchen and west of the Library.[?] 
It is open, not openable and scenery.

Chapter 4 - Items

The chest is a container.
The description is "?".
It is in the Storeroom.
It is closed, openable and fixed in place.
The coin is in the chest.

The rope is in the Dining room.
It is wearable.
The description is "This will come in handy."

Brown key is in the secret drawer.

Note is on the desk in the Entrance hall.

Chapter 5 - Dying

The player has a number called lives. The lives of the player is 9.

To kill the player:
	decrease the lives of the player by 1;
	execute JavaScript command "document.querySelector('#heart-container .heart')?.remove();";
	if the lives of the player is 0:
		say "[line break]You are out of lives!";
		execute JavaScript command "setTimeout(() => location.reload(), 5000);";
		end the story saying "[bold type]GAME OVER";
	otherwise:
		say "[line break][bold type]YOU DIED[line break]";
		now the player is in the Kitchen. [ne moze uvijek biti u kuhinji]
		
Check going through a spike pit:
	say "I can't get over this, but I might be able to swing across using something.";
	if a rope is worn:
		say "I made it! This rope will come in handy on the way back too.";
		continue the action;
	otherwise if a rope is carried:
		say "A rope is more useful if you [italic type]wear, [roman type]it, not just have it in your inventory.";
		kill the player;
		stop the action;
	otherwise:
		kill the player;
		stop the action.
		
Chapter 6 - Inventory
		
The carrying capacity of the player is 1.

Carry out taking inventory (this is the print inventory using HTML lists rule):
	if Vorple is supported:
		say "[We] [are] carrying:[line break]";
		open HTML tag "ul";
		repeat with item running through things carried by the player:
			place "li" element reading "[item]";
		close HTML tag;
	otherwise:
		follow the print standard inventory rule.
		
The print inventory using HTML lists rule is listed instead of the print standard inventory rule in the carry out taking inventory rules.

Chapter 7 - Title screen

When play begins:
	if Vorple is supported:
		place an image "titlescreen.png" with the description "?", centered;
	center "[fantasy font style][play the game][end style]";
	wait for the SPACE key;
	clear the screen.
	
To say play the game:
	if Vorple is supported:
		place a link to execute the JavaScript command "vorple.prompt.queueKeypress(' ')" reading "PLAY".
		
Rule for printing the banner text: do nothing.

Chapter 8 - Player's name

The player's full name is a text that varies.

When play begins:
	now the command prompt is "What is your name? > ".

To decide whether collecting names:
	if the command prompt is "What is your name? > ", yes;
	no.

After reading a command when collecting names:
	let N be the number of characters in the player's command;
	if N < 2:
		say "[line break]Too short. Try again!";
		reject the player's command;
	if N > 10:
		say "[line break]Whoa! Let's keep it under 10 letters, superstar. Try a shorter name.";
		reject the player's command;
	now the player's full name is the player's command;
	now the command prompt is ">";
	say "[line break]Hi, [bold type][player's full name][roman type]! I’m glad you’re back. You've been gone for quite some time. Let’s remember how things work around here.[line break]";
	move the player to the Garage, without printing a room description;
	display tooltip "Try to LOOK around you." on the prompt;
	reject the player's command.
	
Instead of looking when collecting names: do nothing.

Rule for printing the banner text when collecting names: do nothing.

Rule for constructing the status line when collecting names: do nothing.

Chapter 9 - Miscellanous

Chapter 10 - Tutorial

The default tooltip duration is 10.

To directions:
	execute JavaScript command "
		let cd = document.createElement('div');
		cd.id = 'directions';
		document.body.appendChild(cd);
	".

To move north:
	execute JavaScript command "
		let n = document.createElement('div');
		n.id = 'north';
		n.onclick = () => vorple.prompt.submit('north');
		document.body.appendChild(n);
	".

To move east:
	execute JavaScript command "
		let e = document.createElement('div');
		e.id = 'east';
		e.onclick = () => vorple.prompt.submit('east');
		document.body.appendChild(e);
	".

To move south:
	execute JavaScript command "
		let s = document.createElement('div');
		s.id = 'south';
		s.onclick = () => vorple.prompt.submit('south');
		document.body.appendChild(s);
	".
	
To move west:
	execute JavaScript command "
		let w = document.createElement('div');
		w.id = 'west';
		w.onclick = () => vorple.prompt.submit('west');
		document.body.appendChild(w);
	".
	
To check inventory:
	execute JavaScript command "
		let bp = document.createElement('div');
		bp.id = 'backpack';
		bp.onclick = () => vorple.prompt.submit('inventory');
		document.body.appendChild(bp);
	".

Tooltip1 is a truth state that varies. Tooltip1 is true.

After looking:
	if the location is the Garage and Tooltip1 is true:
		display tooltip "Move forward by typing NORTH or by pressing the red button." on the prompt;
		directions;
		move north;
		now Tooltip1 is false;
	else if the location is the Garage and the player does not carry the coin:
		display tooltip "You can go right by typing EAST or by pressing the yellow button." on the prompt;
		move east;
	else if the location is the Garage and the player carries the coin:
		display tooltip "Tooltip missing." on the prompt.
			
After going to the Hallway for the first time:
	try looking;
	display tooltip "To get back type SOUTH or press the blue button." on the prompt;
	move south.
	
After going to the Storeroom for the first time:
	try looking;
	display tooltip "Try inspecting items by typing EXAMINE {item name}." on the prompt.
	
Instead of examining the chest when the chest is closed:
	say "The chest is ";
	place an element called "chest-text" reading "closed";
	display a tooltip "You can OPEN the chest to see what's inside." on the element called "chest-text" [in 1 seconds];
	say ".".
	
Rule for printing the name of the coin when the coin is in the chest:
	place an element called "coin-text" reading "coin";
	display a tooltip "The coin is something you can TAKE." on the element called "coin-text" [in 1 seconds].
	
After taking the coin for the first time:
	say "[line break]";
	display tooltip "Try typing INVENTORY or click the backpack icon." on the prompt;
	check inventory.
	
After taking inventory:
	if the player is in the Storeroom and the player carries the coin:
		display tooltip "Time to get back! Press the green button or type WEST." on the prompt [in 3 seconds];
		move west;
		now the knife is not scenery.
		
The knife is in the Garage.
It is scenery.
		
Chapter 11 - Difficulty 
		
Difficulty is a kind of value. The difficulties are normal, hard, unforgiving and unknown.
Understand "normal" as normal.
Understand "hard" as hard.
Understand "unforgiving" as unforgiving.

The player has a difficulty. The difficulty of the player is unknown.

Tezina is a truth state that varies. Tezina is false.
Biranje is a truth state that varies. Biranje is false.

Instead of taking the knife when the coin is carried and biranje is false:
	now the player carries the knife;
	say "You pick up the knife.[line break]Oh, one more thing before u leave.";
	now tezina is true;
	now the command prompt is "Please select difficulty >";
	display tooltip "Type UNKNOWN." on the prompt [in 3 seconds];
	
Instead of taking the knife when the coin is carried and biranje is true:
	now the player carries the knife;
	say "You pick up the knife.";
	
After reading a command when tezina is true:
	if the player's command includes "[difficulty]":
		now the difficulty of the player is the difficulty understood;
		if the difficulty of the player is unknown:
			say "Please select: 'normal' 'hard' or 'unforgiving'. [run paragraph on]"; [ovo popravi]
			reject the player's command;
		if the difficulty of the player is normal:
			now the lives of the player is 9;
			execute JavaScript command "
				const container = document.querySelector('#heart-container');
			  container.innerHTML = '';
			  for (let i = 0; i < 9; i++) {
				const heart = document.createElement('div');
				heart.className = 'heart';
				container.appendChild(heart);
			  }
			";
		if the difficulty of the player is hard:
			now the lives of the player is 3;
			execute JavaScript command "
			  const container = document.querySelector('#heart-container');
			  container.innerHTML = '';
			  for (let i = 0; i < 3; i++) {
				const heart = document.createElement('div');
				heart.className = 'heart';
				container.appendChild(heart);
			  }
			";
		if the difficulty of the player is unforgiving:
			now the lives of the player is 1;
			execute JavaScript command "
			  const container = document.querySelector('#heart-container');
			  container.innerHTML = '';
			  for (let i = 0; i < 1; i++) {
				const heart = document.createElement('div');
				heart.className = 'heart';
				container.appendChild(heart);
			  }
			";
		say "[line break]Your journey continues...";
		now the command prompt is ">";
		now tezina is false;
		now biranje is true;
		move the player to the Entrance hall;
		reject the player's command;
	otherwise:
		say "Please select a difficulty to continue. [run paragraph on]";
		reject the player's command.
		
Chapter 12 - Status line

When play begins:
	construct the Vorple status line with 3 columns.
	
The left hand Vorple status line is "You are: [player's full name]".
The middle Vorple status line is "Location: [the player's surroundings]".
The right hand Vorple status line is "Time: [time of day]". The time of day is 9:50 AM.

Chapter 13 - Map

To open map:
	execute JavaScript command "
		let map = document.createElement('div');
		map.id = 'map';
		map.onclick = () => vorple.prompt.submit('map');
		document.body.appendChild(map);
	". 

Map is an action applying to nothing. Understand "map" as map.

Carry out map:
	[say "Open map";]
	if Vorple is supported:
		place a link to web site "map.html" reading "Open map";
		
Mapping is a truth state that varies. Mapping is false.
		
After going to the Kitchen: [popravi]
	if mapping is false:
		now mapping is true;
		open map;
		continue the action.
		
Chapter 14 - Entrance hall

The desk is in the Entrance hall.
The description is "Veliki stol s 4 obojane ladice od kojih je jedna izbljedila".

After examining the desk:
	if Vorple is supported:
		place an image "desk.png" with the description "?", centered. [popravi]
		
The red drawer, the blue drawer, the green drawer and the pink drawer are parts of the desk.
The red drawer, the blue drawer, the green drawer and the pink drawer are openable closed containers. [drugacije nazovi rozu ladicu]

The secret drawer is a part of the desk. The secret drawer is an openable closed container.
The secret drawer is scenery. [nevidljiva trenutno]

Instead of doing anything other than examining to the secret drawer when the secret drawer is scenery:
	say "Can't do that."
	
The desk has a truth state called sequence. The sequence of the desk is false.
The desk has a number called position. The position of the desk is 0.

Check opening the red drawer:
	say "Prazna ladica";
	if the sequence of the desk is false:
		now the sequence of the desk is true;
		now the position of the desk is 1;
	else if the position is not 0 :
		now the sequence of the desk is false;
		now the position of the desk is 0;
		
Check opening the blue drawer:
	say "Prazna ladica";
	if the position of the desk is 1:
		now the position of the desk is 2;
	else:
		now the sequence of the desk is false;
		now the position of the desk is 0;
		
Check opening the pink drawer:
	say "Prazna ladica";
	if the position of the desk is 2:
		now the position of the desk is 3;
	else:
		now the sequence of the desk is false;
		now the position of the desk is 0;
		
Check opening the green drawer:
	[say "Prazna ladica";]
	if the position of the desk is 3:
		now the position of the desk is 4;
		now the secret drawer is not scenery;
		say "As you open the lower drawer, you hear a click and a secret fourth drawer appears in the desk!";
	else:
		now the sequence of the desk is false;
		now the position of the desk is 0;
		
After examining the note:
	if Vorple is supported:
		place an image "note1.png" with the description "?", centered. [popravi]
		
Flip is an action applying to one visible thing.
Understand "flip [something]" as flip.
Understand "turn over [something]" as flip.
Understand "rotate [something]" as flip. [popravi]
Understand "turn [something] over" as flip.

Check flip:
	if the noun is the note:
		place an image "note1a.png" with the description "?", centered. [popravi]
		
Chapter 15

Rotirajuce ostrice is a door.
It is west of the Study and east of the Bathroom. 
It is open.
It is not openable.
It is scenery.

Check going through Rotirajuce ostrice:
	say "Ne mogu ovo proći bez zaštite.";
	if Oklop is worn:
		say "Uspio sam! Nema natrag, jer se oklop oštećen.";
		remove Oklop from play;
	otherwise if Oklop is carried:
		say "Oklop je korisniji ako ga [italic type]nosiš."; 
		kill the player;
		stop the action;
	otherwise:
		kill the player;
		stop the action.
		
Konopac is in the Dining room.
Konopac is wearable.
The description is "Ovo će mi dobro doći."
		
Frizider is a container.
The description is "Najbolje meso se nalazi ovdje."
It is in the Kitchen.
It is closed.
It is openable.
Kost is in frizider.
Kost is edible.
The description is "Ne voliš kosti, ali kad si gladan sve je dobro."

Ormaric is a container.
It is in the Pantry.
It is closed.
It is openable.
Bocica is in Ormaric.
The description is "Izgleda kao sprej protiv nametnika."

Zlatna skrinja is a container.
It is in the Living room.
It is closed.
It is openable.
It is locked.
Zlatni kljuc unlocks Zlatna skrinja.
Zlatnici is in Zlatna skrinja.
The description is "Zlatnici različitih oblika. Nekima bi se činili čudnima, ali ne i tebi."

Crna skrinja is a container.
It is in the Attic.
It is closed.
It is openable.
It is locked.
Crni kljuc unlocks Crna skrinja.

Check opening Crna skrinja:
	if Crna skrinja is locked:
		say "Treba mi ključ za ovo.";
	otherwise:	
		say "Ovo bolje ne otvarati.";
		kill the player;
		stop the action.
		
Stvorenje is in the Basement.
Stvorenje is an animal.
The description is "Iz mraka te promatraju dva žarka oka. Režanje postaje sve jače i jače. Izgleda da je netko jako gladan.
U kutu ispod svijetiljke vidiš zlatni ključ."

Nahrani is an action applying to one visible thing.
Understand "daj [someone] kost" as nahrani.

Check Nahrani:
	if the noun is Stvorenje:
		say "Režanje je prestalo i zamjenilo ga je mljackanje. [the noun] se smirilo. Zgrabio si ključ i stavio ga u inventory.";
		now Kost is nowhere;
		move Zlatni kljuc to the player;
	otherwise:
		say "Mislim da bi netko drugi više uživao u ovome.";
		
Pojedi is an action applying to one visible thing.
Understand "pojedi [something]" as pojedi.

Check Pojedi:
	if something is Kobasica:
		say "To mi je kad kupujem kobasice po vrućini od pajdaša.";
		end the story saying "[bold type]YOU DIED";
	otherwise:
		now Kobasica is nowhere;
		
Zlatnici can be skupljen or neskupljen.
Zlatnici is neskupljen.
B is a number variable.
B is 0.
C is a number variable.
C is 0.
P is a number variable.
P is 0.
Instead of taking Zlatnici:
	if Zlatnici is skupljen:
		continue the action;
	otherwise:
		now P is 1500;
		now B is B plus P;
		now Zlatnici is skupljen;
		now the description of Zlatnici is "[B] Zlatnika.".
		
The Attic has a time called the opening hour.
The opening hour of the Attic is 10:30 AM.
The Attic has a time called the closing hour.
The closing hour of the Attic is 10:45 AM.

Check going to the Attic:
	if the time of day is before the opening hour of the Attic,
	say "Tavan je zaključan do [the opening hour of the the Attic] zbog vrućine." instead.
	
Check going to the Attic:
	if the time of day is after the closing hour of the Attic,
	say "Tavan je zaključan od [the closing hour of the Attic] zbog vrućine." instead.

Every turn when the location is the Attic:
	let deadline be the closing hour of the location;
	if the deadline is before the time of day:
		say "Zbog velike vrućine si morao izaći van.";
		move the player to the Dining room.
		
Instead of going to the Garden:
	if we have not taken Bocica:
		say "Kada ideš van potrebna ti je zaštita. Posebno protiv Krpelja.";
	otherwise:
		Move the player to the Garden.
		
Understand "Eugen" or "say Eugen" as casting Eugen.
Casting Eugen is an action applying to nothing.
Check casting Eugen:
	if the player is not in the Bathroom:
		say "Da tako se zovem, ali mi to sada ne pomaže." instead.
Carry out casting Eugen:
	say "Nestao si u oblaku magle.";
now the player is in the Bedroom.

Understand "Mijau" or "Mijau" as casting Mijau.
Casting Mijau is an action applying to nothing.
Check casting Mijau:
	if the player is in the Bedroom:
		end the story saying "Konačno sam te našao.[bold type] Mijau [roman type]Tako sam gladan.[bold type] Mijau";
	otherwise:
		say "Nitko me ne cuje. "
		
Boris is an animal in the Attic.

Table of Boris Responses
Topic	Response			Index
"Posao"	"Posao ne ide baš najbolje, vruće je, spava mi se i jedva gledam."		"Posao"
"Zenski glas"	"Čuo sam kako te zove i traži. Ja sam malo prije kod nje jeo."			"Zenski glas"
	
After asking Boris about something:
	if the topic understood is a topic listed in the Table of Boris Responses:
		say "[Response entry]";
		
Chapter 16 - Buying

Blagajna is in the Attic. "Stavi što si odabrao na blagajnu pajdo da ti mogu uzeti zlatnike hehe."
Blagajna can be Crnk, Ok, Ck, Ko, Og or prazna.
Blagajna is prazna.
Blagajna is scenery.

[crni kljuc]
Crni kljuc is in the Attic.
Crni kljuc can be kupljeno or nekupljeno.
Crni kljuc is nekupljeno.
The description is "80 zlatnika."
Instead of taking Crni kljuc:
	if Crni kljuc is nekupljeno:
		say "Moraš to platiti pajdo!";
	otherwise:
		continue the action.

Instead of putting Crni kljuc on Blagajna:
	now Blagajna is Crnk;
	say "To će biti 80 zlatnika. Stavi zlatnike na blagajnu.".
	
[oklop]
Oklop is in the Attic.
Oklop is wearable.
Oklop can be kupljeno or nekupljeno.
Oklop is nekupljeno.
The description is "510 zlatnika."
Instead of taking Oklop:
	if Oklop is nekupljeno:
		say "Moraš to platiti pajdo!";
	otherwise:
		continue the action.

Instead of putting Oklop on Blagajna:
	now Blagajna is Ok;
	say "To će biti 510 zlatnika. Stavi zlatnike na blagajnu.".

[crveni kljuc]	
Crveni kljuc is in the Attic.
Crveni kljuc can be kupljeno or nekupljeno.
Crveni kljuc is nekupljeno.
The description is "490 zlatnika."
Instead of taking Crveni kljuc:
	if Crveni kljuc is nekupljeno:
		say "Moraš to platiti pajdo!";
	otherwise:
		continue the action.

Instead of putting Crveni kljuc on Blagajna:
	now Blagajna is Ck;
	say "To će biti 490 zlatnika. Stavi zlatnike na blagajnu.".

[kobasica]
Kobasica is in the Attic.
Kobasica can be kupljeno or nekupljeno.
Kobasica is nekupljeno.
The description is "200 zlatnika. Ova kobasica izgleda socno, a ja sam gladan."
Instead of taking Kobasica:
	if Kobasica is nekupljeno:
		say "Moraš to platiti pajdo!";
	otherwise:
		continue the action.

Instead of putting Kobasica on Blagajna:
	now Blagajna is Ko;
	say "To će biti 200 zlatnika. Stavi zlatnike na blagajnu.".
	
[ogrlica]
Ogrlica is in the Attic.
Ogrlica can be kupljeno or nekupljeno.
Ogrlica is nekupljeno.
The description is "350 zlatnika."
Instead of taking Ogrlica:
	if Ogrlica is nekupljeno:
		say "Moraš to platiti pajdo!";
	otherwise:
		continue the action.

Instead of putting Ogrlica on Blagajna:
	now Blagajna is Og;
	say "To će biti 350 zlatnika. Stavi zlatnike na blagajnu.".
	
Instead of putting Zlatnici on Blagajna:
	if Blagajna is prazna:
		say "Nisi ništa odabrao pajdo.";
	if Blagajna is Crnk:
		Now C is 80;
		if B is less than C:
			say "Nemaš dovoljno zlatnika pajdo!";
			now Blagajna is prazna;
		otherwise:
			now B is B minus C;
			now the description of Zlatnici is "[B] ";
			now Crni kljuc is kupljeno;
			now Blagajna is prazna;
			say "Je li to sve? Nemoj zaboraviti svoj Crni ključ. Imaš još [B] Zlatnika.";
	if Blagajna is Ok:
		Now C is 510;
		if B is less than C:
			say "Nemaš dovoljno zlatnika pajdo!";
			now Blagajna is prazna;
		otherwise:
			now B is B minus C;
			now the description of Zlatnici is "[B] Zlatnika";
			now Oklop is kupljeno;
			now Blagajna is prazna;
			say "Je li to sve? Nemoj zaboraviti svoj Oklop. Imaš još [B] Zlatnika.";
	if Blagajna is Ck:
		Now C is 490;
		if B is less than C:
			say "Nemaš dovoljno zlatnika pajdo!";
			now Blagajna is prazna;
		otherwise:
			now B is B minus C;
			now the description of Zlatnici is "[B] Zlatnika";
			now Crveni kljuc is kupljeno;
			now Blagajna is prazna;
			say "Je li to sve? Nemoj zaboraviti svoj Crveni ključ. Imaš još [B] Zlatnika.";	
	if Blagajna is Ko:
		Now C is 200;
		if B is less than C:
			say "Nemaš dovoljno zlatnika pajdo!";
			now Blagajna is prazna;
		otherwise:
			now B is B minus C;
			now the description of Zlatnici is "[B] Zlatnika";
			now Kobasica is kupljeno;
			now Blagajna is prazna;
			say "Je li to sve? Nemoj zaboraviti svoju Kobasicu. Imaš još [B] Zlatnika.";		
	if Blagajna is Og:
		Now C is 350;
		if B is less than C:
			say "Nemaš dovoljno zlatnika pajdo!";
			now Blagajna is prazna;
		otherwise:
			now B is B minus C;
			now the description of Zlatnici is "[B] Zlatnika";
			now Crni kljuc is kupljeno;
			now Blagajna is prazna;
			say "Je li to sve? Nemoj zaboraviti svoju Ogrlicu. Imaš još [B] Zlatnika.";