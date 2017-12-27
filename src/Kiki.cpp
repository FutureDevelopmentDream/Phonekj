#include<stdio.h>
#include <WinSock2.h>



void InitSock()
{

}

void FinSock()
{

}

int main_f_Sock()
{
	WSADATA wsa;

	printf("\nInitialising Winsock...");
	if (WSAStartup(MAKEWORD(2, 2), &wsa) != 0)
	{
		printf("Failed. Error Code : %d", WSAGetLastError());
		return 1;
	}

	printf("Initialised.");

	return 0;
}