import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms'; // Import FormsModule

import { AppComponent } from './app.component';
import { BusListComponent } from './bus-list/bus-list.component';
// Add other imports here...

@NgModule({
  declarations: [
    // Add other declarations here...
  ],
  imports: [
    BrowserModule,
    FormsModule, // Add FormsModule to imports array
    // Add other modules here...
  ],
  providers: [],
  bootstrap: []
})
export class AppModule { }
