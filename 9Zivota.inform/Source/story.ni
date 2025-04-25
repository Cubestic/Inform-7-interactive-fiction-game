"9Zivota" by Andrej

Chapter 1 - Game setup

Include Vorple Notifications by Juhana Leinonen.

Include Vorple Multimedia by Juhana Leinonen.

Include Vorple Screen Effects by Juhana Leinonen.

Include Vorple Hyperlinks by Juhana Leinonen.

Include Vorple Tooltips by Juhana Leinonen.

Release along with the "Vorple" interpreter.

Release along with the file "heart.png".

Release along with the file "backpack.png".

Release along with the file "titlescreen.png".

Release along with style sheet "my.css".

Chapter 2 - Rooms

The Garage is a room. "A place where you spend your nights resting. Below the window, lies a bed without a pillow. Ahead of you stretches a dark hallway." [The only exit is a brown door to the north."]

The Hallway is a room. It is north of the Garage. "A cold, long hallway that leads to nowhere."

The Storeroom is a room. It is east of the Garage. "Description missing."

The Entrance hall is a room.

[The Kitchen is a room. "Here I always get something to eat, but I'm not always welcome. The way to the north and west is open.[if we have not taken the rope]  A dangerous pit with spikes blocks the way to the east.[otherwise]I think I can swing across the pit now."

The Living room is a room. It is north of the Kitchen. "A large room full of light. The path to the northwest is open. A pair of large red doors leads to the northeast. I'm rarely allowed to go through those doors alone.[if we have not taken the red key]They're always locked.[otherwise]The doors can be opened now."

The Hallway is a room. "A cold and long hallway that leads to the basement."

The Basement is a room. It is below the Hallway. "It's damp and darker than the garage. The woman's voice can't be heard in here."

The Dining room is a room. It is west of the Kitchen. "An old room with yellow wallpaper that leads to the attic."

The Attic is a room. It is above the Dining room. "Unbearable heat. I can't stay here for more than 10 minutes. You see a friend in a black-and-white coat selling something."

The Pantry is a room. "A small room where you usually find sweets."

The Office is a room. It is northwest of the Office. "A nicely decorated room with your picture on the table and your name on the back – Eugen."[[if the armor is not carried]Dangerous rotating blades block the way to the west. [otherwise]I think the armor protects me from the blades."]

The Bathroom is a room. "I'm out of armor—there's no going back. It seems I'm stuck here."

The Garden is a room. It is north of the Office. "After the garage, your favorite place to relax."

The Bedrrom is a room. "I appear in the bedroom and see my owner looking for me under the bed.[line break]Woman’s voice: Here, kitty kitty, I have something nice for you."]

Chapter 3 - Doors
 
The spike pit is a door.
It is east of the Kitchen and west of the Hallway. 
It is open.
It is not openable.
It is scenery.

[The brown door is a door.
It is north of the Garage and south of the Kitchen.
It is closed.
It is openable.
It is scenery.]

The red door is a door.
It is northeast of the Living room and southwest of the Pantry.
It is closed.
It is openable.
It is locked.
It is scenery.
The red key unlocks the red door.

The rotating blades is a door.
It is west of the Office and east of the Bathroom.
It is open.
It is not openable.
It is scenery.

Chapter 4 - Items

The rope is in the Kitchen.
It is wearable.
The description is "This will come in handy."

The bone is in the Kitchen.
It is edible.

The chest is a container.
The description is "?".
It is in the Storeroom.
It is closed.
It is openable.
The coin is in the chest.

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
		now the player is in the Kitchen.
		
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
		stop the action;
		
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
	
After taking the coin:
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

Instead of taking the knife when the coin is carried:
	now the player carries the knife;
	say "You pick up the coin.[line break]Oh, one more thing before u leave.";
	now tezina is true;
	now the command prompt is "Please select difficulty >".
	
After reading a command when tezina is true:
	if the player's command includes "[difficulty]":
		now the difficulty of the player is the difficulty understood;
		if the difficulty of the player is unknown:
			say "Please select: 'normal' 'hard' or 'extreme'. [run paragraph on]"; [ovo popravi]
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
		move the player to the Entrance hall;
		reject the player's command;
	otherwise:
		say "Please select a difficulty to continue. [run paragraph on]";
		reject the player's command.