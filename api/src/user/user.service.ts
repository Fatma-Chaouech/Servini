import { Injectable } from "@nestjs/common";
import { CrudService } from "../generics/crud";
import { User } from "./entities/user.entity";
import { Repository } from "typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { RegisterDto } from "../auth/dto/register.dto";
import * as bcrypt from "bcrypt";
import { v4 as uuidv4 } from 'uuid';

@Injectable()
export class UserService extends CrudService<User> {
  constructor(@InjectRepository(User) private userRepository: Repository<User>) {
    super(userRepository);
  }

  async create(registerDto: RegisterDto): Promise<User> {
    const user = this.userRepository.create(registerDto);
    user.salt = await bcrypt.genSalt();
    user.password = await bcrypt.hash(registerDto.password, user.salt);
    console.log(user);
    return this.userRepository.save(user);
  }

  async getUserByUserNameOrEmail(username: string,email: string,): Promise<User> {
    console.log('in getUserBy....');
    const user = await this.userRepository.findOne({
      where: [{ username }, { email }],
    });
    console.log(user);
    return user;
  }
}
