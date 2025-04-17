"9Zivota" by Andrej

Chapter 1 - Game setup

Include Vorple Notifications by Juhana Leinonen.

Include Vorple Multimedia by Juhana Leinonen.

Include Vorple Screen Effects by Juhana Leinonen.

Include Vorple Hyperlinks by Juhana Leinonen.

Release along with the "Vorple" interpreter.

Release along with the file "heart.png".

Release along with the file "backpack.png".

Release along with the file "titlescreen.png".

Release along with style sheet "my.css".

Chapter 2 - Rooms

The Garage is a room. "A place where you spend your nights resting. Below the window, there is a bed without a pillow. The only exit is a brown door to the north." 

The Kitchen is a room. "Here I always get something to eat, but I'm not always welcome. The way to the north and west is open.[if we have not taken the rope]  A dangerous pit with spikes blocks the way to the east.[otherwise]I think I can swing across the pit now."

The Living room is a room. It is north of the Kitchen. "A large room full of light. The path to the northwest is open. A pair of large red doors leads to the northeast. I'm rarely allowed to go through those doors alone.[if we have not taken the red key]They're always locked.[otherwise]The doors can be opened now."

The Hallway is a room. "A cold and long hallway that leads to the basement."

The Basement is a room. It is below the Hallway. "It's damp and darker than the garage. The woman's voice can't be heard in here."

The Dining room is a room. It is west of the Kitchen. "An old room with yellow wallpaper that leads to the attic."

The Attic is a room. It is above the Dining room. "Unbearable heat. I can't stay here for more than 10 minutes. You see a friend in a black-and-white coat selling something."

The Pantry is a room. "A small room where you usually find sweets."

The Office is a room. It is northwest of the Office. "A nicely decorated room with your picture on the table and your name on the back – Eugen."[[if the armor is not carried]Dangerous rotating blades block the way to the west. [otherwise]I think the armor protects me from the blades."]

The Bathroom is a room. "I'm out of armor—there's no going back. It seems I'm stuck here."

The Garden is a room. It is north of the Office. "After the garage, your favorite place to relax."

The Bedrrom is a room. "I appear in the bedroom and see my owner looking for me under the bed.[line break]Woman’s voice: Here, kitty kitty, I have something nice for you."

Chapter 3 - Doors
 
A spike pit is a door.
It is east of the Kitchen and west of the Hallway. 
It is open.
It is not openable.
It is scenery.

The brown door is a door.
It is north of the Garage and south of the Kitchen.
It is closed.
It is openable.
It is scenery.

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

To initialize game interface:
	execute JavaScript command "
		let bp = document.createElement('div');
		bp.id = 'backpack';
		bp.onclick = () => vorple.prompt.submit('inventory');
		document.body.appendChild(bp);

		let n = document.createElement('div');
		n.id = 'north';
		n.onclick = () => vorple.prompt.submit('north');
		document.body.appendChild(n);

		let e = document.createElement('div');
		e.id = 'east';
		e.onclick = () => vorple.prompt.submit('east');
		document.body.appendChild(e);

		let s = document.createElement('div');
		s.id = 'south';
		s.onclick = () => vorple.prompt.submit('south');
		document.body.appendChild(s);

		let w = document.createElement('div');
		w.id = 'west';
		w.onclick = () => vorple.prompt.submit('west');
		document.body.appendChild(w);
	";
	
Chapter 7 - Title screen

When play begins:
	if Vorple is supported:
		place an image "titlescreen.png" with the description "?", centered;
	center "[fantasy font style][start link][end style]";
	wait for the SPACE key;
	clear the screen;
	initialize game interface.
	
To say start link:
	if Vorple is supported:
		place a link to execute the JavaScript command "vorple.prompt.queueKeypress(' ')" reading "START";
	otherwise:
		say "[paragraph break]Press space to continue."
		
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
		say "[paragraph break]Too short. Try again!";
		reject the player's command;
	if N > 10:
		say "[paragraph break]Whoa! Let's keep it under 10 letters, superstar. Try a shorter name.";
		reject the player's command;
	now the player's full name is the player's command;
	now the command prompt is ">";
	say "Hi, [player's full name]![paragraph break]";
	[say "[banner text]";]
	move the player to the location;
	reject the player's command.
	
Instead of looking when collecting names: do nothing.

Rule for printing the banner text when collecting names: do nothing.

Rule for constructing the status line when collecting names: do nothing.

Chapter 9 - Miscellanous