<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <script src="Ex3.js"></script> -->
</head>
<script>
    function name1(num1) {
        let sum=0;
        while(num1>0){
            let rev=num1%10;
            sum=sum+rev;
            num1=num1/10;
        }
        console.log(parseInt(sum));
        
    }   
    let num1=prompt("Enter number")
    name1(num1);
</script>
</body>
</html>
