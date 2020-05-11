import { TypeSalleDto } from '../model/typeSalleDto';


export class SalleDto {
    id: number;
    label: string;
    capacite: number;
    placesVip: number;
    fraisJournalier: number;
    typeSalle:TypeSalleDto;

    constructor(id?: number, 
        param1?: string, 
        param2?: number,
        param3? : number, 
        param4? : number,
        typeSalle? : TypeSalleDto ){
        this.id = id;
        this.label=param1;
        this.capacite = param2;
        this.fraisJournalier = param3;
        this.fraisJournalier = param4;
        this.typeSalle = typeSalle;
    }
}
