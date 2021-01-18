import { Component, OnInit } from '@angular/core';
import * as XLSX from 'xlsx';

@Component({
  selector: 'app-downexcel',
  templateUrl: './downexcel.component.html',
  styleUrls: ['./downexcel.component.css']
})
export class DownexcelComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  Company = [
    {"ContainerNo": 1, "SelCondition": 'posible', "ContainerCondition": 'never delete', "GateInDateTime": '12/12/12'},
    {"ContainerNo": 1, "SelCondition": 'posible', "ContainerCondition": 'never delete', "GateInDateTime": '12/12/12'},
    {"ContainerNo": 1, "SelCondition": 'posible', "ContainerCondition": 'never delete', "GateInDateTime": '12/12/12'},
    {"ContainerNo": 1, "SelCondition": 'posible', "ContainerCondition": 'never delete', "GateInDateTime": '12/12/12'}
  ]

  fileName = 'ExcelSheet.xlsx';
  exportexcel(): void {
    /* table id is passed over here */
    let element = document.getElementById('excel-table');
    const ws: XLSX.WorkSheet = XLSX.utils.table_to_sheet(element);

    /* generate workbook and add the worksheet */
    const wb: XLSX.WorkBook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');

    /* save to file */
    XLSX.writeFile(wb, this.fileName);

  }




}
