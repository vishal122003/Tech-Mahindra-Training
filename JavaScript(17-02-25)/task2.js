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
        for (let index = 1; index <=num1; index++) {
            if(num1%index==0){
                console.log(index);
            }
        }
    }   
    let num1=prompt("Enter number")
    name1(num1);
</script>
</body>
</html>
