// Define the student object
const student = {
    id: 1,
    name: "John Doe",
    department: "Computer Science",
    college: "ABC University",
    email: "johndoe@example.com"
};
const displayAllProperties = (student) => {
    console.log(`ID: ${student.id}`);
    console.log(`Name: ${student.name}`);
    console.log(`Department: ${student.department}`);
    console.log(`College: ${student.college}`);
    console.log(`Email: ${student.email}`);
};
displayAllProperties(student);
const displayIDNameEmail = (student) => {
    console.log(`ID: ${student.id}`);
    console.log(`Name: ${student.name}`);
    console.log(`Email: ${student.email}`);
};
displayIDNameEmail(student);
student.address = {
    doorNo: "123",
    street: "Main St",
    area: "Downtown",
    pincode: "123456"
};
const displayWithAddress = (student) => {
    console.log(`ID: ${student.id}`);
    console.log(`Name: ${student.name}`);
    console.log(`Department: ${student.department}`);
    console.log(`College: ${student.college}`);
    console.log(`Address: ${student.address.doorNo}, ${student.address.street}, ${student.address.area}, ${student.address.pincode}`);
};
displayWithAddress(student);
delete student.email;
delete displayIDNameEmail;
console.log("Updated Student Object:", student);
