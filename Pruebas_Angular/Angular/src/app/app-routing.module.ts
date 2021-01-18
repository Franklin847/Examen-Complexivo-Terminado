import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ExcelComponent } from '../app/pages/excel/excel.component';
import { DownexcelComponent } from '../app/pages/downexcel/downexcel.component';
import { GeneratepdfComponent } from '../app/pages/generatepdf/generatepdf.component'

const routes: Routes = [
  {path: 'excel', component: ExcelComponent},
  {path: 'downexcel', component: DownexcelComponent},
  {path: 'pdf', component: GeneratepdfComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
