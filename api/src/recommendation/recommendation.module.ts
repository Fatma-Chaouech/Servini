/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { RecommendationService } from './recommendation.service';
import { RecommendationController } from './recommendation.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Recommendation } from './entities/recommendation.entity';
import { User } from 'src/user/entities/user.entity';

@Module({
  imports:[TypeOrmModule.forFeature([Recommendation]),TypeOrmModule.forFeature([User])],
  controllers: [RecommendationController],
  providers: [RecommendationService]
})
export class RecommendationModule {}
