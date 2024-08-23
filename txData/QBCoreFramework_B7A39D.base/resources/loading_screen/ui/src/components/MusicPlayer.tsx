import React, { useEffect } from "react";
import song from '../assets/music.mp3';

const MusicPlayer: React.FC = () => {
  useEffect(() => {
    const music = document.getElementById("music") as HTMLMediaElement;
    if (music) {
      music.volume = 0.5;
      music.play().catch(error => {
        console.error("Erro ao tentar reproduzir a música:", error);
      });
    }
  }, []);

  return (
    <audio autoPlay id="music" src={song} />
  );
};

export default MusicPlayer;