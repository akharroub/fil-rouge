import { Component, OnInit } from '@angular/core';
import { TypeSalleService } from '../../../service/typeSalle.service';
import { Router, ActivatedRoute } from '@angular/router';
import { TypeSalleDto } from '../../../model/typeSalleDto';


@Component({
  selector: 'app-typesalle-show',
  templateUrl: './typesalle-show.component.html',
  styleUrls: ['./typesalle-show.component.css']
})
export class TypeSalleShowComponent implements OnInit {

  typeSalle: TypeSalleDto;

  constructor(private route: ActivatedRoute, private typeSalleService: TypeSalleService, private router: Router) { }
  
  ngOnInit() {
    this.typeSalle = new TypeSalleDto();

    let id = this.route.snapshot.params['id'];

    this.typeSalleService.getOne(id).subscribe(
      res => {
        this.typeSalle = res;
        console.log(res);
      }
    );
  }

}

