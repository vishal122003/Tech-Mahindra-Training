maths();
  function maths() {
    let mat=prompt("Enter your maths mark:");
    if(mat==100)
        console.log("Phenomenal!");
    else if(mat>85)
        console.log("Excellent!");
    else if(mat>=71)
        console.log("Good work!");
    else if(mat>=51)
        console.log("Practice well!");
    else
        console.log( "Hard work is needed");
  }
week();
  function week() {
    let mat=prompt("Enter the day:");
    switch (mat) {
        case "Monday":
            console.log("Start of the week!");
            break;
        case "Tuesday":
            console.log("Mid of the week!");
            break;
        case "Wednesday":
            console.log("Mid of the week!");
            break;
        case "Thursday":
            console.log("Mid of the week!");
            break;
        case "Friday":
            console.log("Last working day of the week!");
            break;
        case "Saturday":
            console.log( "WeekEnd - Saturday!");
            break;
        case "Sunday":
            console.log("WeekEnd - Sunday!");
            break;
        default:
            console.log("Invalid input!");
            break;
    }
  }
