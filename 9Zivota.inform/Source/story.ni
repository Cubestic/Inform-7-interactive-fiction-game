"9Zivota" by Andrej

Part - Game setup

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

Part - Rooms

The Garage is a room. "A place where you spend your nights resting. Below the window, lies a bed without a pillow. You feel stiff and tired, as if you hadn’t slept at all last night. Ahead of you stretches a dark hallway."

The Hallway is a room. It is north of the Garage. "A cold, long hallway that leads to nowhere."

The Storeroom is a room. It is east of the Garage. "A small room where you usually find sweets."

The Entrance hall is a room. "In the distance, a woman’s voice calls out. You hear your name and decide to follow the sound."

The Bathroom is a room. It is west of the Entrance hall.

The Utility room is a room. It is west of Bathroom.

The Living room is a room. ["A large room full of light. The path to the west is open. A large red door leads to the east. You are rarely allowed to go through those doors alone.[if we have not taken the red key] They're always locked.[otherwise] open The doors can be opened now."]

The Library is a room. "?"

The Basement is a room. It is south of the Library. "It's damp and darker than the garage. The woman's voice can't be heard in here."

The Gallery is a room. It is north of the Bathroom.

The Balcony is a room.

The Kitchen is a room. It is north of the Living room. ["Here you always get something to eat, but you're not always welcome. The way to the north and west is open.[if we have not taken the rope] A dangerous pit with spikes blocks the way to the east.[otherwise] I think I can swing across the pit now."]

The Dining room is a room. It is west of the Kitchen and north of the Gallery. "An old room with yellow wallpaper that leads to the attic."

The Pantry is a room. It is east of the Kitchen. "I'm out of armor—there's no going back. It seems I'm stuck here."

The Closet is a room.

The Attic is a room. It is north of the Closet. "Unbearable heat. I can't stay here for more than 10 minutes. You see a familiar face in a black-and-white coat selling something."

The Study is a room. "A nicely decorated room with your picture on the table and your name on the back [italic type][player's full name][roman type].[if the armor is not carried] Dangerous rotating blades block the way to the west. [otherwise]I think the armor protects me from the blades."

The Garden is a room. It is north of the Study. "After the garage, your favorite place to relax."

The Bedroom is a room. "You appear in the bedroom and see your owner looking for you under the bed.[line break]Woman’s voice: Here, kitty kitty, I have something nice for you."

Part - Doors
 
The brown door is a door.
It is north of the Entrance hall and south of the Living room.
It is closed, openable, locked and scenery.

The spike pit is a door.
It is east of the Living room and west of the Library.
It is open, not openable and scenery.

The rotating blades is a door.
It is north of the Pantry and south of the Study.
It is open, not openable and scenery.

The red door is a door.
It is north of the Dining room and south of the Closet.
It is closed, openable, locked and scenery.

Part - Items

The red key unlocks the red door.

The rope is in the Dining room.
It is wearable.
The description is "This will come in handy."

The fridge is a container.
The description is "The best meat is found here."
It is in the Kitchen.
It is closed and openable.

The bone is in the fridge.
It is edible.
The description is "You don’t like bones, but when you’re hungry, anything will do."

The cabinet is a container.
It is in the Pantry.
It is closed and openable.

The small bottle is in the cabinet.
The description is "It looks like a spray against pests."

The golden skrinja is a container.
It is in Living room.
It is closed, openable and locked.

The golden key unlocks golden skrinja.
The coins are in the golden skrinja.
The description is "Gold coins of various shapes. Some might find them strange, but not you."

The black chest is a container.
It is closed, openable and locked.
The black key unlocks the black chest.

Part - Dying

The player has a number called lives. The lives of the player is 9.

To kill the player:
	decrease the lives of the player by 1;
	execute JavaScript command "document.querySelector('#heart-container .heart')?.remove();";
	if the lives of the player is 0:
		say "[line break]You are out of lives!";
		execute JavaScript command "setTimeout(() => location.reload(), 5000);";
		end the story saying "[bold type]GAME OVER";
	otherwise:
		say "[line break]";
		place an inline element called "death";
		display text "YOU DIED" in the element called "death";
		say "[line break]";
		now the player is in the Kitchen. [ne moze uvijek biti u kuhinji]
		
