import { TimestampEntity } from "src/generics/timestamp.entity";
import { Column, Entity, PrimaryColumn } from "typeorm";

@Entity()
export class User extends TimestampEntity{

    @Column({ length: 100, unique: true })
    email: string;
    @Column()
    password: string;
    @Column()
    fullname: string;
    @PrimaryColumn({length: 25})
    username: string;
    @Column()
    bio: string;
    @Column()
    salt: string;
    @Column()
    location: string;
    @Column()
    rating: number;
}
