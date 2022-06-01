/* eslint-disable prettier/prettier */
import { TimestampEntity } from "src/generics/timestamp.entity";
import { Column, Entity, PrimaryColumn } from "typeorm";
import {Blob} from 'buffer';
@Entity("category")
export class Category{
  @PrimaryColumn()
  title:string;
  @Column()
  description:string;
  @Column()
  pic:string;
}
