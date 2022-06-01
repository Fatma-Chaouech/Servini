/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { OfferModule } from './offer/offer.module';
import { CategoryModule } from './category/category.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RequestModule } from './request/request.module';
import { UserModule } from './user/user.module';
import { RecommendationModule } from './recommendation/recommendation.module';
import { AuthModule } from './auth/auth.module';

@Module({
  imports: [OfferModule, CategoryModule,
    TypeOrmModule.forRoot({
    type: 'mysql',
    host: 'localhost',
    port: 3306,
    username: 'root',
    password: '',
    database: 'servini',
    autoLoadEntities: true,
    synchronize: true,
    // debug: true,
  }),
    RequestModule,
    UserModule,
    AuthModule,
    RecommendationModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
