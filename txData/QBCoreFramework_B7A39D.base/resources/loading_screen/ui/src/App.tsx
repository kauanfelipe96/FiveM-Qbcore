import "./App.css";
import React from "react";
import Video from "./components/Video";
import MusicPlayer from "./components/MusicPlayer";

const App: React.FC = () => {
  return (
    <div>
      <Video />
      <MusicPlayer />
    </div>
  );
};

export default App;
