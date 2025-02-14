let num=3;
console.log("Before Cube: "+num);
num=num*num*num;
console.log("After Cube: "+num);
var num1=5;
positive();
function positive() {
    if(num1>0)
        console.log("Positive");
    else
        console.log("Negative");
}
const number = 29;
console.log(`${number} is ${isPrime(number) ? 'a prime' : 'not a prime'} number.`);
function isPrime(num) {
    if(num <= 1) return false;
    if (num <= 3) return true;
    if (num % 2 === 0 || num % 3 === 0) return false;
    for (let i = 5; i * i <= num; i += 6) {
        if (num % i === 0 || num % (i + 2) === 0) return false;
    }
    return true;
}
alertbox();
function alertbox() {
    alert("Your address is Chennai");
    let userInput = prompt("Please enter your name:");
if (userInput !== null) {
    console.log("Hello, " + userInput + "!");
} else {
    console.log("User canceled the prompt.");
}
showConfirmation();
function showConfirmation() {
    let userConfirmed = confirm("Are you sure you want to go to film today?");
    if (userConfirmed) {
        console.log("The user is going to movie today.");
    } else {
        console.log("The user is not going to movie today..");
    }
}
age();
function age() {
    let userInput = prompt("Please enter your age:");
if (userInput !== null) {
    console.log("Hello, Your age is" + userInput + "!");
} else {
    console.log("User has not mentioned the age");
}
}}
let num2=24;
divisible();
function divisible() {
    if(num2%12==0)
        console.log(num2+"is divisible by 12");
    else
        console.log(num2+"is not divisible by 12");
}
getTomatoPrices();
function getTomatoPrices() {
    const prices = [];
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    for (let i = 0; i < days.length; i++) {
      const price = parseFloat(prompt(`Enter the price of 1 kg of tomatoes on ${days[i]}:`));
      if (!isNaN(price)) {
        prices.push(price);
      } else {
        console.log('Invalid input. Please enter a valid number.');
        return;
      }
    }
    const total = prices.reduce((sum, price) => sum + price, 0);
    const average = total / prices.length;
    if (average > 50) {
      console.log("Tomato has given good profit.");
    } else {
      console.log("No profit from tomato.");
    }
  }
  const year=2004;
  var month="february";
  leap(year);
  function leap(year) {
    if(year%4==0 || year%100==0){
        if(month=="februray")
        console.log("The Year is leap year and the month is February with 29 days.");
    else
        console.log("The Year is leap year and the month is not february");
        
    }
    else
        console.log("The year is not leap year");   
  }

//Output:
// Before Cube: 3
// Ex.js:4 After Cube: 27
// Ex.js:9 Positive
// Ex.js:14 29 is a prime number.
// Ex.js:29 Hello, xyz!
// Ex.js:37 The user is going to movie today.
// Ex.js:46 Hello, Your age is34!
// Ex.js:55 24is divisible by 12
// Ex.js:75 Tomato has given good profit.
// Ex.js:88 The Year is leap year and the month is not february
