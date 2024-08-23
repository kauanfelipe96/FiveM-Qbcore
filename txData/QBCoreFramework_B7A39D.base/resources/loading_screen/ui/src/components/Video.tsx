import React from "react";
import logo from '../assets/logo.gif';
import video from '../assets/video.mp4';

const Video: React.FC = () => {
  return (
    <>
      <div>
        <div className="fixed top-0 left-0 object-cover w-full h-full bg-slate-950 z-10 opacity-70"></div>
        <video autoPlay muted loop className="blur fixed top-0 left-0 object-cover w-full h-full">
          <source src={video} type="video/mp4"/>
        </video>
        <div className="fixed top-0 left-0 object-cover w-full h-full z-20 flex items-center justify-center flex-col gap-3">
          <img className="rounded-2xl" src={logo}/>
          <h2 className="animate text-white font-semibold text-lg">CARREGANDO</h2>
        </div>
      </div>
    </>
  );
};

export default Video;
