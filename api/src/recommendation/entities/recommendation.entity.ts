/* eslint-disable prettier/prettier */
import { User } from "src/user/entities/user.entity";
import { Column,  Entity, JoinColumn, ManyToOne, OneToMany, OneToOne, PrimaryGeneratedColumn } from "typeorm";

@Entity("recommendation")
export class Recommendation {
    @PrimaryGeneratedColumn()
    id:number;
    @ManyToOne(() => User, {
        eager: true,
      })
    @JoinColumn()
    receiver:string;
   
    @ManyToOne(() => User,{
        eager: true,
      })
    @JoinColumn()
    giver:string;
    
    @Column()
    description:string;

    @Column({default:0.0,type:"double"})
    rating:number;
}
