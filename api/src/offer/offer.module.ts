/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { OfferService } from './offer.service';
import { OfferController } from './offer.controller';
import { Offer } from './entities/offer.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Category } from 'src/category/entities/category.entity';
import { User } from 'src/user/entities/user.entity';


@Module({
  imports:[TypeOrmModule.forFeature([Offer]),TypeOrmModule.forFeature([Category]),TypeOrmModule.forFeature([User])],
  controllers: [OfferController],
  providers: [OfferService],
})
export class OfferModule {}
