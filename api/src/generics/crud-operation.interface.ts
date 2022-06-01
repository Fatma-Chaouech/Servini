export interface CrudOperations<T, ID> {
  create(t: T): Promise<T>;
  update(id: ID, t: T): Promise<T>;
  findOne(id: ID): Promise<T>;
  findAll(): Promise<T[]>;
  remove(id: ID): Promise<any>;
}
