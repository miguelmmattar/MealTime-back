type StatusCode = {
    OK: number,
    CREATED: number,
    NO_CONTENT: number,
    BAD_REQUEST: number,
    NOT_FOUND: number,
    UNAUTHORIZED: number,
    FORBIDDEN: number,
    CONFLICT: number,
    UNPROCESSABLE_ENTITY: number,
    SERVER_ERROR: number,
}

const STATUS_CODE: StatusCode = Object.freeze({
    OK: 200,
    CREATED: 201,
    NO_CONTENT: 204,
    BAD_REQUEST: 400,
    NOT_FOUND: 404,
    UNAUTHORIZED: 401,
    FORBIDDEN: 403,
    CONFLICT: 409,
    UNPROCESSABLE_ENTITY: 422,
    SERVER_ERROR: 500,
  });
  
  export { STATUS_CODE };