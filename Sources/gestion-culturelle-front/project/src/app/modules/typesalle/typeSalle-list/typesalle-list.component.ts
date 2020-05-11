import { Component, OnInit } from '@angular/core';
import { TypeSalleDto } from '../../../model/typeSalleDto';
import { TypeSalleService } from '../../../service/typeSalle.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-typesalle-list',
  templateUrl: './typesalle-list.component.html',
  styleUrls: ['./typesalle-list.component.css']
})
export class TypeSalleListComponent implements OnInit {

  typeSalles: TypeSalleDto[];
  typeSalle : TypeSalleDto;


  constructor(private typeSalleService: TypeSalleService, private router: Router
    , private toastrService:ToastrService) { }

  ngOnInit() {
    this.typeSalleService.subjectMiseAJour.subscribe(
      res => {
        this.typeSalleService.getAll().subscribe(
          donnees => {
            this.typeSalles = donnees;
          }
        );
      }
    );

    this.typeSalleService.getAll().subscribe(
      resultat => {
        this.typeSalles = resultat;
      }
    );
  }

  delete(id: number) {
    this.typeSalle = new TypeSalleDto();

    this.typeSalleService.getOne(id).subscribe(
      res => {
        this.typeSalle = res;
        console.log(res);
      }
    );

    this.typeSalleService.delete(id).subscribe(
      res => {
        this.typeSalleService.subjectMiseAJour.next(0);
        if (res) {
          this.toastrService.success(this.typeSalle.label+' effacé.','Suppression Ok.')
        } else {
          this.toastrService.error('Le type de salle '+ this.typeSalle.label+' est associé à une salle','Suppression impossible')
        }
      }
    )

  }

  redirectToUpdate(id: number) {
    this.router.navigateByUrl('/typesalle-update/' + id)
  }


  redirectToShow(id: number) {
    this.router.navigateByUrl('/typesalle-show/' + id)
  }
}
