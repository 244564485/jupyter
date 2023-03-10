#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

#define SERVERIP "192.168.0.200"
#define PORT 8888
#define BUFFER_SIZE 512

int main(int argc, char *argv[]) {
    int sockfd;
    struct sockaddr_in server;
    char sendbuf[BUFFER_SIZE];
    bzero(&sendbuf, sizeof(sendbuf));
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    bzero(&server, sizeof(server));
    server.sin_family = AF_INET;
    server.sin_port = htons(PORT);
    server.sin_addr.s_addr = inet_addr(SERVERIP);

    if (connect(sockfd, (struct sockaddr *)&server, sizeof(struct sockaddr)) < 0) {
        perror("connect failed.\n");
        return -1;
    }
    while (1) {
        fgets(sendbuf, sizeof(sendbuf), stdin);
        send(sockfd, sendbuf, sizeof(sendbuf), 0);
        bzero(&sendbuf, sizeof(sendbuf));
    }
    close(sockfd);
    return 0;
}