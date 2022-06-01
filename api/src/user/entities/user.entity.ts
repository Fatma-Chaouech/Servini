/* eslint-disable prettier/prettier */
import { TimestampEntity } from "src/generics/timestamp.entity";
import { Offer } from "src/offer/entities/offer.entity";
import { Request } from "src/request/entities/request.entity";
import { Column, Double, Entity, OneToMany, PrimaryColumn } from "typeorm";

@Entity("user")
export class User extends TimestampEntity{
    @PrimaryColumn()
    username:string;
    @Column()
    email:string;
    @Column()
    fullname:string;
    @Column()
    password:string;
    @Column()
    bio:string;
    @Column()
    salt:string;
    @Column()
    location:string;
    @Column({default:0.0,type:"double"})
    rating:number;
    @OneToMany(() => Offer, (offer) => offer.user, {})
    
    offers: Offer[];
    @OneToMany(() => Request, (request) => request.user, {})
   
    requests: Request[];
}
