/* eslint-disable prettier/prettier */
import { CreateDateColumn, DeleteDateColumn, UpdateDateColumn } from "typeorm";

/* eslint-disable prettier/prettier */
export class TimestampEntity {
    @CreateDateColumn({
      update: false,
    })
    createdAt: Date;
    @UpdateDateColumn({})
    updatedAt: Date;
    @DeleteDateColumn({})
    deletedAt: Date;
  }
  