import { RoleDto } from './roleDto';

export class VipDto {
    id: number;
    nom: string;
    prenom: string;
    email: string;  
    password: string;
    adresse: string;
    role: RoleDto;
    entreprise: string;
    photo: string

    constructor(
        id?: number,
        nom?: string,
        prenom?: string,
        email?: string,    
        password?: string,
        adresse?: string,
        role?: RoleDto,
        entreprise?: string,
        photo?: string

        ){
        this.id = id;
        this.nom= nom;
        this.prenom = prenom;
        this.email = email;    
        this.password = password;
        this.adresse = adresse;
        this.role = role;
        this.entreprise = entreprise;
        this.photo=photo;

    }
}