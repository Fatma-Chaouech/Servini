/* eslint-disable prettier/prettier */
import { InternalServerErrorException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Category } from 'src/category/entities/category.entity';
import { User } from 'src/user/entities/user.entity';
import { Repository } from 'typeorm';
import { CreateOfferDto } from './dto/create-offer.dto';
import { UpdateOfferDto } from './dto/update-offer.dto';
import { Offer } from './entities/offer.entity';

@Injectable()
export class OfferService {
  constructor(
    @InjectRepository(Offer)
    private readonly offerRepository: Repository<Offer>,
    @InjectRepository(Category)
    private readonly categoryRepository: Repository<Category>,
    @InjectRepository(User)
    private readonly userRepository: Repository<User>
  ) {}
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  async create(createOfferDto: CreateOfferDto) {

    try {
      return await this.offerRepository.save(createOfferDto);
    } catch (e) {
      console.log(e);
      throw new InternalServerErrorException();
    }
  }

  findAll() {
    return this.offerRepository.find();
  }
   getOffersByCategory(category:string){
  
    return  this.offerRepository.find({category:`${category}`});
  }

  getOffersByUser(username:string){
  
    return  this.offerRepository.find({user:`${username}`});
  }
  getOffersByUserAndCategory(username:string,category:string){
  
    return  this.offerRepository.find({user:`${username}`,category:`${category}`});
  }

  findOne(id: number) {
    return `This action returns a #${id} offer`;
  }

  update(id: number, updateOfferDto: UpdateOfferDto) {
    return `This action updates a #${id} offer`;
  }

  remove(id: number) {
    return `This action removes a #${id} offer`;
  }
}
