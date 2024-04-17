#ifndef _BROPEN_EC_H_
#define _BROPEN_EC_H_

typedef enum
{
    BROPEN_EC_OK = 0,
    BROPEN_EC_KO,
    BROPEN_EC_UNSET,
    BROPEN_EC_INTERNAL_ERROR,
    BROPEN_EC_BUFFER_SIZE,
    BROPEN_EC_MEMORY,
    BROPEN_EC_UNSUPPORTED,
    BROPEN_EC_DATA_EOF = 100,
    BROPEN_EC_DATA_UNSUFFICIENT,
    BROPEN_EC_DATA_UNSUPPORTED_FORMAT,
    BROPEN_EC_DATA_UNSUPPORTED_HEADER,
    BROPEN_EC_COM_ERROR = 1000,
    BROPEN_EC_USB_ERROR = 2000
} bropen_ec_t;

#endif /* _BROPEN_EC_H_ */