bool ExpastionStatus(int stateCode){
  var errorMassege='';
  switch(stateCode){
    case 200:
    errorMassege="The Requst Completed Succ";
    return true;
  case 404:
   errorMassege="Error Not Found";
   return false;
   case 400:
      errorMassege="Error Bad Requst";
   return false;
   default:
   return false;
  }
  //Open Overlaymnet
}