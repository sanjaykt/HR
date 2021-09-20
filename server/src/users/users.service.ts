import { Injectable } from '@nestjs/common';
import {User} from "./user.entity";

@Injectable()
export class UsersService {
  getUser(): any {
    let user = new User()
    user.username = 'Amma';
    user.email = 'amma@amma.org'
    return user;
    // return 'users... from the backend';
  }
}
