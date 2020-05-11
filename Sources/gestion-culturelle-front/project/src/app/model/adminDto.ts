import { RoleDto } from './roleDto';

export class AdminDto {
    id: number;
    nom: string;
    prenom: string;
    email: string;  
    password: string;
    adresse: string;
    role: RoleDto;

    constructor(
        id?: number,
        nom?: string,
        prenom?: string,
        email?: string,       
        password?: string,
        adresse?: string,
        role?: RoleDto,
    ) {
        this.id = id;
        this.nom = nom;       
        this.email = email;    
        this.prenom = prenom;
        this.password = password;
        this.adresse = adresse;
        this.role = role;


    }
}


