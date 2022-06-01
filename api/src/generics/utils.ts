import { SelectQueryBuilder } from 'typeorm';

export function paginate(
  qb: SelectQueryBuilder<any>,
  page?: number,
  number?: number,
) {
  console.log('i am paginating', page, number);

  if (number) {
    if (!page) page = 1;
    qb.skip((page - 1) * number);
    qb.take(number);
  }
}

export function setDateInterval(
    qb: SelectQueryBuilder<any>,
    dateName: string, 
    startDate: Date, 
    endDate: Date) {
    if (startDate) {
        qb.andWhere(`${dateName} >= :startDate`, { startDate });
    }
    if (endDate) {
        qb.andWhere(`${dateName} <= :endDate`, { endDate });
    }
}
