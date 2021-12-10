import { Entity, Column, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: string

  @Column({nullable: true})
  firstname: string

  @Column({nullable: true})
  lastname: string

  @Column({nullable: false, unique: true})
  username: string

  @Column({nullable: false})
  password: string

  @Column({nullable: true, unique: true})
  email: string
}