Check going through a spike pit:
	say "I can't get over this, but I might be able to swing across using something.";
	if a rope is worn:
		say "I made it! This rope will come in handy on the way back too.";
		continue the action;
	otherwise if a rope is carried:
		say "A rope is more useful if you [italic type]wear [roman type]it, not just have it in your inventory.";
		kill the player;
		stop the action;
	otherwise:
		kill the player;
		stop the action.
		
Check going through a rotating blades:
	say "I can't get through this without protection.";
	if armor is worn:
		say "I made it! There's no going back, because the armor is damaged.";
		remove armor from play;
		continue the action;
	otherwise if armor is carried:
		say "Armor is more useful if you [italic type]wear, [roman type]it."; 
		kill the player;
		stop the action;
	otherwise:
		kill the player;
		stop the action.
		
Check opening the black chest:
	if the black chest is locked:
		say "I need a key to open this.";
	otherwise:	
		say "This is better left unopened.";
		kill the player;
		stop the action.
		
Check going to the basement:
	say "You hear loud growling coming from the basement.";
	if the bone is carried:
		say "That bone from the fridge might come in handy.";
	otherwise:
		say "It's not wise to enter a room where you might end up as someone's snack.";
		kill the player;
		stop the action.
		
Instead of eating:
	if the noun is the sausage:
		say "That’s what I get for buying cheap sausages.";
		kill the player;
		stop the action;
	otherwise:
		now the sausage is nowhere.

Part - Inventory
		
The carrying capacity of the player is 2.

Carry out taking inventory (this is the print inventory using HTML lists rule):
	if Vorple is supported:
		say "[We] [are] carrying:[line break]";
		open HTML tag "ul";
		repeat with item running through things carried by the player:
			place "li" element reading "[item]";
			if the item contains something:
				open HTML tag "ul";
				repeat with content running through things contained by the item:
					place "li" element reading "[content]";
				close HTML tag;
		close HTML tag;
	otherwise:
		follow the print standard inventory rule.
		
The print inventory using HTML lists rule is listed instead of the print standard inventory rule in the carry out taking inventory rules.

The backpack is in the Entrance Hall. The backpack is a player's holdall. The backpack has carrying capacity 3.

To update capacity counter:
	let items be the number of things carried by the player;
	let items_in_backpack be 0;
	if the player carries the backpack:
		repeat with item running through things in the backpack:
			increase items_in_backpack by 1;
	let total_items be items + items_in_backpack;
	let displayed_capacity be the carrying capacity of the player;
	if the player carries the backpack:
		let backpack_capacity be the carrying capacity of the backpack;
		increase displayed_capacity by backpack_capacity;
	let indicator_text be "[total_items]/[displayed_capacity]";
	execute JavaScript command "
		const capacityDiv = document.getElementById('capacity-indicator');
		capacityDiv.textContent = '[indicator_text]';
		if([total_items] >= [displayed_capacity]) {
			capacityDiv.classList.add('capacity-full');
			capacityDiv.classList.remove('capacity-available');
		} else {
			capacityDiv.classList.add('capacity-available');
			capacityDiv.classList.remove('capacity-full');
		}
	".
	
To display capacity counter:
	execute JavaScript command "
		const capacityDiv = document.createElement('div');
		capacityDiv.id = 'capacity-indicator'; capacityDiv.textContent = '0/2';
		capacityDiv.classList.add('capacity-indicator');
		document.body.appendChild(capacityDiv);
	";
	update capacity counter.
	
After taking something:
	update capacity counter;
	continue the action.

After dropping something:
	update capacity counter;
	continue the action.

[After inserting something into something:
	update capacity indicator;
	continue the action.

After removing something from something:
	update capacity indicator;
	continue the action.]

Instead of taking the backpack:
	say "You pick up the backpack.";
	now the player carries the backpack;
	increase the carrying capacity of the player by 1;
	update capacity counter.

