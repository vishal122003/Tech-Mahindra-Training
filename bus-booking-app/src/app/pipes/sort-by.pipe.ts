import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'sortBy'
})
export class SortByPipe implements PipeTransform {
  transform(buses: any[], sortBy: string): any[] {
    if (!buses || !sortBy) {
      return buses;
    }
    return buses.sort((a, b) => a[sortBy] - b[sortBy]);
  }
}
