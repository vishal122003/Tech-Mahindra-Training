class CarDemo {
    public static void main(String[] args) {
        Car[] cars = {new Car("Toyota", "Corolla", 2020), new ElectricCar("Tesla", "Model S", 2022, 400)};
        
        for (Car car : cars) {
            car.startEngine();
        }
    }
}
