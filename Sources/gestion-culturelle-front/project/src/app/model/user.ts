import { RoleDto } from './roleDto';
import { PanierDto } from './panierDto';
import { AnimationDto } from './animationDto';
import { ManifestationDto } from './manifestationDto';

export class User {
    id: number;
    nom: string;
    prenom: string;
    email: string;
    adresse: string;
    numClient: string;
    panier: PanierDto;
    role: RoleDto;
    entreprise: string;
    listAnimations: AnimationDto;
    inactif: Boolean;
    listManifestations: ManifestationDto;

    constructor(id?: number, nom?: string, prenom?: string, email?: string,
        adresse?: string, numClient?: string, role?: RoleDto, panier?: PanierDto,
        entreprise?: string, listAnimations?: AnimationDto, inactif?: boolean, listManifestations?: ManifestationDto

    ) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.adresse = adresse;
        this.numClient = numClient;
        this.panier = panier;
        this.role = role;
        this.entreprise = entreprise;
        this.listAnimations = listAnimations;
        this.inactif = inactif;
        this.listManifestations = listManifestations;

    }

}
