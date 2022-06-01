import { RegisterDto } from "../auth/dto/register.dto";
import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Offer } from 'src/offer/entities/offer.entity';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { User } from './entities/user.entity';
import * as bcrypt from "bcrypt";


@Injectable()
export class UserService {
  constructor(
    @InjectRepository(Offer)
    private readonly offerRepository: Repository<Offer>,

    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {}
    async create(registerDto: RegisterDto): Promise<User> {
      const user = this.userRepository.create(registerDto);
      user.salt = await bcrypt.genSalt();
      user.password = await bcrypt.hash(registerDto.password, user.salt);
      console.log(user);
      return this.userRepository.save(user);
    }

  findAll() {
   return this.userRepository.find();
  }

  findOne(username:string) {
    return this.userRepository.findOne({username:`${username}`});
  }

  async update(username: string, updateUserDto: UpdateUserDto) {
    const newUser = await this.userRepository.preload({ username, ...updateUserDto });
    if (newUser) {
      return this.userRepository.save(newUser);
    } else {
      throw new NotFoundException(`Le User n'existe pas `);
    }

  }


  findNbUsers(nb:number){
    return this.userRepository.find({take:nb, order:{
      rating:"DESC"
    }});
  }
  remove(id: number) {
    return `This action removes a #${id} user`;
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