After dropping the backpack:
	decrease the carrying capacity of the player by 1;
	say "You drop the backpack, reducing how much you can carry.";
	update capacity counter;
	let backpack_items be the number of things in the backpack;
	if backpack_items is greater than 0:
		say "The contents of your backpack spill out onto the ground:";
		repeat with item running through things in the backpack:
			say "[item]";
			now item is in the location.
			
Part - Status line

When play begins:
	construct the Vorple status line with 3 columns.
	
The left hand Vorple status line is "You are: [player's full name]".
The middle Vorple status line is "Location: [the player's surroundings]".
The right hand Vorple status line is "Time: [time of day]". The time of day is 9:50 AM.

Part - Map

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
		
[After going to the Kitchen: [popravi]
	if mapping is false:
		now mapping is true;
		open map;
		continue the action.]
			
Part - Title screen

When play begins:
	if Vorple is supported:
		place an image "titlescreen.png" with the description "Titlescreen", centered;
	center "[fantasy font style][play the game][end style]";
	wait for the SPACE key;
	clear the screen.
	
To say play the game:
	if Vorple is supported:
		place a link to execute the JavaScript command "vorple.prompt.queueKeypress(' ')" reading "PLAY".
		
Rule for printing the banner text: do nothing.
			
Part - Tutorial

Chapter - Player's name

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

Chapter - Garage

The brush is in the Garage.
It is scenery.

The default tooltip duration is 10.

Tooltip1 is a truth state that varies. Tooltip1 is true.

After looking:
	if the location is the Garage and Tooltip1 is true:
		display tooltip "Move forward by typing NORTH or by pressing the red button." on the prompt;
		directions;
		move north;
		now Tooltip1 is false;
	else if the location is the Garage and the player does not carry the coin:
		display tooltip "You can go right by typing EAST or by pressing the yellow button." on the prompt;
		move east.
		
Rule for printing the name of the brush:
	if the location is the Garage:
		place an element called "brush-text" reading "brush";
		display a tooltip "This wasn't here before. I'd better take it." on the element called "brush-text" [in 1 seconds];
	otherwise:
		say "brush";
		
Chapter - Hallway
			
After going to the Hallway for the first time:
	try looking;
	display tooltip "To get back type SOUTH or press the blue button." on the prompt;
	move south.
	
Chapter - Storeroom

The  test chest is a container.
It is in the Storeroom.
It is closed, openable and fixed in place.

The coin is in the chest.
	
After going to the Storeroom for the first time:
	try looking;
	display tooltip "Try inspecting items by typing EXAMINE {item name}." on the prompt.
	
Instead of examining the chest when the chest is closed:
	say "An old, heavy chest that you've never seen open. The chest is ";
	place an element called "chest-text" reading "closed";
	display a tooltip "You can OPEN the chest to see what's inside." on the element called "chest-text" [in 1 seconds];
	say ".".
	
Rule for printing the name of the coin when the coin is in the chest:
	place an element called "coin-text" reading "coin";
	display a tooltip "The coin is something you can TAKE." on the element called "coin-text" [in 1 seconds].
	
After taking the coin for the first time:
	say "[line break]";
	display tooltip "Try typing INVENTORY or click the backpack icon." on the prompt;
	check inventory;
	display capacity counter.
	
After taking inventory:
	if the player is in the Storeroom and the player carries the coin:
		display tooltip "Time to get back! Press the green button or type WEST." on the prompt [in 3 seconds];
		move west;
		now the brush is not scenery.

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
	
Chapter - Difficulty 
		
Difficulty is a kind of value. The difficulties are normal, hard, unforgiving and unknown.
Understand "normal" as normal.
Understand "hard" as hard.
Understand "unforgiving" as unforgiving.

The player has a difficulty. The difficulty of the player is unknown.

Tezina is a truth state that varies. Tezina is false.
Biranje is a truth state that varies. Biranje is false.

