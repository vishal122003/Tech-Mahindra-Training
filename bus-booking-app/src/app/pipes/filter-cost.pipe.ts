import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filterCost',
  standalone: true
})
export class FilterCostPipe implements PipeTransform {
  transform(buses: any[], cost: number): any[] {
    if (!buses) return [];
    if (cost === 0) return buses;
    return buses.filter(bus => bus.rate <= cost);
  }
}
