export type SessionEntity = {
    id: number,
    userId: number,
    token: string,
    createdAt: string,
    closedAt: string
}

export type Session = Pick<SessionEntity, "userId" | "token">