import { TimestampEntity } from "src/generics/timestamp.entity";
import { Column, Entity, PrimaryColumn } from "typeorm";

@Entity()

export class Message extends TimestampEntity {
    @Column ({unique : true })
    id : number;
    @Column({length:250})
    sender : string;
    @Column({length:250})
    receiver : string;
    @Column({length:250})
    content : string;


}
