import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filterSeats',
  standalone: true
})
export class FilterSeatsPipe implements PipeTransform {
  transform(buses: any[], seats: number): any[] {
    if (!buses) return [];
    if (seats === 0) return buses;
    return buses.filter(bus => bus.availableSeats >= seats);
  }
}
