import { Component, ViewChild, ElementRef } from '@angular/core';
import jspdf from 'jspdf';
import html2canvas from 'html2canvas';
import * as html2pdf from 'html2pdf.js';

@Component({
  selector: 'app-generatepdf',
  templateUrl: './generatepdf.component.html',
  styleUrls: ['./generatepdf.component.css']
})
export class GeneratepdfComponent {

  downloadPDF() {
    const DATA = document.getElementById('htmlData');
    const doc = new jspdf('l', 'pt', 'a4');
    const options = {
      background: 'white',
      scale: 3,
    };
    html2canvas(DATA, options).then((canvas) => {

      const img = canvas.toDataURL('image/PNG');

      // Add image Canvas to PDF
      const bufferX = 0;
      const bufferY = -3;
      const imgProps = (doc as any).getImageProperties(img);
      const pdfWidth = doc.internal.pageSize.getWidth() - 2 * bufferX;
      const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
      doc.addImage(img, 'PNG', bufferX, bufferY, 100, 100, undefined);
      return doc;
    }).then((docResult) => {

      //docResult.save(`${new Date().toISOString()}_tutorial.pdf`);
      docResult.save('tutorial.pdf');
    });
  }

  /*
  public openPDF():void {
    let DATA = this.htmlData.nativeElement;
    let doc = new jspdf('p','pt', 'a4');
    doc.fromHTML(DATA.innerHTML,15,15);
    doc.output('dataurlnewwindow');
  }
*/

  exportar() {

    const invoice = document.getElementById("htmlData");
    console.log(invoice);
    console.log(window);
    var opt = {
      margin: 0,
      pagespilt: true,
      filename: 'download.pdf',
      image: { type: 'png' },
      html2canvas: { scale: 2 },
      jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' }
    }
    console.log(invoice)
    html2pdf().from(invoice).set(opt).save();

  }


  inovice() {
    const invoice = document.getElementById("htmlData");
    console.log(invoice);
    console.log(window);
    var opt = {
      margin: [0, -3, 0, 0],
      pagespilt: true,
      filename: 'download.pdf',
      image: { type: 'jpeg' },
      html2canvas: { scale: 2 },
      jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' }
    }
    console.log(invoice)
    html2pdf().from(invoice).set(opt).save();
  }

}
