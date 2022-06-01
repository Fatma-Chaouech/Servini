import { Body, Controller, Post } from "@nestjs/common";
import { AuthService } from './auth.service';
import { User } from '../user/entities/user.entity';
import { RegisterDto } from './dto/register.dto';
import { CredenialsDto } from "./dto/credenials.dto";
import { LoginResponeDto } from "./dto/login-respone.dto";

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('register')
  register(@Body() registerDto: RegisterDto): Promise<User> {
    return this.authService.register(registerDto);
  }
  @Post('login')
  login(@Body() credentialsDto: CredenialsDto): Promise<LoginResponeDto> {
    return this.authService.login(credentialsDto);
  }
}
