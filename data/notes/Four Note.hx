function onPlayerHit(e) {
    if (e.noteType == "Four Note") {
			e.showSplash = true;
			if (!e.note.isSustainNote) {
				e.healthGain -= 0.3;
                e;misses = true;
				FlxG.sound.play(Paths.sound('screech'), 0.5);
                dad.playAnim('singRIGHT', true, 'SING');
                boyfriend.playAnim('hit', true, 'SING');
			} else e.healthGain = 0;
    }
}

function onPlayerMiss(e) {
	if (e.noteType == "Four Note") {
		e.cancel();
		deleteNote(e.note); // Deletes the note when it goes offscreen
	}
}


function onNoteCreation(e) {
		switch (e.noteType) {
			case "Four Note":
				/*
				If you're playing as the opponent (PlayState.opponentMode)
				and any strumlines AFTER dad (e.strumLineID >= 1)
				Hurt Note will be hittable for THOSE strumline characters
				doesn't matter if it's bf or other additionals strumlines, as long as it's after dads' strumline it's hittable
				*/
				if (PlayState.opponentMode && e.strumLineID >= 1) e.note.wasGoodHit = true;

				/*
				If you're playing solo (!PlayState.opponentMode)
				and any strumlines BEFORE the current character you're playing (e.strumLineID <= 0)
				Hurt Note will be hittable for THOSE strumline characters
				doesn't matter if it's bf or other additionals, as long as it's BEFORE dad's strumline
				*/
				if (!PlayState.opponentMode && e.strumLineID <= 0) e.note.wasGoodHit = true;
				e.noteSprite = "game/notes/FOURNOTE_NEW_assets";
				e.noteScale = 0.73;
                e.note.earlyPressWindow = 0.3; // so you wouldn't hit it too early whilst also making it so you wouldn't hit it pixel perfect
				e.note.latePressWindow = 0.3; // Same purpose as above
                e.note.avoid = true;
				e.mustHit = false;
		}
}