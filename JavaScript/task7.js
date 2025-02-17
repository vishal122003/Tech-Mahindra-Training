mul();
function mul(){
    let num1=prompt("Enter the first number");
    let num2=parseInt(num1)+parseInt(50);
    for (let index=num1;index<=num2;index++){
        if (index%5==0) {
            continue;
        }
        console.log(index);
    }
}
