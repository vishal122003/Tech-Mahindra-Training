<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <script src="Ex3.js"></script> -->
</head>
<script>
const choose=()=>{
    const operation=prompt("Choose an operation: add, subtract, multiply, divide");
    const num1 = parseFloat(prompt("Enter the first number:"));
    const num2 = parseFloat(prompt("Enter the second number:"));    
    switch (operation) {
        case 'add':
            console.log('Sum:',num1+num2);
            break;
        case 'subtract':
            console.log('Subtract:',num1-num2);
            break;
        case 'multiply':
            console.log('Multiply:',num1*num2);
            break;
        case 'divide':
            console.log('Quotient:',num1/num2);
            console.log('Remainder:',num1%num2);
            break;
        default:
            console.log("Invalid operation. Please choose add, subtract, multiply, or divide.");
            break;
    }
}  
    choose();
</script>
</body>
</html>
