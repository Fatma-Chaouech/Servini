/* eslint-disable prettier/prettier */
import { IsNotEmpty, IsString } from "class-validator";
import { User } from "src/user/entities/user.entity";

/* eslint-disable prettier/prettier */
export class CreateRequestDto {
    @IsString()
    title:string;
    @IsNotEmpty()
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
