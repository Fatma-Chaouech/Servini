import {
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { User } from '../user/entities/user.entity';
import { RegisterDto } from './dto/register.dto';
import { UserService } from '../user/user.service';
import { CredenialsDto } from './dto/credenials.dto';
import * as bcrypt from 'bcrypt';
import { JwtPayloadDto } from './dto/jwt-payload.dto';
import { JwtService } from '@nestjs/jwt';
import { LoginResponeDto } from "./dto/login-respone.dto";
@Injectable()
export class AuthService {

  constructor(private userService: UserService,private jwtService: JwtService) {}

  async register(registerDto: RegisterDto): Promise<User> {
    const {email,username} = registerDto;
    let user = await this.userService.getUserByUserNameOrEmail(username, email);
    if (user) {
      throw new UnauthorizedException('You already have an account');
    }
    user = await this.userService.create(registerDto);
    delete user.password;
    delete user.salt;
    return user;
  }

  async login(credentialsDto: CredenialsDto): Promise<LoginResponeDto> {
    const { email, password } = credentialsDto;
    const user = await this.userService.getUserByUserNameOrEmail(
      email,
      email,
    );
    if (!user) {
      throw new UnauthorizedException('Veuillez vérifier vos credentials');
    }
    const isLoggedIn = await bcrypt.compare(password, user.password);
    if (!isLoggedIn) {
      throw new UnauthorizedException('Veuillez vérifier vos credentials');
    }
    const payload: JwtPayloadDto = {
      username: user.username,
      email: user.email,
    };
    const jwt = this.jwtService.sign(payload);
    return { jwt };
  }
}
