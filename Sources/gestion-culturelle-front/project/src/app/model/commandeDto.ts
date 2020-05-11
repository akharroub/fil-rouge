import { ManifestationDto } from './manifestationDto';
import { PanierDto } from './panierDto';

export class CommandeDto {
    id: number;
    manifestation: ManifestationDto;
    panier: PanierDto;
    quantite: number;


    constructor(id?: number,
        manifestation?: ManifestationDto,
        panier?: PanierDto,
        quantite?: number) {
        this.id = id;
        this.manifestation = manifestation;
        this.panier = panier;
        this.quantite = quantite

    }
}


