"9Zivota" by Andrej

Include Vorple Notifications by Juhana Leinonen.

Include Vorple Multimedia by Juhana Leinonen.

Release along with the "Vorple" interpreter.

Release along with the file "heart.png".

Release along with the file "backpack.png"

Release along with style sheet "my.css".

The Garage is a room. "A place where you spend your nights resting. Below the window, there is a bed without a pillow. The only exit is a brown door to the north."

The Kitchen is a room. "Here I always get something to eat, but I'm not always welcome. A dangerous pit with spikes blocks the way to the east."

The Hallway is a room. "A cold and long hallway that leads to the basement."

A spike pit is a door.
It is east of the Kitchen and west of the Hallway. 
It is open.
It is not openable.
It is scenery.

The rope is in the Kitchen.
It is wearable.
The description is "This will come in handy."

The brown door is a door.
It is north of the Garage and south of the Kitchen.
It is closed.
It is openable.
It is scenery.

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
		now the player is in the Kitchen;
		

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
		
The carrying capacity of the player is 1.

The bone is in the Kitchen.
It is edible.

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

When play begins:
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

When play begins:
	display a notification reading "Welcome to Vorple!".