import { Component } from '@angular/core';
import { BreadcrumbService } from '../../shared/breadcrumb/breadcrumb.service';

@Component({
    templateUrl: './emptydemo.component.html'
})
export class EmptyDemoComponent {

    constructor(private breadcrumbService: BreadcrumbService) {
        this.breadcrumbService.setItems([
            { label: 'Pages' },
            { label: 'Empty', routerLink: ['/pages/empty'] }
        ]);
    }
}
