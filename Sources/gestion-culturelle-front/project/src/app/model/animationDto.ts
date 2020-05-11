export class AnimationDto {
    id: number;
    label: string;
    type: string;
    prix: number;
    nbreSpectateursPrevus: number;
    

    constructor(id?: number,
        label?: string,
        type?: string,
        prix? : number,
        nbreSpectateursPrevus?: number ){
        this.id = id;
        this.label=label;
        this.type = type;
        this.prix = prix;
        this.nbreSpectateursPrevus = nbreSpectateursPrevus;
       
    }
}


