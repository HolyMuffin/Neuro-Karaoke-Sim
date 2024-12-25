function Song(song_, singers_, delay_) constructor {
	song = song_; //sound asset of the song
	singers = singers_; //array containing "Neuro" and or "Evil", main singer first for duet
}

global.AngelWithShotgun = new Song(Evil_AngelWithAShotgun, "Evil", 7.2);