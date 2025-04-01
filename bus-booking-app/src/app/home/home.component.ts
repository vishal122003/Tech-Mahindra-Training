import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ContactUsComponent } from '../contact-us/contact-us.component';
import { BusDetailsComponent } from '../bus-details/bus-details.component';
import { BusListComponent } from '../bus-list/bus-list.component';
import { BookingFormComponent } from '../booking-form/booking-form.component';
import { ApiService } from '../services/api.service';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [
    CommonModule,
    BusDetailsComponent,
    //BusListComponent,
  ],
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  featuredBuses: any[] = [];
  testimonials: any[] = [
    { message: 'Great service! Comfortable and punctual.', name: 'John Doe' },
    { message: 'Easy booking process and excellent customer support.', name: 'Jane Smith' }
  ];

  constructor(private apiService: ApiService) {}

  ngOnInit(): void {
    this.apiService.getBuses().subscribe(buses => {
      this.featuredBuses = buses.slice(0, 2); // Display the first 2 buses as featured
    });
  }
}
