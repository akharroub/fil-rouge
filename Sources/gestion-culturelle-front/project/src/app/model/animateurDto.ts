
import { RoleDto } from './roleDto';
import { AnimationDto } from './animationDto';

export class AnimateurDto {
    id: number;
    nom: string;
    prenom: string;
    email: string;
    entreprise:string;    
    password: string;
    adresse: string;
    role: RoleDto;
    animation:AnimationDto;
    
  


    constructor(
        id?: number,
        nom?: string,
        prenom?: string,
        email?: string,
        password?: string,
        animation?: AnimationDto,
        adresse?:string,
        entreprise?:string,
        role?:RoleDto,      
        ){
        this.id = id;
        this.nom=nom;
        this.prenom=prenom;
        this.email=email;
        this.password=password;
        this.adresse=adresse;
        this.role=role;
        this.animation=animation;    
        this.entreprise=entreprise;        
       
    }
}


