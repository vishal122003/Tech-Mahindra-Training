import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private apiUrl = 'http://localhost:3000';

  constructor(private http: HttpClient) {}

  // Fetch all buses
  getBuses(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/buses`);
  }

  // Fetch bus details by ID
  getBusById(id: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/buses`).pipe(
      map((buses: any[]) => buses.find(bus => bus.id === id))
    );
  }
}
