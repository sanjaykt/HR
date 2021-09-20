import {Controller, Get} from '@nestjs/common';
import {UsersService} from "./users.service";

@Controller('users')
export class UsersController {
  constructor(private readonly usersServer: UsersService) {}

  @Get()
  getUser(): string {
    return this.usersServer.getUser();
  }
}
