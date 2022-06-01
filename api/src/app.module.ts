import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { User } from './user/entities/user.entity';
import { UserModule } from './user/user.module';
import { MessagesModule } from './messages/messages.module';

@Module({
  imports: [
    UserModule,
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      port: 3306,
      username: 'root',
      password: null,
      database: 'servini',
      entities: [User],
      synchronize: true,
    }),
    AuthModule,
    MessagesModule,  
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
