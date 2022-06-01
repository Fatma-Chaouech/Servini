/* eslint-disable prettier/prettier */
import { User } from "src/user/entities/user.entity";
import { Column,  Entity, JoinColumn, ManyToOne, OneToMany, OneToOne, PrimaryColumn } from "typeorm";

@Entity("recommendation")
export class Recommendation {
    @PrimaryColumn()
    @ManyToOne(() => User)
    @JoinColumn()
    receiver:string;
    @PrimaryColumn()
    @ManyToOne(() => User)
    @JoinColumn()
    giver:string;
    @Column()
    description: string;

  
    @Column({default:0.0,type:"double"})
    rating:number;
}
