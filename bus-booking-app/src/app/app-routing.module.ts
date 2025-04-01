import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { BusListComponent } from './bus-list/bus-list.component';
import { BusDetailsComponent } from './bus-details/bus-details.component';
import { BookingFormComponent } from './booking-form/booking-form.component';

export const appRoutes: Routes = [
  { path: 'home', loadComponent: () => import('./home/home.component').then(m => m.HomeComponent) },
  { path: 'contact', loadComponent: () => import('./contact-us/contact-us.component').then(m => m.ContactUsComponent) },
  { path: 'buses', loadComponent: () => import('./bus-list/bus-list.component').then(m => m.BusListComponent) },
  { path: 'bus/:id', loadComponent: () => import('./bus-details/bus-details.component').then(m => m.BusDetailsComponent) },
  { path: 'booking', loadComponent: () => import('./booking-form/booking-form.component').then(m => m.BookingFormComponent) },
  { path: '', redirectTo: '/home', pathMatch: 'full' },
];
