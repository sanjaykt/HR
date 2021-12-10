import {Body, Controller, Get, Post} from '@nestjs/common';
import {UsersService} from "./users.service";

@Controller('users')
export class UsersController {
  constructor(private readonly usersServer: UsersService) {
  }

  @Get()
  getUser(): string {
    return this.usersServer.getUser();
  }

  @Post()
  async createUser(@Body() body: any) {
    const user = await this.usersServer.createUser(body.firstname, body.lastname, body.username, body.password, body.email);
    return user;
  }
}
