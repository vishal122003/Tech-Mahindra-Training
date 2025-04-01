import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms'; // Import FormsModule for ngModel binding
import { BusDetailsComponent } from '../bus-details/bus-details.component';
import { ApiService } from '../services/api.service';
import { FilterCostPipe } from '../pipes/filter-cost.pipe';
import { FilterSeatsPipe } from '../pipes/filter-seats.pipe';
import { SortByPipe } from '../pipes/sort-by.pipe';

@Component({
  selector: 'app-bus-list',
  standalone: true,
  imports: [CommonModule, FormsModule, BusDetailsComponent, FilterCostPipe, FilterSeatsPipe, SortByPipe], // Import FormsModule and Pipes
  templateUrl: './bus-list.component.html',
  styleUrls: ['./bus-list.component.css']
})
export class BusListComponent implements OnInit {
  buses: any[] = [];
  filterCost: number = 0;
  filterSeats: number = 0;
  
  constructor(private apiService: ApiService) {}

  ngOnInit(): void {
    this.apiService.getBuses().subscribe(data => {
      this.buses = data;
    });
  }
}
