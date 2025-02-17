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
