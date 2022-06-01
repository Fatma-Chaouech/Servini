/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { Request } from 'src/request/entities/request.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Offer } from 'src/offer/entities/offer.entity';
import { User } from './entities/user.entity';
import { Recommendation } from 'src/recommendation/entities/recommendation.entity';

@Module({
  imports:[TypeOrmModule.forFeature([Recommendation]),TypeOrmModule.forFeature([User]),TypeOrmModule.forFeature([Offer]),TypeOrmModule.forFeature([Request])],
  controllers: [UserController],
  providers: [UserService],
  exports: [UserService]
})
export class UserModule {}
