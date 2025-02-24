let student = {
    name: "John Doe",
    age: 21,
    grade: "A",
    getDetails: function() {
        return `${this.name}, Age: ${this.age}, Grade: ${this.grade}`;
    }
};
console.log(student.name); // John Doe
console.log(student.getDetails()); // John Doe, Age: 21, Grade: A
student.address = {
    street: "123 Main St",
    city: "Anytown"
};
student.setAge = function(newAge) {
    this.age = newAge;
};
student.getFullName = function() {
    return `${this.name} from ${this.address.city}`;
};
console.log(student.address.city); // Anytown
console.log(student.getFullName()); // John Doe from Anytown
student.setAge(22);
console.log(student.age); // 22
delete student.grade;
delete student.getFullName;
console.log(student); 
