import { DeepPartial, Repository } from 'typeorm';
import { Injectable, NotFoundException } from '@nestjs/common';

@Injectable()
export class CrudService<T> {
  constructor(private readonly repositoy: Repository<T>) {}
  create(entity): Promise<T> {
    return this.repositoy.save(entity);
  }

  findAll(): Promise<T[]> {
    return this.repositoy.find();
  }

  findOne(id: number): Promise<T> {
    // @ts-ignore
    return this.repositoy.findOne(id);
  }

  async update(id: number, entity): Promise<(DeepPartial<T> & T)[]> {
    const newEntity = await this.repositoy.preload({ id, ...entity });
    if (newEntity) {
      // @ts-ignore
      return this.repositoy.save(newEntity);
    } else {
      throw new NotFoundException(`id ${id} n'existe pas `);
    }
  }

  async remove(id: number): Promise<any> {
    const deletedResponse = await await this.repositoy.softDelete(id);
    if (!deletedResponse?.affected) {
      throw new NotFoundException();
    }
    return deletedResponse;
  }
  async restore(id: number): Promise<any> {
    const restoreResponse = await this.repositoy.restore(id);
    if (!restoreResponse?.affected) {
      throw new NotFoundException();
    }
    return restoreResponse;
  }
}

