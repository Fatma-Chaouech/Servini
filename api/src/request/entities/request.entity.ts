/* eslint-disable prettier/prettier */
import { Category } from "src/category/entities/category.entity";
import { TimestampEntity } from "src/generics/timestamp.entity";
import { User } from "src/user/entities/user.entity";
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";

/* eslint-disable prettier/prettier */
@Entity("request")
export class Request extends TimestampEntity {

@PrimaryGeneratedColumn()
id:number;
@Column()
title:string;
@ManyToOne((TargetEntity) => Category, (category) => category.title, {
    eager: true,
  })
category:string;
@Column()
disponibility:string;
@Column()
description:string;
@Column()
price:string;

@ManyToOne((TargetEntity) => User, (user) => user.requests, {
     eager: true, 
  })
  /*   @Transform(({ value }) => ({
      name: value.name,
    })
  ) */

  user: string;
}

