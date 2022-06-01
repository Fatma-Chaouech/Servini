/* eslint-disable prettier/prettier */
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Category } from 'src/category/entities/category.entity';
import { Repository } from 'typeorm';
import { CreateRequestDto } from './dto/create-request.dto';
import { UpdateRequestDto } from './dto/update-request.dto';
import { Request } from './entities/request.entity';

@Injectable()
export class RequestService {
  constructor(
    @InjectRepository(Request)
    private readonly requestRepository: Repository<Request>,
    @InjectRepository(Category)
    private readonly categoryRepository: Repository<Category>
  ) {}
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  async create(createRequestDto: CreateRequestDto) {

    try {
      return await this.requestRepository.save(createRequestDto);
    } catch (e) {
      console.log(e);
      throw new InternalServerErrorException();
    }
  }
  getRequestsByCategory(category:string){
    
    return this.requestRepository.find({category:`${category}`});
  }
 
  getRequestsByUser(username:string){
  
    return  this.requestRepository.find({user:`${username}`});
  }
  getRequestsByUserAndCategory(username:string,category:string){
  
    return  this.requestRepository.find({user:`${username}`,category:`${category}`});
  }

  findAll() {
    return `This action returns all request`;
  }

  findOne(id: number) {
    return `This action returns a #${id} request`;
  }

  update(id: number, updateRequestDto: UpdateRequestDto) {
    return `This action updates a #${id} request`;
  }

  remove(id: number) {
    return `This action removes a #${id} request`;
  }
}
