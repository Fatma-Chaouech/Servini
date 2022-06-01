/* eslint-disable prettier/prettier */
import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { OfferService } from './offer.service';
import { CreateOfferDto } from './dto/create-offer.dto';
import { UpdateOfferDto } from './dto/update-offer.dto';

@Controller('offer')
export class OfferController {
  constructor(private readonly offerService: OfferService) {}

  @Post()
  create(@Body() createOfferDto: CreateOfferDto) {
    return this.offerService.create(createOfferDto);
  }
  @Get('/category/:category')
  getByCategory(@Param('category') category: string) {
    return this.offerService.getOffersByCategory(category);
  }
  @Get('/username/:username')
  getByUsername(@Param('username') username: string) {
    return this.offerService.getOffersByUser(username);
  }
  @Get()
  findAll() {
    return this.offerService.findAll();
  }
 
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.offerService.findOne(+id);
  }
  
  @Patch(':id')
  update(@Param('id') id: string, @Body() updateOfferDto: UpdateOfferDto) {
    return this.offerService.update(+id, updateOfferDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.offerService.remove(+id);
  }
}
