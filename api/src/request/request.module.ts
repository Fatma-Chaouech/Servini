/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { RequestService } from './request.service';
import { RequestController } from './request.controller';
import { Request } from './entities/request.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Category } from 'src/category/entities/category.entity';

@Module({
  imports:[TypeOrmModule.forFeature([Request]),TypeOrmModule.forFeature([Category])],
  controllers: [RequestController],
  providers: [RequestService]
})
export class RequestModule {}