Instead of taking the brush when the coin is carried and biranje is false:
	move the brush to the player;
	update capacity counter;
	say "You pick up the brush.[paragraph break]Oh, one more thing before you leave.";
	now tezina is true;
	now the command prompt is "Please select difficulty >";
	display tooltip "Type UNKNOWN." on the prompt [in 3 seconds];
	
Instead of taking the brush when the coin is carried and biranje is true:
	now the player carries the brush;
	say "You pick up the brush.";
	
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
		
Part - Entrance hall

The note is on the desk in the Entrance hall. The description is "[player's full name] is not allowed to go in. The door is locked, and the key's in the drawer. I wrote down how to open it, in case you forgot.[line break] D."

The desk is in the Entrance hall.
The description is "A small table with four painted drawers, one of which is faded.".

After examining the desk:
	if Vorple is supported:
		place an image "desk.png" with the description "Desk", centered. [popravi]
		
The pink drawer, the green drawer, the red drawer and the blue drawer are parts of the desk.
The pink drawer, the green drawer, the red drawer and the blue drawer are openable closed containers.
The printed name of the pink drawer is "faded drawer".

The secret drawer is a part of the desk. The secret drawer is an openable closed container.
The secret drawer is scenery.

Instead of doing anything other than examining to the secret drawer when the secret drawer is scenery:
	say "Can't do that."
	
The brown key is in the secret drawer.
The brown key unlocks the brown door.
	
The desk has a truth state called sequence. The sequence of the desk is false.
The desk has a number called position. The position of the desk is 0.

Check opening the red drawer:
	say "[line break]An empty drawer";
	if the sequence of the desk is false:
		now the sequence of the desk is true;
		now the position of the desk is 1;
	else if the position is not 0 :
		now the sequence of the desk is false;
		now the position of the desk is 0;
		
Check opening the blue drawer:
	say "[line break]An empty drawer";
	if the position of the desk is 1:
		now the position of the desk is 2;
	else:
		now the sequence of the desk is false;
		now the position of the desk is 0;
		
Check opening the pink drawer:
	say "[line break]An empty drawer";
	if the position of the desk is 2:
		now the position of the desk is 3;
	else:
		now the sequence of the desk is false;
		now the position of the desk is 0;
		
Check opening the green drawer:
	say "[line break]An empty drawer";
	if the position of the desk is 3:
		now the position of the desk is 4;
		now the secret drawer is not scenery;
		say "[line break]As you open the green drawer, you hear a click and a secret fifth drawer appears in the desk!";
	else:
		now the sequence of the desk is false;
		now the position of the desk is 0;
		
After examining the note:
	if Vorple is supported:
		place an image "note1.png" with the description "Note1", centered.
		
Flip is an action applying to one visible thing.
Understand "flip [something]" as flip.
Understand "turn [something] over" as flip.
Understand "turn over [something]" as flip.

Check flip:
	if the noun is the note:
		place an image "note1a.png" with the description "Note1a", centered. [popravi]
		
Part - Basement

The beast is in the Basement.
The beast is an animal.
The description is "Two glowing eyes watch you from the darkness. The growling grows steadily louder. It seems someone is very hungry. In the corner beneath the lamp, you see a golden key."

Instead of giving the bone to the beast:
	say "The growling stopped and was replaced by chewing. The beast calmed down. You grabbed the key and put it in your backpack.";
	now the bone is nowhere;
	move the golden key to the player.
		
Part - Attic

The Attic has a time called the opening hour.
The opening hour of the Attic is 10:30 AM.
The Attic has a time called the closing hour.
The closing hour of the Attic is 10:45 AM.

Check going to the Attic:
	if the time of day is before the opening hour of the Attic,
	say "The attic is locked until [the opening hour of the Attic] because of the heat." instead.
	
Check going to the Attic:
	if the time of day is after the closing hour of the Attic:
		say "The attic is locked until [the closing hour of the Attic] because of the heat." instead.
	

Every turn when the location is the Attic:
	let deadline be the closing hour of the location;
	if the deadline is before the time of day:
		say "Because of the intense heat, you had to leave the attic.";
		move the player to Dining room.
		
