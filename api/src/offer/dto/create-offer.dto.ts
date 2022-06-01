/* eslint-disable prettier/prettier */
import { IsNotEmpty, IsString } from "class-validator";
import { Category } from "src/category/entities/category.entity";
import { User } from "src/user/entities/user.entity";

export class CreateOfferDto {

    @IsString()
    title:string;
    @IsString()
    category:string;
    
    @IsString()
    disponibility:string;
    @IsString()
    description:string;
    @IsString()
    price:string;
    @IsString()
    user:string;
    
}
