import {Injectable} from '@nestjs/common';
import {User} from "./user.entity";
import {InjectRepository} from "@nestjs/typeorm";
import {Repository} from "typeorm";

@Injectable()
export class UsersService {
  constructor(@InjectRepository(User) private userRepository: Repository<User>) {
  }

  getUser(): any {
    let user = new User()
    user.username = 'Amma';
    user.email = 'amma@amma.org'
    return user;
    // return 'users... from the backend';
  }

  createUser(firstname: string, lastname: string, username: string, password: string, email: string) {
    const user = this.userRepository.create({firstname, lastname, username, password, email})

    return this.userRepository.save(user);
  }
}
