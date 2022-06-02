/* eslint-disable prettier/prettier */
import { Type } from "class-transformer";
import { IsNumber,IsNotEmpty } from "class-validator";
import { Double } from "typeorm";

/* eslint-disable prettier/prettier */
export class CreateRecommendationDto {
    @IsNotEmpty()
    receiver:string;
    @IsNotEmpty()
    giver:string;
    @IsNotEmpty()
    @IsNumber()
    @Type(()=>Double)
    rating:number;
    @IsNotEmpty()
    description:string;
}