[Attic items]

The Shop is a thing in the Attic.

The black key is in the Shop.

The armor is in the Shop.
It is wearable.

The red key is in the Shop.

The sausage is in the Shop.

The necklace is in the Shop.

Rule for printing the name of Shop while listing contents of a room:
	say "Shop";
	omit contents in listing.

Table of Shop Items
Item	Cost
Black key	$80
Armor	$510
Red key	$490
Sausage	$200
Necklace	$350

Instead of examining the Shop:
	if Vorple is supported:
		say "[We] [can] see the following items for sale:[line break]";
		open HTML tag "table" called "table1";
		open HTML tag "tr";
		place "th" element reading "Item";
		place "th" element reading "Price";
		close HTML tag;
		repeat through the Table of Shop Items:
			open HTML tag "tr";
			place "td" element called "td1" reading "[Item entry]";
			place "td" element called "td1" reading "[Cost entry]";
			close HTML tag;
		close HTML tag;
	otherwise:
		say "You see various items for sale."
		
Price is a kind of value. $1000 specifies a price.

The player has a price. The price of the player is $0.

After taking the coins:
	now the price of the player is $1500.
	
After entering the Attic:
	now the left hand Vorple status line is "Coins [price of the player]".
	
[After leaving the Attic:
	now the left hand Vorple status line is "You are: [player's full name]".]
	
Instead of taking something which is in the Shop:
	say "You'll need to buy that first."

Purchase is an action applying to one thing.
Understand "buy [thing]" as purchase.

Check purchase:
	let price wanted be $0;
	repeat through Table of Shop Items:
		if Item entry is the noun:
			now price wanted is Cost entry;
	if the price of the player is less than price wanted:
		say "You don't have enough money. [The noun] costs [price wanted], but you only have [price of player]." instead.

Carry out purchase:
	let price wanted be $0;
	repeat through Table of Shop Items:
		if Item entry is the noun:
			now price wanted is Cost entry;
	decrease the price of the player by price wanted;
	now the player carries the noun;
	say "You pay [price wanted] and acquire [the noun].".
	
Report purchase:
	say "You now have [price of player] remaining in your wallet.".

Part - Fix

Instead of going to the Garden:
	if we have not taken the small bottle:
		say "When you go outside, you need protection. Especially against ticks.";
	otherwise:
		move the player to the Garden.

After reading a command:
	if the player's command matches the text "[player's full name]" or the player's command matches the text "say [player's full name]":
		replace the matched text with "cast name";
		continue the action.

Understand "cast name" as casting player name.
Casting player name is an action applying to nothing.

Check casting player name:
	if the player is not in the Bathroom:
		say "Yes, that’s my name, but that doesn’t help me right now." instead.

Carry out casting player name:
	say "You disappeared into a cloud of fog.";
	now the player is in the Bedroom.
		
Part - Dialog

Boris is an animal in the Dining room. The description of Boris is "Boris".

Table of Boris Responses
Topic	Response			Index
"Female voice"	"I heard her calling and looking for you. I was eating with her a little while ago."			"Female voice"
	
After asking Boris about something:
	if the topic understood is a topic listed in the Table of Boris Responses:
		say "[Response entry]";
		
After examining Boris: [mozes staviti insted pa nema You see nothing special about Boris.]
	say "Topics you can talk about with Boris:[line break]";
	repeat with N running from 1 to the number of rows in the Table of Boris Responses:
		choose row N in the Table of Boris Responses;
		say "  - ";
		place a link to command "ask Boris about [Index entry]" reading "[Index entry]";
		say "[line break]".
		
Rule for printing the name of Boris:
	place a link to command "examine [the printed name of the item described]" reading "[the printed name of the item described]";
	
Part - Ending

Understand "meow" as casting meow.

Casting meow is an action applying to nothing.

Check casting meow:
	if the player is in the Bedroom:
		end the story saying "Ah, there you are. Come on, we need to get ready — our vet appointment’s at 5.";
	otherwise:
		say "No one hears you."