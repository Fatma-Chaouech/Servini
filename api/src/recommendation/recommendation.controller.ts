/* eslint-disable prettier/prettier */
import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { RecommendationService } from './recommendation.service';
import { CreateRecommendationDto } from './dto/create-recommendation.dto';
import { UpdateRecommendationDto } from './dto/update-recommendation.dto';

@Controller('recommendation')
export class RecommendationController {
  
  constructor(private readonly recommendationService: RecommendationService) {}

  @Post()
  create(@Body() createRecommendationDto: CreateRecommendationDto) {
    return this.recommendationService.create(createRecommendationDto);
  }

  @Get()
  findAll() {
    return this.recommendationService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.recommendationService.findOne(+id);
  }
  @Get('/user/:username')
  getRecommendationsByUser(@Param('username') username: string) {
    return this.recommendationService.getRecommendationsByUsername(username);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateRecommendationDto: UpdateRecommendationDto) {
    return this.recommendationService.update(+id, updateRecommendationDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.recommendationService.remove(+id);
  }
}
