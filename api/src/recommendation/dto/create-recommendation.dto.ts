/* eslint-disable prettier/prettier */
import { Type } from "class-transformer";
import { IsNumber } from "class-validator";
import { Double } from "typeorm";

/* eslint-disable prettier/prettier */
export class CreateRecommendationDto {
    
    receiver:string;
    giver:string;
    description: string;


    @IsNumber()
    @Type(()=>Double)
    rating:number;
}
