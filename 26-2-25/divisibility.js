import react from "react";
function Divisible() {
    let num=prompt("Enter a number")
    return(
    <>
    {num%16==0?<h1>Divisible by 16</h1>:<h1>Not Divisible by 16</h1>}
</>);
}
export default Divisible;
