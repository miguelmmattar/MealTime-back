export type User = {
    id: number,
    name: string,
    email:string,
    password: string,
    confirmPassword?: string
}

export type NewUser = Omit<User, "id">