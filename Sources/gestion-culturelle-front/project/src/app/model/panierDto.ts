import { ManifestationDto } from './manifestationDto';
import { CommandeDto } from './commandeDto';

export class PanierDto {
    id: number;
    dateValidation: Date;
    listCommandes: CommandeDto;
    total: number;

    constructor(id?: number,
        dateValidation?: Date,
        listCommandes?: CommandeDto,
        total?: number

    ) {
        this.id = id;
        this.dateValidation = dateValidation;
        this.listCommandes = listCommandes;
        this.total = total;

    }
}


