import React, { useState } from "react";
import brasao from "../assets/brasaorprp.png";
import woman from "../assets/woman.png";
import man from "../assets/man.png";
import { TbEPassport } from "react-icons/tb";
import { IPassportData } from "../types";

interface IPassportProps {
  data: IPassportData;
}

const Passport: React.FC<IPassportProps> = ({ data }) => {
  const [isOpen, setIsOpen] = useState(false);
  const defaultColor =
    "linear-gradient(90deg, rgba(13,13,13,1) 80%, rgba(0,0,0,1) 100%)";
  const handleClick = () => {
    setIsOpen(!isOpen);
  };

  const changeColor = () => {
    const colors = {
      red: {
        background:
          "linear-gradient(90deg, rgb(211 73 73) 80%, rgb(121 31 31) 100%)",
      },
      blue: {
        background:
          "linear-gradient(90deg, rgba(33, 50, 75, 1) 80%, rgba(20, 33, 52, 1) 100%)",
      },
      gray: {
        background:
          "linear-gradient(90deg, rgba(50,52,55,1) 80%, rgba(19,22,27,1) 100%)",
      },
      purple: {
        background:
          "linear-gradient(90deg, rgba(59,7,100,1) 80%, rgba(24,2,41,1) 100%)",
      },
      black: {
        background:
          "linear-gradient(90deg, rgba(13,13,13,1) 80%, rgba(0,0,0,1) 100%)",
      },
      beige: {
        background:
          "linear-gradient(90deg, rgba(245,245,220,1) 80%, rgba(184,184,122,1) 100%)",
      },
      green: {
        background:
          "linear-gradient(90deg, rgba(19,121,63,1) 80%, rgba(3,59,27,1) 100%)",
        color: "#e2e2e2",
      },
    };

    return (
      colors[data.color as keyof typeof colors] || { background: defaultColor }
    );
  };

  return (
    <>
      <div
        className={`book ${isOpen ? "open-book" : "closed-book"}`}
        onClick={handleClick}
      >
        <div
          className={`back ${isOpen ? "open-back" : "closed-back"}`}
          style={changeColor()}
        ></div>
        <div className={`page2 ${isOpen ? "open-page2" : "closed-page2"}`}>
          <div className="page2-content">
            <h1>INTERNATIONAL PASSPORT</h1>
            <div className="page2-container">
              <img src={ data.gender === 0 ? man : woman } width={80} style={{ backgroundColor: '#f0f1f4', padding: '10px', borderRadius: '8px' }} />
              <div className="input-container">
                <div className="input-row">
                  <div className="input">
                    <label>Surname </label>
                    <div className="data">{data.lastname}</div>
                  </div>
                  <div className="input">
                    <label>CID </label>
                    <div className="data">{data.citizenid}</div>
                  </div>
                </div>
                <div className="input">
                  <label>Given name</label>
                  <div className="data">{data.firstname}</div>
                </div>
                <div className="input">
                  <label>Date of birth</label>
                  <div className="data">
                    {new Date(data.birthdate / 1000).toLocaleDateString()}
                  </div>
                </div>
                <div className="input-row">
                  <div className="input">
                    <label>Nationality </label>
                    <div className="data">{data.nationality}</div>
                  </div>
                  <div className="input">
                    <label>Sex </label>
                    <div className="data">{data.gender === 0 ? "H" : "M"}</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className={`page1 ${isOpen ? "open-page1" : "closed-page1"}`}>
          <div className="page1-content">
            <h1>{data.citizenid}</h1>
          </div>
          <div className="signature-container">
            <div className="signature">
              {data.firstname} {data.lastname}
            </div>
            <div className="signature-line"></div>
            <div className="signature-text">Signature of Bearer</div>
          </div>
        </div>
        <div
          className={`front ${isOpen ? "open-front" : "closed-front"}`}
          style={changeColor()}
        >
          <h1>Passport</h1>
          <img src={brasao} width={150} />
          <h2>{data.city}</h2>
          <TbEPassport className="icon" />
        </div>
      </div>
    </>
  );
};

export default Passport;
