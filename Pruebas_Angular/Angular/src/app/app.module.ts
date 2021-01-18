import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ExcelComponent } from './pages/excel/excel.component';
import { DownexcelComponent } from './pages/downexcel/downexcel.component';
import { GeneratepdfComponent } from './pages/generatepdf/generatepdf.component';

@NgModule({
  declarations: [
    AppComponent,
    ExcelComponent,
    DownexcelComponent,
    GeneratepdfComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
