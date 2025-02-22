public class Employee {
	int empId;
	String empName;
	double sal;
	int yearsWorked;
	public Employee(int empId, String empName, double sal, int yearsWorked) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.sal = sal;
		this.yearsWorked = yearsWorked;
	}
	void getEmployeeDetails() {
		System.out.println("Employee ID:"+empId+"\t Employee Name:"+empName+"\t Salary:"
				+sal+"\t No.of Years Worked:"+yearsWorked);
	}
	void setEmployeeDetails(int empId,String empName,double sal,int yearsWorked) {
		this.empId=empId;
		this.empName=empName;
		this.sal=sal;
		this.yearsWorked=yearsWorked;
	}
	void loanEligibility() {
		if(yearsWorked<=5)
			System.out.println("Your are not eligible for loan amount");
		else if(sal>=1500000)
			System.out.println("Eligible loan amount is:"+700000);
		else if(sal>=1000000)
			System.out.println("Eligible loan amount is:"+500000);
		else if(sal==600000)
			System.out.println("Eligible loan amount is:"+200000);
		else
			System.out.println("Your are not eligible for loan amount");
	}
	public static void main(String[] args) {
		Employee emp=new Employee(101, "sam", 1600000, 16);
		emp.getEmployeeDetails();
		emp.loanEligibility();
		Employee emp1=new Employee(102, "ram", 750000, 8);
		emp1.getEmployeeDetails();
		emp1.loanEligibility();
	}
}

// //Output:
// Employee ID:101	 Employee Name:sam	 Salary:1600000.0	 No.of Years Worked:16
// Eligible loan amount is:700000
// Employee ID:102	 Employee Name:ram	 Salary:750000.0	 No.of Years Worked:8
// Your are not eligible for loan amount
