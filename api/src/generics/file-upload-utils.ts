import { v4 as uuidv4 } from 'uuid';

export const editFileName = (req, file, callback) => {
  const randomName = uuidv4() + file.originalname;
  callback(null, randomName);
};

export const imageFileFilter = (req, file, callback) => {
  if (!file.originalname.match(/\.(jpg|jpeg|png|gif)$/)) {
    return callback(new Error('Only image files are allowed!'), false);
  }
  callback(null, true);
};
