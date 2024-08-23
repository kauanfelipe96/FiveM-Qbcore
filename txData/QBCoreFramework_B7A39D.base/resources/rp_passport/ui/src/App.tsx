import { useState } from "react";
import "./App.css";
import Passport from "./components/Passport";
import { debugData } from "./utils/debugData";
import { IPassportData } from "./types";
import { useNuiEvent } from "./hooks/useNuiEvent";

debugData<boolean | IPassportData>([
  { action: "passport:setVisible", data: true },
  {
    action: "rp_passport:setPassportData",
    data: {
      citizenid: "C12324",
      firstname: "Kauan",
      lastname: "Felipe",
      birthdate: 631159200000,
      nationality: "Brasileiro",
      gender: 0,
      city: "Ribeirão Pires",
      color: "pink",
    },
  },
]);

function App() {
  const [passportData, setPassportData] = useState<IPassportData>();

  useNuiEvent("rp_passport:setPassportData", (data?: IPassportData) => {
    setPassportData(data);
  });

  return <>{passportData && <Passport data={passportData} />}</>;
}

export default App;
